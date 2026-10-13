; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.calculateFrame.vector_x = private unnamed_addr constant [8 x i32] [i32 0, i32 0, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 -1], align 16
@__const.calculateFrame.vector_y = private unnamed_addr constant [8 x i32] [i32 1, i32 -1, i32 0, i32 0, i32 1, i32 -1, i32 1, i32 -1], align 16
@0 = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@1 = private unnamed_addr constant [5 x i8] c"ashr\00", align 1
@2 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@3 = private unnamed_addr constant [7 x i8] c"switch\00", align 1
@4 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@5 = private unnamed_addr constant [5 x i8] c"sext\00", align 1
@6 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@7 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@8 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@9 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@10 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@11 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@12 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@13 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@14 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@15 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@16 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@17 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@18 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@19 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@20 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@21 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 0, 256) i32 @limitColor(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  call void @usageLogger(ptr @16, ptr @16)
  %3 = tail call i32 @llvm.umin.i32(i32 %2, i32 255)
  call void @usageLogger(ptr @0, ptr @16)
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local range(i32 0, -2147483648) i32 @calc_radius(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = sub nsw i32 %0, %2
  %6 = sub nsw i32 %1, %3
  call void @usageLogger(ptr @16, ptr @9)
  %7 = tail call i32 @llvm.abs.i32(i32 %5, i1 true)
  call void @usageLogger(ptr @16, ptr @9)
  %8 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  call void @usageLogger(ptr @16, ptr @16)
  call void @usageLogger(ptr @16, ptr @16)
  %9 = tail call i32 @llvm.umax.i32(i32 %7, i32 %8)
  call void @usageLogger(ptr @0, ptr @16)
  ret i32 %9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @update_radius(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef captures(none) %4) local_unnamed_addr #2 {
  %6 = sub nsw i32 %0, %2
  %7 = sub nsw i32 %1, %3
  call void @usageLogger(ptr @16, ptr @9)
  %8 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  call void @usageLogger(ptr @16, ptr @9)
  %9 = tail call i32 @llvm.abs.i32(i32 %7, i1 true)
  call void @usageLogger(ptr @16, ptr @16)
  call void @usageLogger(ptr @16, ptr @16)
  %10 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %8, i32 %9)
  %11 = load i32, ptr %4, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @16)
  call void @usageLogger(ptr @21, ptr @17)
  %12 = icmp sgt i32 %10, %11
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %12, label %13, label %14

13:                                               ; preds = %5
  call void @usageLogger(ptr @7, ptr @16)
  store i32 %10, ptr %4, align 4, !tbaa !5
  br label %14

14:                                               ; preds = %13, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 -32768, 32768) i32 @decode_x(i32 noundef %0) local_unnamed_addr #0 {
  %2 = ashr i32 %0, 16
  call void @usageLogger(ptr @0, ptr @1)
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 0, 65536) i32 @decode_y(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, 65535
  call void @usageLogger(ptr @0, ptr @2)
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local range(i32 0, 2) i32 @isInBorders(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i32 %0, 512
  %4 = icmp sgt i32 %1, -1
  call void @usageLogger(ptr @2, ptr @21)
  call void @usageLogger(ptr @2, ptr @21)
  %5 = and i1 %3, %4
  %6 = icmp samesign ult i32 %1, 512
  call void @usageLogger(ptr @13, ptr @2)
  call void @usageLogger(ptr @13, ptr @21)
  %7 = select i1 %5, i1 %6, i1 false
  call void @usageLogger(ptr @19, ptr @13)
  %8 = zext i1 %7 to i32
  call void @usageLogger(ptr @0, ptr @19)
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @safeGetUsed(ptr noundef readonly captures(none) %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = or i32 %2, %1
  call void @usageLogger(ptr @21, ptr @11)
  %5 = icmp ult i32 %4, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = zext nneg i32 %2 to i64
  %8 = zext nneg i32 %1 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %9 = getelementptr inbounds nuw [512 x i32], ptr %0, i64 %7, i64 %8
  call void @usageLogger(ptr @17, ptr @15)
  %10 = load i32, ptr %9, align 4, !tbaa !5
  br label %11

11:                                               ; preds = %3, %6
  %12 = phi i32 [ %10, %6 ], [ 0, %3 ]
  call void @usageLogger(ptr @0, ptr @17)
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @killWalker(i32 noundef %0, ptr noundef captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3) local_unnamed_addr #2 {
  %5 = load i32, ptr %1, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %6 = sext i32 %5 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %7 = getelementptr inbounds i32, ptr %2, i64 %6
  call void @usageLogger(ptr @17, ptr @15)
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = sext i32 %0 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %10 = getelementptr inbounds i32, ptr %2, i64 %9
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %8, ptr %10, align 4, !tbaa !5
  %11 = load i32, ptr %1, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %12 = sext i32 %11 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %13 = getelementptr inbounds i32, ptr %3, i64 %12
  call void @usageLogger(ptr @17, ptr @15)
  %14 = load i32, ptr %13, align 4, !tbaa !5
  call void @usageLogger(ptr @15, ptr @5)
  %15 = getelementptr inbounds i32, ptr %3, i64 %9
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %14, ptr %15, align 4, !tbaa !5
  %16 = load i32, ptr %1, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %17 = add nsw i32 %16, -1
  call void @usageLogger(ptr @7, ptr @18)
  store i32 %17, ptr %1, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local range(i32 0, 2) i32 @applyNearStatic(i32 noundef %0, i32 noundef %1, ptr noundef captures(none) %2, i32 noundef %3, i32 noundef %4, ptr noundef captures(none) %5) local_unnamed_addr #2 {
  %7 = or i32 %1, %0
  call void @usageLogger(ptr @21, ptr @11)
  %8 = icmp ult i32 %7, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = zext nneg i32 %1 to i64
  %11 = zext nneg i32 %0 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %12 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %10, i64 %11
  call void @usageLogger(ptr @17, ptr @15)
  %13 = load i32, ptr %12, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %14 = icmp eq i32 %13, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %14, label %15, label %105

15:                                               ; preds = %9, %6
  %16 = add nsw i32 %1, 1
  call void @usageLogger(ptr @11, ptr @18)
  %17 = or i32 %16, %0
  call void @usageLogger(ptr @21, ptr @11)
  %18 = icmp ult i32 %17, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %18, label %19, label %39

19:                                               ; preds = %15
  call void @usageLogger(ptr @19, ptr @18)
  %20 = zext nneg i32 %16 to i64
  %21 = zext nneg i32 %0 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %22 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %20, i64 %21
  call void @usageLogger(ptr @17, ptr @15)
  %23 = load i32, ptr %22, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %24 = icmp eq i32 %23, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %24, label %39, label %25

25:                                               ; preds = %99, %90, %81, %72, %63, %53, %43, %19
  %26 = phi i32 [ %103, %99 ], [ %94, %90 ], [ %85, %81 ], [ %76, %72 ], [ %67, %63 ], [ %57, %53 ], [ %47, %43 ], [ %23, %19 ]
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  %27 = add nsw i32 %26, 1
  %28 = sext i32 %1 to i64
  %29 = sext i32 %0 to i64
  call void @usageLogger(ptr @15, ptr @5)
  call void @usageLogger(ptr @15, ptr @5)
  %30 = getelementptr inbounds [512 x i32], ptr %2, i64 %28, i64 %29
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %27, ptr %30, align 4, !tbaa !5
  %31 = sub nsw i32 %0, %3
  %32 = sub nsw i32 %1, %4
  call void @usageLogger(ptr @16, ptr @9)
  %33 = tail call i32 @llvm.abs.i32(i32 %31, i1 true)
  call void @usageLogger(ptr @16, ptr @9)
  %34 = tail call i32 @llvm.abs.i32(i32 %32, i1 true)
  call void @usageLogger(ptr @16, ptr @16)
  call void @usageLogger(ptr @16, ptr @16)
  %35 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %33, i32 %34)
  %36 = load i32, ptr %5, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @16)
  call void @usageLogger(ptr @21, ptr @17)
  %37 = icmp sgt i32 %35, %36
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %37, label %38, label %105

38:                                               ; preds = %25
  call void @usageLogger(ptr @7, ptr @16)
  store i32 %35, ptr %5, align 4, !tbaa !5
  br label %105

39:                                               ; preds = %15, %19
  %40 = add nsw i32 %1, -1
  call void @usageLogger(ptr @11, ptr @18)
  %41 = or i32 %40, %0
  call void @usageLogger(ptr @21, ptr @11)
  %42 = icmp ult i32 %41, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %42, label %43, label %49

43:                                               ; preds = %39
  call void @usageLogger(ptr @19, ptr @18)
  %44 = zext nneg i32 %40 to i64
  %45 = zext nneg i32 %0 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %46 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %44, i64 %45
  call void @usageLogger(ptr @17, ptr @15)
  %47 = load i32, ptr %46, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %48 = icmp eq i32 %47, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %48, label %49, label %25

49:                                               ; preds = %43, %39
  %50 = add nsw i32 %0, 1
  call void @usageLogger(ptr @11, ptr @18)
  %51 = or i32 %1, %50
  call void @usageLogger(ptr @21, ptr @11)
  %52 = icmp ult i32 %51, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %52, label %53, label %59

53:                                               ; preds = %49
  %54 = zext nneg i32 %1 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %55 = zext nneg i32 %50 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %56 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %54, i64 %55
  call void @usageLogger(ptr @17, ptr @15)
  %57 = load i32, ptr %56, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %58 = icmp eq i32 %57, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %58, label %59, label %25

59:                                               ; preds = %53, %49
  %60 = add nsw i32 %0, -1
  call void @usageLogger(ptr @11, ptr @18)
  %61 = or i32 %1, %60
  call void @usageLogger(ptr @21, ptr @11)
  %62 = icmp ult i32 %61, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %62, label %63, label %69

63:                                               ; preds = %59
  %64 = zext nneg i32 %1 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %65 = zext nneg i32 %60 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %66 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %64, i64 %65
  call void @usageLogger(ptr @17, ptr @15)
  %67 = load i32, ptr %66, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %68 = icmp eq i32 %67, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %68, label %69, label %25

69:                                               ; preds = %63, %59
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  %70 = or i32 %16, %50
  call void @usageLogger(ptr @21, ptr @11)
  %71 = icmp ult i32 %70, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %71, label %72, label %78

72:                                               ; preds = %69
  call void @usageLogger(ptr @19, ptr @18)
  %73 = zext nneg i32 %16 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %74 = zext nneg i32 %50 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %75 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %73, i64 %74
  call void @usageLogger(ptr @17, ptr @15)
  %76 = load i32, ptr %75, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %77 = icmp eq i32 %76, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %77, label %78, label %25

78:                                               ; preds = %72, %69
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  %79 = or i32 %40, %50
  call void @usageLogger(ptr @21, ptr @11)
  %80 = icmp ult i32 %79, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %80, label %81, label %87

81:                                               ; preds = %78
  call void @usageLogger(ptr @19, ptr @18)
  %82 = zext nneg i32 %40 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %83 = zext nneg i32 %50 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %84 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %82, i64 %83
  call void @usageLogger(ptr @17, ptr @15)
  %85 = load i32, ptr %84, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %86 = icmp eq i32 %85, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %86, label %87, label %25

87:                                               ; preds = %81, %78
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  %88 = or i32 %16, %60
  call void @usageLogger(ptr @21, ptr @11)
  %89 = icmp ult i32 %88, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %89, label %90, label %96

90:                                               ; preds = %87
  call void @usageLogger(ptr @19, ptr @18)
  %91 = zext nneg i32 %16 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %92 = zext nneg i32 %60 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %93 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %91, i64 %92
  call void @usageLogger(ptr @17, ptr @15)
  %94 = load i32, ptr %93, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %95 = icmp eq i32 %94, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %95, label %96, label %25

96:                                               ; preds = %90, %87
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  %97 = or i32 %40, %60
  call void @usageLogger(ptr @21, ptr @11)
  %98 = icmp ult i32 %97, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %98, label %99, label %105

99:                                               ; preds = %96
  call void @usageLogger(ptr @19, ptr @18)
  %100 = zext nneg i32 %40 to i64
  call void @usageLogger(ptr @19, ptr @18)
  %101 = zext nneg i32 %60 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %102 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %100, i64 %101
  call void @usageLogger(ptr @17, ptr @15)
  %103 = load i32, ptr %102, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %104 = icmp eq i32 %103, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %104, label %105, label %25

105:                                              ; preds = %25, %38, %99, %96, %9
  %106 = phi i32 [ 1, %9 ], [ 1, %38 ], [ 1, %25 ], [ 0, %99 ], [ 0, %96 ]
  ret i32 %106
}

; Function Attrs: nounwind uwtable
define dso_local void @calculateFrame(ptr noundef captures(none) %0, ptr noundef captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef captures(none) %5, ptr noundef captures(none) %6) local_unnamed_addr #4 {
  %8 = tail call i32 @simHasClick() #9
  call void @usageLogger(ptr @21, ptr @16)
  %9 = icmp eq i32 %8, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %9, label %10, label %13

10:                                               ; preds = %26, %7
  %11 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %12 = icmp slt i32 %11, 399
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %12, label %29, label %83

13:                                               ; preds = %7, %26
  %14 = tail call i32 @simGetClick() #9
  call void @usageLogger(ptr @1, ptr @16)
  %15 = ashr i32 %14, 16
  call void @usageLogger(ptr @2, ptr @16)
  %16 = and i32 %14, 65535
  call void @usageLogger(ptr @18, ptr @1)
  %17 = add nsw i32 %15, -2
  call void @usageLogger(ptr @21, ptr @18)
  %18 = icmp ult i32 %17, 510
  call void @usageLogger(ptr @18, ptr @2)
  %19 = add nsw i32 %16, -2
  call void @usageLogger(ptr @21, ptr @18)
  %20 = icmp ult i32 %19, 510
  call void @usageLogger(ptr @13, ptr @21)
  call void @usageLogger(ptr @13, ptr @21)
  %21 = select i1 %18, i1 %20, i1 false
  call void @usageLogger(ptr @20, ptr @13)
  br i1 %21, label %22, label %26

22:                                               ; preds = %13
  call void @usageLogger(ptr @19, ptr @2)
  %23 = zext nneg i32 %16 to i64
  call void @usageLogger(ptr @19, ptr @1)
  %24 = zext nneg i32 %15 to i64
  call void @usageLogger(ptr @15, ptr @19)
  call void @usageLogger(ptr @15, ptr @19)
  %25 = getelementptr inbounds nuw [512 x i32], ptr %3, i64 %23, i64 %24
  call void @usageLogger(ptr @7, ptr @15)
  store i32 1, ptr %25, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @1)
  store i32 %15, ptr %4, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @2)
  store i32 %16, ptr %5, align 4, !tbaa !5
  store i32 0, ptr %6, align 4, !tbaa !5
  store i32 -1, ptr %2, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %22, %13
  %27 = tail call i32 @simHasClick() #9
  call void @usageLogger(ptr @21, ptr @16)
  %28 = icmp eq i32 %27, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %28, label %10, label %13, !llvm.loop !9

29:                                               ; preds = %10, %80
  %30 = load i32, ptr %6, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %31 = add nsw i32 %30, 6
  %32 = tail call i32 @simRand() #9
  call void @usageLogger(ptr @4, ptr @16)
  %33 = srem i32 %32, 4
  %34 = load i32, ptr %4, align 4, !tbaa !5
  call void @usageLogger(ptr @9, ptr @17)
  %35 = sub nsw i32 511, %34
  call void @usageLogger(ptr @16, ptr @9)
  call void @usageLogger(ptr @16, ptr @17)
  %36 = tail call i32 @llvm.smax.i32(i32 %35, i32 %34)
  %37 = load i32, ptr %5, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @17)
  call void @usageLogger(ptr @16, ptr @16)
  %38 = tail call i32 @llvm.smax.i32(i32 %37, i32 %36)
  call void @usageLogger(ptr @9, ptr @17)
  %39 = sub nsw i32 511, %37
  call void @usageLogger(ptr @16, ptr @9)
  call void @usageLogger(ptr @16, ptr @16)
  %40 = tail call i32 @llvm.smax.i32(i32 %39, i32 %38)
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @16)
  %41 = icmp sgt i32 %31, %40
  %42 = tail call i32 @simRand() #9
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %41, label %43, label %48

43:                                               ; preds = %29
  call void @usageLogger(ptr @4, ptr @16)
  %44 = srem i32 %42, 512
  call void @usageLogger(ptr @3, ptr @4)
  switch i32 %33, label %47 [
    i32 0, label %67
    i32 1, label %45
    i32 2, label %46
  ]

45:                                               ; preds = %43
  br label %67

46:                                               ; preds = %43
  br label %67

47:                                               ; preds = %43
  br label %67

48:                                               ; preds = %29
  call void @usageLogger(ptr @10, ptr @18)
  %49 = shl nsw i32 %31, 1
  call void @usageLogger(ptr @11, ptr @10)
  %50 = or disjoint i32 %49, 1
  call void @usageLogger(ptr @4, ptr @16)
  call void @usageLogger(ptr @4, ptr @11)
  %51 = srem i32 %42, %50
  call void @usageLogger(ptr @9, ptr @4)
  call void @usageLogger(ptr @9, ptr @18)
  %52 = sub nsw i32 %51, %31
  %53 = load i32, ptr %4, align 4, !tbaa !5
  %54 = load i32, ptr %5, align 4, !tbaa !5
  call void @usageLogger(ptr @3, ptr @4)
  switch i32 %33, label %64 [
    i32 0, label %55
    i32 1, label %58
    i32 2, label %61
  ]

55:                                               ; preds = %48
  call void @usageLogger(ptr @9, ptr @17)
  call void @usageLogger(ptr @9, ptr @18)
  %56 = sub nsw i32 %53, %31
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @9)
  %57 = add nsw i32 %54, %52
  br label %67

58:                                               ; preds = %48
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @18)
  %59 = add nsw i32 %53, %31
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @9)
  %60 = add nsw i32 %54, %52
  br label %67

61:                                               ; preds = %48
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @9)
  %62 = add nsw i32 %53, %52
  call void @usageLogger(ptr @9, ptr @17)
  call void @usageLogger(ptr @9, ptr @18)
  %63 = sub nsw i32 %54, %31
  br label %67

64:                                               ; preds = %48
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @9)
  %65 = add nsw i32 %53, %52
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @18)
  %66 = add nsw i32 %54, %31
  br label %67

67:                                               ; preds = %55, %61, %64, %58, %46, %47, %45, %43
  %68 = phi i32 [ %44, %45 ], [ 0, %46 ], [ 511, %47 ], [ %44, %43 ], [ %57, %55 ], [ %60, %58 ], [ %63, %61 ], [ %66, %64 ]
  %69 = phi i32 [ 511, %45 ], [ %44, %46 ], [ %44, %47 ], [ %33, %43 ], [ %56, %55 ], [ %59, %58 ], [ %62, %61 ], [ %65, %64 ]
  call void @usageLogger(ptr @11, ptr @4)
  call void @usageLogger(ptr @11, ptr @4)
  call void @usageLogger(ptr @11, ptr @4)
  call void @usageLogger(ptr @11, ptr @9)
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @4)
  call void @usageLogger(ptr @11, ptr @4)
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @9)
  call void @usageLogger(ptr @11, ptr @18)
  %70 = or i32 %69, %68
  call void @usageLogger(ptr @21, ptr @11)
  %71 = icmp ult i32 %70, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %71, label %72, label %80, !llvm.loop !11

72:                                               ; preds = %67
  %73 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %74 = add nsw i32 %73, 1
  call void @usageLogger(ptr @7, ptr @18)
  store i32 %74, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @18)
  %75 = sext i32 %74 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %76 = getelementptr inbounds i32, ptr %0, i64 %75
  call void @usageLogger(ptr @7, ptr @4)
  call void @usageLogger(ptr @7, ptr @4)
  call void @usageLogger(ptr @7, ptr @4)
  call void @usageLogger(ptr @7, ptr @9)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %69, ptr %76, align 4, !tbaa !5
  %77 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %78 = sext i32 %77 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %79 = getelementptr inbounds i32, ptr %1, i64 %78
  call void @usageLogger(ptr @7, ptr @4)
  call void @usageLogger(ptr @7, ptr @4)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @9)
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %68, ptr %79, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %67, %72
  %81 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @21, ptr @17)
  %82 = icmp slt i32 %81, 399
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %82, label %29, label %83

83:                                               ; preds = %80, %10
  %84 = phi i32 [ %11, %10 ], [ %81, %80 ]
  br label %85

85:                                               ; preds = %83, %90
  %86 = phi i32 [ %91, %90 ], [ %84, %83 ]
  %87 = phi i32 [ %92, %90 ], [ 0, %83 ]
  call void @usageLogger(ptr @21, ptr @6)
  call void @usageLogger(ptr @21, ptr @6)
  %88 = icmp slt i32 %86, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %88, label %90, label %94

89:                                               ; preds = %90
  ret void

90:                                               ; preds = %151, %85
  %91 = phi i32 [ %86, %85 ], [ %152, %151 ]
  call void @usageLogger(ptr @18, ptr @18)
  %92 = add nuw nsw i32 %87, 1
  call void @usageLogger(ptr @21, ptr @18)
  %93 = icmp eq i32 %92, 32
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %93, label %89, label %85, !llvm.loop !12

94:                                               ; preds = %85, %151
  %95 = phi i32 [ %153, %151 ], [ 0, %85 ]
  %96 = tail call i32 @simRand() #9
  call void @usageLogger(ptr @4, ptr @16)
  %97 = srem i32 %96, 8
  call void @usageLogger(ptr @5, ptr @6)
  %98 = sext i32 %95 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %99 = getelementptr inbounds i32, ptr %0, i64 %98
  call void @usageLogger(ptr @17, ptr @15)
  %100 = load i32, ptr %99, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @4)
  %101 = sext i32 %97 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %102 = getelementptr inbounds [8 x i32], ptr @__const.calculateFrame.vector_x, i64 0, i64 %101
  call void @usageLogger(ptr @17, ptr @15)
  %103 = load i32, ptr %102, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  %104 = add nsw i32 %103, %100
  call void @usageLogger(ptr @15, ptr @5)
  %105 = getelementptr inbounds i32, ptr %1, i64 %98
  call void @usageLogger(ptr @17, ptr @15)
  %106 = load i32, ptr %105, align 4, !tbaa !5
  call void @usageLogger(ptr @15, ptr @5)
  %107 = getelementptr inbounds [8 x i32], ptr @__const.calculateFrame.vector_y, i64 0, i64 %101
  call void @usageLogger(ptr @17, ptr @15)
  %108 = load i32, ptr %107, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  call void @usageLogger(ptr @18, ptr @17)
  %109 = add nsw i32 %108, %106
  call void @usageLogger(ptr @11, ptr @18)
  call void @usageLogger(ptr @11, ptr @18)
  %110 = or i32 %109, %104
  call void @usageLogger(ptr @21, ptr @11)
  %111 = icmp ult i32 %110, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %111, label %112, label %123

112:                                              ; preds = %94
  %113 = load i32, ptr %6, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %114 = add nsw i32 %113, 24
  %115 = load i32, ptr %4, align 4, !tbaa !5
  %116 = load i32, ptr %5, align 4, !tbaa !5
  call void @usageLogger(ptr @9, ptr @18)
  call void @usageLogger(ptr @9, ptr @17)
  %117 = sub nsw i32 %104, %115
  call void @usageLogger(ptr @9, ptr @18)
  call void @usageLogger(ptr @9, ptr @17)
  %118 = sub nsw i32 %109, %116
  call void @usageLogger(ptr @16, ptr @9)
  %119 = tail call i32 @llvm.abs.i32(i32 %117, i1 true)
  call void @usageLogger(ptr @16, ptr @9)
  %120 = tail call i32 @llvm.abs.i32(i32 %118, i1 true)
  call void @usageLogger(ptr @16, ptr @16)
  call void @usageLogger(ptr @16, ptr @16)
  %121 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %119, i32 %120)
  call void @usageLogger(ptr @21, ptr @16)
  call void @usageLogger(ptr @21, ptr @18)
  %122 = icmp sgt i32 %121, %114
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %122, label %123, label %134

123:                                              ; preds = %112, %94
  %124 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %125 = sext i32 %124 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %126 = getelementptr inbounds i32, ptr %0, i64 %125
  call void @usageLogger(ptr @17, ptr @15)
  %127 = load i32, ptr %126, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %127, ptr %99, align 4, !tbaa !5
  %128 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %129 = sext i32 %128 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %130 = getelementptr inbounds i32, ptr %1, i64 %129
  call void @usageLogger(ptr @17, ptr @15)
  %131 = load i32, ptr %130, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %131, ptr %105, align 4, !tbaa !5
  %132 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %133 = add nsw i32 %132, -1
  call void @usageLogger(ptr @7, ptr @18)
  store i32 %133, ptr %2, align 4, !tbaa !5
  br label %151

134:                                              ; preds = %112
  call void @usageLogger(ptr @16, ptr @18)
  call void @usageLogger(ptr @16, ptr @18)
  call void @usageLogger(ptr @16, ptr @17)
  call void @usageLogger(ptr @16, ptr @17)
  %135 = tail call i32 @applyNearStatic(i32 noundef %104, i32 noundef %109, ptr noundef %3, i32 noundef %115, i32 noundef %116, ptr noundef nonnull %6)
  call void @usageLogger(ptr @21, ptr @16)
  %136 = icmp eq i32 %135, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %136, label %148, label %137

137:                                              ; preds = %134
  %138 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %139 = sext i32 %138 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %140 = getelementptr inbounds i32, ptr %0, i64 %139
  call void @usageLogger(ptr @17, ptr @15)
  %141 = load i32, ptr %140, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %141, ptr %99, align 4, !tbaa !5
  %142 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @5, ptr @17)
  %143 = sext i32 %142 to i64
  call void @usageLogger(ptr @15, ptr @5)
  %144 = getelementptr inbounds i32, ptr %1, i64 %143
  call void @usageLogger(ptr @17, ptr @15)
  %145 = load i32, ptr %144, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @17)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %145, ptr %105, align 4, !tbaa !5
  %146 = load i32, ptr %2, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @17)
  %147 = add nsw i32 %146, -1
  call void @usageLogger(ptr @7, ptr @18)
  store i32 %147, ptr %2, align 4, !tbaa !5
  br label %151

148:                                              ; preds = %134
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %104, ptr %99, align 4, !tbaa !5
  call void @usageLogger(ptr @7, ptr @18)
  call void @usageLogger(ptr @7, ptr @15)
  store i32 %109, ptr %105, align 4, !tbaa !5
  call void @usageLogger(ptr @18, ptr @6)
  %149 = add nsw i32 %95, 1
  %150 = load i32, ptr %2, align 4, !tbaa !5
  br label %151

151:                                              ; preds = %137, %148, %123
  %152 = phi i32 [ %133, %123 ], [ %147, %137 ], [ %150, %148 ]
  %153 = phi i32 [ %95, %123 ], [ %95, %137 ], [ %149, %148 ]
  call void @usageLogger(ptr @21, ptr @6)
  call void @usageLogger(ptr @21, ptr @6)
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @17)
  %154 = icmp sgt i32 %153, %152
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %154, label %90, label %94, !llvm.loop !13
}

declare i32 @simHasClick() local_unnamed_addr #5

declare i32 @simGetClick() local_unnamed_addr #5

declare i32 @simRand() local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @drawFrame(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, i32 noundef %2, ptr noundef readonly captures(none) %3) local_unnamed_addr #4 {
  br label %5

5:                                                ; preds = %4, %13
  %6 = phi i64 [ 0, %4 ], [ %14, %13 ]
  call void @usageLogger(ptr @12, ptr @18)
  %7 = trunc nuw nsw i64 %6 to i32
  br label %16

8:                                                ; preds = %13
  %9 = icmp slt i32 %2, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %9, label %42, label %10

10:                                               ; preds = %8
  %11 = add nuw i32 %2, 1
  call void @usageLogger(ptr @19, ptr @18)
  %12 = zext i32 %11 to i64
  br label %43

13:                                               ; preds = %16
  call void @usageLogger(ptr @18, ptr @18)
  %14 = add nuw nsw i64 %6, 1
  call void @usageLogger(ptr @21, ptr @18)
  %15 = icmp eq i64 %14, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %15, label %8, label %5, !llvm.loop !14

16:                                               ; preds = %5, %16
  %17 = phi i64 [ 0, %5 ], [ %40, %16 ]
  call void @usageLogger(ptr @15, ptr @18)
  call void @usageLogger(ptr @15, ptr @18)
  %18 = getelementptr inbounds nuw [512 x i32], ptr %3, i64 %6, i64 %17
  call void @usageLogger(ptr @17, ptr @15)
  %19 = load i32, ptr %18, align 4, !tbaa !5
  call void @usageLogger(ptr @10, ptr @17)
  %20 = shl nsw i32 %19, 3
  call void @usageLogger(ptr @16, ptr @10)
  %21 = tail call i32 @llvm.smax.i32(i32 %20, i32 -20)
  call void @usageLogger(ptr @18, ptr @16)
  %22 = add nsw i32 %21, 20
  call void @usageLogger(ptr @16, ptr @18)
  %23 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %22, i32 255)
  call void @usageLogger(ptr @8, ptr @17)
  %24 = mul nsw i32 %19, 3
  call void @usageLogger(ptr @16, ptr @8)
  %25 = tail call i32 @llvm.smax.i32(i32 %24, i32 -30)
  call void @usageLogger(ptr @18, ptr @16)
  %26 = add nsw i32 %25, 30
  call void @usageLogger(ptr @16, ptr @18)
  %27 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %26, i32 255)
  call void @usageLogger(ptr @10, ptr @17)
  %28 = shl nsw i32 %19, 1
  call void @usageLogger(ptr @9, ptr @10)
  %29 = sub nsw i32 80, %28
  call void @usageLogger(ptr @16, ptr @9)
  %30 = tail call i32 @llvm.smax.i32(i32 %29, i32 0)
  call void @usageLogger(ptr @16, ptr @16)
  %31 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %30, i32 255)
  call void @usageLogger(ptr @21, ptr @17)
  %32 = icmp eq i32 %19, 0
  call void @usageLogger(ptr @10, ptr @16)
  %33 = shl nuw nsw i32 %23, 16
  call void @usageLogger(ptr @10, ptr @16)
  %34 = shl nuw nsw i32 %27, 8
  call void @usageLogger(ptr @11, ptr @10)
  call void @usageLogger(ptr @11, ptr @10)
  %35 = or disjoint i32 %33, %34
  call void @usageLogger(ptr @11, ptr @11)
  call void @usageLogger(ptr @11, ptr @16)
  %36 = or disjoint i32 %35, %31
  call void @usageLogger(ptr @11, ptr @11)
  %37 = or disjoint i32 %36, -16777216
  call void @usageLogger(ptr @13, ptr @21)
  call void @usageLogger(ptr @13, ptr @11)
  %38 = select i1 %32, i32 -16777216, i32 %37
  call void @usageLogger(ptr @12, ptr @18)
  %39 = trunc nuw nsw i64 %17 to i32
  call void @usageLogger(ptr @16, ptr @12)
  call void @usageLogger(ptr @16, ptr @12)
  call void @usageLogger(ptr @16, ptr @13)
  tail call void @simPutPixel(i32 noundef %39, i32 noundef %7, i32 noundef %38) #9
  call void @usageLogger(ptr @18, ptr @18)
  %40 = add nuw nsw i64 %17, 1
  call void @usageLogger(ptr @21, ptr @18)
  %41 = icmp eq i64 %40, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %41, label %13, label %16, !llvm.loop !15

42:                                               ; preds = %43, %8
  ret void

43:                                               ; preds = %10, %43
  %44 = phi i64 [ 0, %10 ], [ %49, %43 ]
  call void @usageLogger(ptr @15, ptr @18)
  %45 = getelementptr inbounds nuw i32, ptr %0, i64 %44
  call void @usageLogger(ptr @17, ptr @15)
  %46 = load i32, ptr %45, align 4, !tbaa !5
  call void @usageLogger(ptr @15, ptr @18)
  %47 = getelementptr inbounds nuw i32, ptr %1, i64 %44
  call void @usageLogger(ptr @17, ptr @15)
  %48 = load i32, ptr %47, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @17)
  call void @usageLogger(ptr @16, ptr @17)
  tail call void @simPutPixel(i32 noundef %46, i32 noundef %48, i32 noundef -3618616) #9
  call void @usageLogger(ptr @18, ptr @18)
  %49 = add nuw nsw i64 %44, 1
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @19)
  %50 = icmp eq i64 %49, %12
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %50, label %42, label %43, !llvm.loop !16
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #6 {
  %1 = alloca [512 x [512 x i32]], align 16
  %2 = alloca [400 x i32], align 16
  %3 = alloca [400 x i32], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 1048576, ptr nonnull %1) #9
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1048576) %1, i8 0, i64 1048576, i1 false)
  call void @usageLogger(ptr @15, ptr @14)
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 527364
  call void @usageLogger(ptr @7, ptr @15)
  store i32 1, ptr %8, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 1600, ptr nonnull %2) #9
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %2, i8 0, i64 1600, i1 false)
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 1600, ptr nonnull %3) #9
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %3, i8 0, i64 1600, i1 false)
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #9
  call void @usageLogger(ptr @7, ptr @14)
  store i32 -1, ptr %4, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #9
  call void @usageLogger(ptr @7, ptr @14)
  store i32 257, ptr %5, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #9
  call void @usageLogger(ptr @7, ptr @14)
  store i32 257, ptr %6, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @14)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #9
  call void @usageLogger(ptr @7, ptr @14)
  store i32 0, ptr %7, align 4, !tbaa !5
  br label %9

9:                                                ; preds = %56, %0
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @usageLogger(ptr @16, ptr @14)
  call void @calculateFrame(ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %1, ptr noundef nonnull %5, ptr noundef nonnull %6, ptr noundef nonnull %7)
  call void @usageLogger(ptr @17, ptr @14)
  %10 = load i32, ptr %4, align 4, !tbaa !5
  br label %11

11:                                               ; preds = %19, %9
  %12 = phi i64 [ 0, %9 ], [ %20, %19 ]
  call void @usageLogger(ptr @12, ptr @18)
  %13 = trunc nuw nsw i64 %12 to i32
  br label %22

14:                                               ; preds = %19
  call void @usageLogger(ptr @21, ptr @17)
  %15 = icmp slt i32 %10, 0
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %15, label %56, label %16

16:                                               ; preds = %14
  call void @usageLogger(ptr @18, ptr @17)
  %17 = add nuw i32 %10, 1
  call void @usageLogger(ptr @19, ptr @18)
  %18 = zext i32 %17 to i64
  br label %48

19:                                               ; preds = %22
  call void @usageLogger(ptr @18, ptr @18)
  %20 = add nuw nsw i64 %12, 1
  call void @usageLogger(ptr @21, ptr @18)
  %21 = icmp eq i64 %20, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %21, label %14, label %11, !llvm.loop !14

22:                                               ; preds = %22, %11
  %23 = phi i64 [ 0, %11 ], [ %46, %22 ]
  call void @usageLogger(ptr @15, ptr @14)
  call void @usageLogger(ptr @15, ptr @18)
  call void @usageLogger(ptr @15, ptr @18)
  %24 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %12, i64 %23
  call void @usageLogger(ptr @17, ptr @15)
  %25 = load i32, ptr %24, align 4, !tbaa !5
  call void @usageLogger(ptr @10, ptr @17)
  %26 = shl nsw i32 %25, 3
  call void @usageLogger(ptr @16, ptr @10)
  %27 = tail call i32 @llvm.smax.i32(i32 %26, i32 -20)
  call void @usageLogger(ptr @18, ptr @16)
  %28 = add nsw i32 %27, 20
  call void @usageLogger(ptr @16, ptr @18)
  %29 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %28, i32 255)
  call void @usageLogger(ptr @8, ptr @17)
  %30 = mul nsw i32 %25, 3
  call void @usageLogger(ptr @16, ptr @8)
  %31 = tail call i32 @llvm.smax.i32(i32 %30, i32 -30)
  call void @usageLogger(ptr @18, ptr @16)
  %32 = add nsw i32 %31, 30
  call void @usageLogger(ptr @16, ptr @18)
  %33 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %32, i32 255)
  call void @usageLogger(ptr @10, ptr @17)
  %34 = shl nsw i32 %25, 1
  call void @usageLogger(ptr @9, ptr @10)
  %35 = sub nsw i32 80, %34
  call void @usageLogger(ptr @16, ptr @9)
  %36 = tail call i32 @llvm.smax.i32(i32 %35, i32 0)
  call void @usageLogger(ptr @16, ptr @16)
  %37 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %36, i32 255)
  call void @usageLogger(ptr @21, ptr @17)
  %38 = icmp eq i32 %25, 0
  call void @usageLogger(ptr @10, ptr @16)
  %39 = shl nuw nsw i32 %29, 16
  call void @usageLogger(ptr @10, ptr @16)
  %40 = shl nuw nsw i32 %33, 8
  call void @usageLogger(ptr @11, ptr @10)
  call void @usageLogger(ptr @11, ptr @10)
  %41 = or disjoint i32 %39, %40
  call void @usageLogger(ptr @11, ptr @11)
  call void @usageLogger(ptr @11, ptr @16)
  %42 = or disjoint i32 %41, %37
  call void @usageLogger(ptr @11, ptr @11)
  %43 = or disjoint i32 %42, -16777216
  call void @usageLogger(ptr @13, ptr @21)
  call void @usageLogger(ptr @13, ptr @11)
  %44 = select i1 %38, i32 -16777216, i32 %43
  call void @usageLogger(ptr @12, ptr @18)
  %45 = trunc nuw nsw i64 %23 to i32
  call void @usageLogger(ptr @16, ptr @12)
  call void @usageLogger(ptr @16, ptr @12)
  call void @usageLogger(ptr @16, ptr @13)
  tail call void @simPutPixel(i32 noundef %45, i32 noundef %13, i32 noundef %44) #9
  call void @usageLogger(ptr @18, ptr @18)
  %46 = add nuw nsw i64 %23, 1
  call void @usageLogger(ptr @21, ptr @18)
  %47 = icmp eq i64 %46, 512
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %47, label %19, label %22, !llvm.loop !15

48:                                               ; preds = %48, %16
  %49 = phi i64 [ 0, %16 ], [ %54, %48 ]
  call void @usageLogger(ptr @15, ptr @14)
  call void @usageLogger(ptr @15, ptr @18)
  %50 = getelementptr inbounds nuw i32, ptr %2, i64 %49
  call void @usageLogger(ptr @17, ptr @15)
  %51 = load i32, ptr %50, align 4, !tbaa !5
  call void @usageLogger(ptr @15, ptr @14)
  call void @usageLogger(ptr @15, ptr @18)
  %52 = getelementptr inbounds nuw i32, ptr %3, i64 %49
  call void @usageLogger(ptr @17, ptr @15)
  %53 = load i32, ptr %52, align 4, !tbaa !5
  call void @usageLogger(ptr @16, ptr @17)
  call void @usageLogger(ptr @16, ptr @17)
  tail call void @simPutPixel(i32 noundef %51, i32 noundef %53, i32 noundef -3618616) #9
  call void @usageLogger(ptr @18, ptr @18)
  %54 = add nuw nsw i64 %49, 1
  call void @usageLogger(ptr @21, ptr @18)
  call void @usageLogger(ptr @21, ptr @19)
  %55 = icmp eq i64 %54, %18
  call void @usageLogger(ptr @20, ptr @21)
  br i1 %55, label %56, label %48, !llvm.loop !16

56:                                               ; preds = %48, %14
  tail call void @simFlush() #9
  br label %9
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #7

declare void @simFlush() local_unnamed_addr #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #8

declare void @usageLogger(ptr, ptr)

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
