#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
using namespace llvm;

struct MyPass : public PassInfoMixin<MyPass> {
    Type *voidType;
    Type *int8PtrTy;

    bool isFuncLogger(StringRef name) {
        return name == "usageLogger";
    }

    void insertUsageCall(Instruction &user, Instruction &operand, FunctionCallee &usageLogFunc, IRBuilder<> &builder) {
        Value *userName = builder.CreateGlobalStringPtr(user.getOpcodeName());
        Value *operandName = builder.CreateGlobalStringPtr(operand.getOpcodeName());
        Value *args[] = {userName, operandName};
        builder.CreateCall(usageLogFunc, args);
    }

    bool insertUsageLog(Module &M, Function &F, FunctionCallee &usageLogFunc, IRBuilder<> &builder) {
        bool inserted = false;

        for (auto &B: F) {
            for (auto &user: B) {
                if (dyn_cast<PHINode>(&user)) {
                    continue;
                }
                for (auto &O: user.operands()) {
                    if (auto *operand = dyn_cast<Instruction>(O.get())) {
                        builder.SetInsertPoint(&user);
                        if (auto *phi = dyn_cast<PHINode>(operand)) {
                            for (auto &OPhi: phi->operands()) {
                                if (auto *phiOperand = dyn_cast<Instruction>(OPhi.get())) {
                                    insertUsageCall(user, *phiOperand, usageLogFunc, builder);
                                    inserted = true;
                                }
                            }
                        } else {
                            insertUsageCall(user, *operand, usageLogFunc, builder);
                            inserted = true;
                        }
                    }
                }
            }
        }
        return inserted;
    }

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
        LLVMContext &Ctx = M.getContext();
        IRBuilder<> builder(Ctx);
        voidType = Type::getVoidTy(Ctx);
        int8PtrTy = Type::getInt8Ty(Ctx)->getPointerTo();

        Type *usageParamTypes[] = {int8PtrTy, int8PtrTy};
        FunctionType *usageFuncType =
                FunctionType::get(voidType, usageParamTypes, false);

        FunctionCallee usageLogFunc =
                M.getOrInsertFunction("usageLogger", usageFuncType);

        for (auto &F: M) {
            if (isFuncLogger(F.getName()) || F.isDeclaration()) {
                continue;
            }

            insertUsageLog(M, F, usageLogFunc, builder);
            bool isVerifyfFailed = verifyFunction(F, &outs());
            if (isVerifyfFailed) {
                outs() << "[VERIFICATION FAIL] " << F.getName() << "\n";
            }
        }
        return PreservedAnalyses::none();
    };
};

PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto, auto) {
            MPM.addPass(MyPass{});
            return true;
        });
    };

    return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
