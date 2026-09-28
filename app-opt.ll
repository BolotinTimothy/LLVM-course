; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@vector_x = dso_local local_unnamed_addr global [8 x i32] [i32 0, i32 0, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 -1], align 16
@vector_y = dso_local local_unnamed_addr global [8 x i32] [i32 1, i32 -1, i32 0, i32 0, i32 1, i32 -1, i32 1, i32 -1], align 16
@max_radius = dso_local local_unnamed_addr global i32 0, align 4
@center_x = dso_local local_unnamed_addr global i32 257, align 4
@center_y = dso_local local_unnamed_addr global i32 257, align 4

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [512 x [512 x i32]], align 16
  %2 = alloca [400 x i32], align 16
  %3 = alloca [400 x i32], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1048576) %1, i8 0, i64 1048576, i1 false)
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 527364
  store i32 1, ptr %4, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %2, i8 0, i64 1600, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %3, i8 0, i64 1600, i1 false)
  br label %5

5:                                                ; preds = %315, %0
  %6 = phi i32 [ -1, %0 ], [ %91, %315 ]
  %7 = tail call i32 @simHasClick() #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %27, %5
  %10 = phi i32 [ %6, %5 ], [ %28, %27 ]
  %11 = icmp slt i32 %10, 399
  br i1 %11, label %31, label %83

12:                                               ; preds = %5, %27
  %13 = phi i32 [ %28, %27 ], [ %6, %5 ]
  %14 = tail call i32 @simGetClick() #6
  %15 = ashr i32 %14, 16
  %16 = and i32 %14, 65535
  %17 = add nsw i32 %15, -2
  %18 = icmp ult i32 %17, 510
  %19 = add nsw i32 %16, -2
  %20 = icmp ult i32 %19, 510
  %21 = select i1 %18, i1 %20, i1 false
  br i1 %21, label %22, label %27

22:                                               ; preds = %12
  %23 = zext nneg i32 %16 to i64
  %24 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %23
  %25 = zext nneg i32 %15 to i64
  %26 = getelementptr inbounds nuw i32, ptr %24, i64 %25
  store i32 1, ptr %26, align 4, !tbaa !5
  store i32 %15, ptr @center_x, align 4, !tbaa !5
  store i32 %16, ptr @center_y, align 4, !tbaa !5
  store i32 0, ptr @max_radius, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %22, %12
  %28 = phi i32 [ -1, %22 ], [ %13, %12 ]
  %29 = tail call i32 @simHasClick() #6
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %9, label %12, !llvm.loop !9

31:                                               ; preds = %9, %80
  %32 = phi i32 [ %81, %80 ], [ %10, %9 ]
  %33 = load i32, ptr @max_radius, align 4, !tbaa !5
  %34 = add nsw i32 %33, 6
  %35 = tail call i32 @simRand() #6
  %36 = srem i32 %35, 4
  %37 = load i32, ptr @center_x, align 4, !tbaa !5
  %38 = sub nsw i32 511, %37
  %39 = tail call i32 @llvm.smax.i32(i32 %38, i32 %37)
  %40 = load i32, ptr @center_y, align 4, !tbaa !5
  %41 = tail call i32 @llvm.smax.i32(i32 %40, i32 %39)
  %42 = sub nsw i32 511, %40
  %43 = tail call i32 @llvm.smax.i32(i32 %42, i32 %41)
  %44 = icmp sgt i32 %34, %43
  %45 = tail call i32 @simRand() #6
  br i1 %44, label %46, label %51

46:                                               ; preds = %31
  %47 = srem i32 %45, 512
  switch i32 %36, label %50 [
    i32 0, label %70
    i32 1, label %48
    i32 2, label %49
  ]

48:                                               ; preds = %46
  br label %70

49:                                               ; preds = %46
  br label %70

50:                                               ; preds = %46
  br label %70

51:                                               ; preds = %31
  %52 = shl nsw i32 %34, 1
  %53 = or disjoint i32 %52, 1
  %54 = srem i32 %45, %53
  %55 = sub nsw i32 %54, %34
  %56 = load i32, ptr @center_x, align 4, !tbaa !5
  %57 = load i32, ptr @center_y, align 4, !tbaa !5
  switch i32 %36, label %67 [
    i32 0, label %58
    i32 1, label %61
    i32 2, label %64
  ]

58:                                               ; preds = %51
  %59 = sub nsw i32 %56, %34
  %60 = add nsw i32 %57, %55
  br label %70

61:                                               ; preds = %51
  %62 = add nsw i32 %56, %34
  %63 = add nsw i32 %57, %55
  br label %70

64:                                               ; preds = %51
  %65 = add nsw i32 %56, %55
  %66 = sub nsw i32 %57, %34
  br label %70

67:                                               ; preds = %51
  %68 = add nsw i32 %56, %55
  %69 = add nsw i32 %57, %34
  br label %70

70:                                               ; preds = %67, %64, %61, %58, %50, %49, %48, %46
  %71 = phi i32 [ %47, %46 ], [ 511, %50 ], [ %47, %48 ], [ 0, %49 ], [ %60, %58 ], [ %63, %61 ], [ %66, %64 ], [ %69, %67 ]
  %72 = phi i32 [ %36, %46 ], [ %47, %50 ], [ 511, %48 ], [ %47, %49 ], [ %59, %58 ], [ %62, %61 ], [ %65, %64 ], [ %68, %67 ]
  %73 = or i32 %72, %71
  %74 = icmp ult i32 %73, 512
  br i1 %74, label %75, label %80, !llvm.loop !11

75:                                               ; preds = %70
  %76 = add nsw i32 %32, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, ptr %2, i64 %77
  store i32 %72, ptr %78, align 4, !tbaa !5
  %79 = getelementptr inbounds i32, ptr %3, i64 %77
  store i32 %71, ptr %79, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %75, %70
  %81 = phi i32 [ %76, %75 ], [ %32, %70 ]
  %82 = icmp slt i32 %81, 399
  br i1 %82, label %31, label %83

83:                                               ; preds = %80, %9
  %84 = phi i32 [ %10, %9 ], [ 399, %80 ]
  br label %85

85:                                               ; preds = %83, %90
  %86 = phi i32 [ %91, %90 ], [ %84, %83 ]
  %87 = phi i32 [ %92, %90 ], [ %84, %83 ]
  %88 = phi i32 [ %93, %90 ], [ 0, %83 ]
  %89 = icmp slt i32 %87, 0
  br i1 %89, label %90, label %95

90:                                               ; preds = %265, %85
  %91 = phi i32 [ %86, %85 ], [ %266, %265 ]
  %92 = phi i32 [ %87, %85 ], [ %266, %265 ]
  %93 = add nuw nsw i32 %88, 1
  %94 = icmp eq i32 %93, 32
  br i1 %94, label %269, label %85, !llvm.loop !12

95:                                               ; preds = %85, %265
  %96 = phi i32 [ %266, %265 ], [ %86, %85 ]
  %97 = phi i32 [ %267, %265 ], [ 0, %85 ]
  %98 = tail call i32 @simRand() #6
  %99 = srem i32 %98, 8
  %100 = sext i32 %97 to i64
  %101 = getelementptr inbounds i32, ptr %2, i64 %100
  %102 = load i32, ptr %101, align 4, !tbaa !5
  %103 = sext i32 %99 to i64
  %104 = getelementptr inbounds i32, ptr @vector_x, i64 %103
  %105 = load i32, ptr %104, align 4, !tbaa !5
  %106 = add nsw i32 %105, %102
  %107 = getelementptr inbounds i32, ptr %3, i64 %100
  %108 = load i32, ptr %107, align 4, !tbaa !5
  %109 = getelementptr inbounds i32, ptr @vector_y, i64 %103
  %110 = load i32, ptr %109, align 4, !tbaa !5
  %111 = add nsw i32 %110, %108
  %112 = or i32 %111, %106
  %113 = icmp ult i32 %112, 512
  br i1 %113, label %114, label %125

114:                                              ; preds = %95
  %115 = load i32, ptr @max_radius, align 4, !tbaa !5
  %116 = add nsw i32 %115, 24
  %117 = load i32, ptr @center_x, align 4, !tbaa !5
  %118 = sub nsw i32 %106, %117
  %119 = load i32, ptr @center_y, align 4, !tbaa !5
  %120 = sub nsw i32 %111, %119
  %121 = tail call i32 @llvm.abs.i32(i32 %118, i1 true)
  %122 = tail call i32 @llvm.abs.i32(i32 %120, i1 true)
  %123 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %121, i32 %122)
  %124 = icmp sgt i32 %123, %116
  br i1 %124, label %125, label %132

125:                                              ; preds = %114, %95
  %126 = sext i32 %96 to i64
  %127 = getelementptr inbounds i32, ptr %2, i64 %126
  %128 = load i32, ptr %127, align 4, !tbaa !5
  store i32 %128, ptr %101, align 4, !tbaa !5
  %129 = getelementptr inbounds i32, ptr %3, i64 %126
  %130 = load i32, ptr %129, align 4, !tbaa !5
  store i32 %130, ptr %107, align 4, !tbaa !5
  %131 = add nsw i32 %96, -1
  br label %265

132:                                              ; preds = %114
  %133 = zext nneg i32 %111 to i64
  %134 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %133
  %135 = zext nneg i32 %106 to i64
  %136 = getelementptr inbounds nuw i32, ptr %134, i64 %135
  %137 = load i32, ptr %136, align 4, !tbaa !5
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %256

139:                                              ; preds = %132
  %140 = load i32, ptr @vector_x, align 16, !tbaa !5
  %141 = add nsw i32 %140, %106
  %142 = load i32, ptr @vector_y, align 16, !tbaa !5
  %143 = add nsw i32 %142, %111
  %144 = or i32 %143, %141
  %145 = icmp ult i32 %144, 512
  br i1 %145, label %146, label %158

146:                                              ; preds = %139
  %147 = zext nneg i32 %143 to i64
  %148 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %147
  %149 = zext nneg i32 %141 to i64
  %150 = getelementptr inbounds nuw i32, ptr %148, i64 %149
  %151 = load i32, ptr %150, align 4, !tbaa !5
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %158, label %153

153:                                              ; preds = %249, %235, %221, %207, %193, %179, %165, %146
  %154 = phi i32 [ %254, %249 ], [ %240, %235 ], [ %226, %221 ], [ %212, %207 ], [ %198, %193 ], [ %184, %179 ], [ %170, %165 ], [ %151, %146 ]
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %136, align 4, !tbaa !5
  %156 = icmp sgt i32 %123, %115
  br i1 %156, label %157, label %256

157:                                              ; preds = %153
  store i32 %123, ptr @max_radius, align 4, !tbaa !5
  br label %256

158:                                              ; preds = %146, %139
  %159 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 4), align 4, !tbaa !5
  %160 = add nsw i32 %159, %106
  %161 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 4), align 4, !tbaa !5
  %162 = add nsw i32 %161, %111
  %163 = or i32 %162, %160
  %164 = icmp ult i32 %163, 512
  br i1 %164, label %165, label %172

165:                                              ; preds = %158
  %166 = zext nneg i32 %162 to i64
  %167 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %166
  %168 = zext nneg i32 %160 to i64
  %169 = getelementptr inbounds nuw i32, ptr %167, i64 %168
  %170 = load i32, ptr %169, align 4, !tbaa !5
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %153

172:                                              ; preds = %165, %158
  %173 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 8), align 8, !tbaa !5
  %174 = add nsw i32 %173, %106
  %175 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 8), align 8, !tbaa !5
  %176 = add nsw i32 %175, %111
  %177 = or i32 %176, %174
  %178 = icmp ult i32 %177, 512
  br i1 %178, label %179, label %186

179:                                              ; preds = %172
  %180 = zext nneg i32 %176 to i64
  %181 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %180
  %182 = zext nneg i32 %174 to i64
  %183 = getelementptr inbounds nuw i32, ptr %181, i64 %182
  %184 = load i32, ptr %183, align 4, !tbaa !5
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %186, label %153

186:                                              ; preds = %179, %172
  %187 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 12), align 4, !tbaa !5
  %188 = add nsw i32 %187, %106
  %189 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 12), align 4, !tbaa !5
  %190 = add nsw i32 %189, %111
  %191 = or i32 %190, %188
  %192 = icmp ult i32 %191, 512
  br i1 %192, label %193, label %200

193:                                              ; preds = %186
  %194 = zext nneg i32 %190 to i64
  %195 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %194
  %196 = zext nneg i32 %188 to i64
  %197 = getelementptr inbounds nuw i32, ptr %195, i64 %196
  %198 = load i32, ptr %197, align 4, !tbaa !5
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %153

200:                                              ; preds = %193, %186
  %201 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 16), align 16, !tbaa !5
  %202 = add nsw i32 %201, %106
  %203 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 16), align 16, !tbaa !5
  %204 = add nsw i32 %203, %111
  %205 = or i32 %204, %202
  %206 = icmp ult i32 %205, 512
  br i1 %206, label %207, label %214

207:                                              ; preds = %200
  %208 = zext nneg i32 %204 to i64
  %209 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %208
  %210 = zext nneg i32 %202 to i64
  %211 = getelementptr inbounds nuw i32, ptr %209, i64 %210
  %212 = load i32, ptr %211, align 4, !tbaa !5
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %153

214:                                              ; preds = %207, %200
  %215 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 20), align 4, !tbaa !5
  %216 = add nsw i32 %215, %106
  %217 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 20), align 4, !tbaa !5
  %218 = add nsw i32 %217, %111
  %219 = or i32 %218, %216
  %220 = icmp ult i32 %219, 512
  br i1 %220, label %221, label %228

221:                                              ; preds = %214
  %222 = zext nneg i32 %218 to i64
  %223 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %222
  %224 = zext nneg i32 %216 to i64
  %225 = getelementptr inbounds nuw i32, ptr %223, i64 %224
  %226 = load i32, ptr %225, align 4, !tbaa !5
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %153

228:                                              ; preds = %221, %214
  %229 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 24), align 8, !tbaa !5
  %230 = add nsw i32 %229, %106
  %231 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 24), align 8, !tbaa !5
  %232 = add nsw i32 %231, %111
  %233 = or i32 %232, %230
  %234 = icmp ult i32 %233, 512
  br i1 %234, label %235, label %242

235:                                              ; preds = %228
  %236 = zext nneg i32 %232 to i64
  %237 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %236
  %238 = zext nneg i32 %230 to i64
  %239 = getelementptr inbounds nuw i32, ptr %237, i64 %238
  %240 = load i32, ptr %239, align 4, !tbaa !5
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %153

242:                                              ; preds = %235, %228
  %243 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_x, i64 28), align 4, !tbaa !5
  %244 = add nsw i32 %243, %106
  %245 = load i32, ptr getelementptr inbounds nuw (i8, ptr @vector_y, i64 28), align 4, !tbaa !5
  %246 = add nsw i32 %245, %111
  %247 = or i32 %246, %244
  %248 = icmp ult i32 %247, 512
  br i1 %248, label %249, label %263

249:                                              ; preds = %242
  %250 = zext nneg i32 %246 to i64
  %251 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %250
  %252 = zext nneg i32 %244 to i64
  %253 = getelementptr inbounds nuw i32, ptr %251, i64 %252
  %254 = load i32, ptr %253, align 4, !tbaa !5
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %263, label %153

256:                                              ; preds = %157, %153, %132
  %257 = sext i32 %96 to i64
  %258 = getelementptr inbounds i32, ptr %2, i64 %257
  %259 = load i32, ptr %258, align 4, !tbaa !5
  store i32 %259, ptr %101, align 4, !tbaa !5
  %260 = getelementptr inbounds i32, ptr %3, i64 %257
  %261 = load i32, ptr %260, align 4, !tbaa !5
  store i32 %261, ptr %107, align 4, !tbaa !5
  %262 = add nsw i32 %96, -1
  br label %265

263:                                              ; preds = %249, %242
  store i32 %106, ptr %101, align 4, !tbaa !5
  store i32 %111, ptr %107, align 4, !tbaa !5
  %264 = add nsw i32 %97, 1
  br label %265

265:                                              ; preds = %263, %256, %125
  %266 = phi i32 [ %131, %125 ], [ %96, %263 ], [ %262, %256 ]
  %267 = phi i32 [ %97, %125 ], [ %264, %263 ], [ %97, %256 ]
  %268 = icmp sgt i32 %267, %266
  br i1 %268, label %90, label %95, !llvm.loop !13

269:                                              ; preds = %90, %278
  %270 = phi i64 [ %279, %278 ], [ 0, %90 ]
  %271 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %270
  %272 = trunc nuw nsw i64 %270 to i32
  br label %281

273:                                              ; preds = %278
  %274 = icmp slt i32 %91, 0
  br i1 %274, label %315, label %275

275:                                              ; preds = %273
  %276 = add nuw i32 %91, 1
  %277 = zext i32 %276 to i64
  br label %307

278:                                              ; preds = %281
  %279 = add nuw nsw i64 %270, 1
  %280 = icmp eq i64 %279, 512
  br i1 %280, label %273, label %269, !llvm.loop !14

281:                                              ; preds = %281, %269
  %282 = phi i64 [ 0, %269 ], [ %305, %281 ]
  %283 = getelementptr inbounds nuw i32, ptr %271, i64 %282
  %284 = load i32, ptr %283, align 4, !tbaa !5
  %285 = shl nsw i32 %284, 3
  %286 = tail call i32 @llvm.smax.i32(i32 %285, i32 -20)
  %287 = add nsw i32 %286, 20
  %288 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %287, i32 255)
  %289 = mul nsw i32 %284, 3
  %290 = tail call i32 @llvm.smax.i32(i32 %289, i32 -30)
  %291 = add nsw i32 %290, 30
  %292 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %291, i32 255)
  %293 = shl nsw i32 %284, 1
  %294 = sub nsw i32 80, %293
  %295 = tail call i32 @llvm.smax.i32(i32 range(i32 -2147483628, -2147483648) %294, i32 0)
  %296 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %295, i32 255)
  %297 = icmp eq i32 %284, 0
  %298 = shl nuw nsw i32 %288, 16
  %299 = shl nuw nsw i32 %292, 8
  %300 = or disjoint i32 %298, %299
  %301 = or disjoint i32 %300, %296
  %302 = or disjoint i32 %301, -16777216
  %303 = select i1 %297, i32 -16777216, i32 %302
  %304 = trunc nuw nsw i64 %282 to i32
  tail call void @simPutPixel(i32 noundef %304, i32 noundef %272, i32 noundef %303) #6
  %305 = add nuw nsw i64 %282, 1
  %306 = icmp eq i64 %305, 512
  br i1 %306, label %278, label %281, !llvm.loop !15

307:                                              ; preds = %307, %275
  %308 = phi i64 [ 0, %275 ], [ %313, %307 ]
  %309 = getelementptr inbounds nuw i32, ptr %2, i64 %308
  %310 = load i32, ptr %309, align 4, !tbaa !5
  %311 = getelementptr inbounds nuw i32, ptr %3, i64 %308
  %312 = load i32, ptr %311, align 4, !tbaa !5
  tail call void @simPutPixel(i32 noundef %310, i32 noundef %312, i32 noundef -3618616) #6
  %313 = add nuw nsw i64 %308, 1
  %314 = icmp eq i64 %313, %277
  br i1 %314, label %315, label %307, !llvm.loop !16

315:                                              ; preds = %307, %273
  tail call void @simFlush() #6
  br label %5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

declare void @simFlush() local_unnamed_addr #3

declare i32 @simHasClick() local_unnamed_addr #3

declare i32 @simGetClick() local_unnamed_addr #3

declare i32 @simRand() local_unnamed_addr #3

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #5

attributes #0 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 22.1.8 (++20260714015917+ca7933e47d3a-1~exp1~20260714135927.17)"}
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
