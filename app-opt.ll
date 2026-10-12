; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.calculateFrame.vector_x = private unnamed_addr constant [8 x i32] [i32 0, i32 0, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 -1], align 16
@__const.calculateFrame.vector_y = private unnamed_addr constant [8 x i32] [i32 1, i32 -1, i32 0, i32 0, i32 1, i32 -1, i32 1, i32 -1], align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 0, 256) i32 @limitColor(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %3 = tail call i32 @llvm.umin.i32(i32 %2, i32 255)
  ret i32 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local range(i32 0, -2147483648) i32 @calc_radius(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = sub nsw i32 %0, %2
  %6 = sub nsw i32 %1, %3
  %7 = tail call i32 @llvm.abs.i32(i32 %5, i1 true)
  %8 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  %9 = tail call i32 @llvm.umax.i32(i32 %7, i32 %8)
  ret i32 %9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @update_radius(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef captures(none) %4) local_unnamed_addr #2 {
  %6 = sub nsw i32 %0, %2
  %7 = sub nsw i32 %1, %3
  %8 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  %9 = tail call i32 @llvm.abs.i32(i32 %7, i1 true)
  %10 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %8, i32 %9)
  %11 = load i32, ptr %4, align 4, !tbaa !5
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %5
  store i32 %10, ptr %4, align 4, !tbaa !5
  br label %14

14:                                               ; preds = %13, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 -32768, 32768) i32 @decode_x(i32 noundef %0) local_unnamed_addr #0 {
  %2 = ashr i32 %0, 16
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef range(i32 0, 65536) i32 @decode_y(i32 noundef %0) local_unnamed_addr #0 {
  %2 = and i32 %0, 65535
  ret i32 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local range(i32 0, 2) i32 @isInBorders(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp ult i32 %0, 512
  %4 = icmp sgt i32 %1, -1
  %5 = and i1 %3, %4
  %6 = icmp samesign ult i32 %1, 512
  %7 = select i1 %5, i1 %6, i1 false
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @safeGetUsed(ptr noundef readonly captures(none) %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3 {
  %4 = or i32 %2, %1
  %5 = icmp ult i32 %4, 512
  br i1 %5, label %6, label %12

6:                                                ; preds = %3
  %7 = zext nneg i32 %2 to i64
  %8 = getelementptr inbounds nuw [512 x i32], ptr %0, i64 %7
  %9 = zext nneg i32 %1 to i64
  %10 = getelementptr inbounds nuw i32, ptr %8, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !5
  br label %12

12:                                               ; preds = %3, %6
  %13 = phi i32 [ %11, %6 ], [ 0, %3 ]
  ret i32 %13
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @killWalker(i32 noundef %0, ptr noundef captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3) local_unnamed_addr #2 {
  %5 = load i32, ptr %1, align 4, !tbaa !5
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, ptr %2, i64 %6
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = sext i32 %0 to i64
  %10 = getelementptr inbounds i32, ptr %2, i64 %9
  store i32 %8, ptr %10, align 4, !tbaa !5
  %11 = load i32, ptr %1, align 4, !tbaa !5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr %3, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = getelementptr inbounds i32, ptr %3, i64 %9
  store i32 %14, ptr %15, align 4, !tbaa !5
  %16 = load i32, ptr %1, align 4, !tbaa !5
  %17 = add nsw i32 %16, -1
  store i32 %17, ptr %1, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local range(i32 0, 2) i32 @applyNearStatic(i32 noundef %0, i32 noundef %1, ptr noundef captures(none) %2, i32 noundef %3, i32 noundef %4, ptr noundef captures(none) %5) local_unnamed_addr #2 {
  %7 = or i32 %1, %0
  %8 = icmp ult i32 %7, 512
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = zext nneg i32 %1 to i64
  %11 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %10
  %12 = zext nneg i32 %0 to i64
  %13 = getelementptr inbounds nuw i32, ptr %11, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %115

16:                                               ; preds = %9, %6
  %17 = add nsw i32 %1, 1
  %18 = or i32 %17, %0
  %19 = icmp ult i32 %18, 512
  br i1 %19, label %20, label %42

20:                                               ; preds = %16
  %21 = zext nneg i32 %17 to i64
  %22 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %21
  %23 = zext nneg i32 %0 to i64
  %24 = getelementptr inbounds nuw i32, ptr %22, i64 %23
  %25 = load i32, ptr %24, align 4, !tbaa !5
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %108, %98, %88, %78, %68, %57, %46, %20
  %28 = phi i32 [ %113, %108 ], [ %103, %98 ], [ %93, %88 ], [ %83, %78 ], [ %73, %68 ], [ %62, %57 ], [ %51, %46 ], [ %25, %20 ]
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %1 to i64
  %31 = getelementptr inbounds [512 x i32], ptr %2, i64 %30
  %32 = sext i32 %0 to i64
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  store i32 %29, ptr %33, align 4, !tbaa !5
  %34 = sub nsw i32 %0, %3
  %35 = sub nsw i32 %1, %4
  %36 = tail call i32 @llvm.abs.i32(i32 %34, i1 true)
  %37 = tail call i32 @llvm.abs.i32(i32 %35, i1 true)
  %38 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %36, i32 %37)
  %39 = load i32, ptr %5, align 4, !tbaa !5
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %115

41:                                               ; preds = %27
  store i32 %38, ptr %5, align 4, !tbaa !5
  br label %115

42:                                               ; preds = %16, %20
  %43 = add nsw i32 %1, -1
  %44 = or i32 %43, %0
  %45 = icmp ult i32 %44, 512
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = zext nneg i32 %43 to i64
  %48 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %47
  %49 = zext nneg i32 %0 to i64
  %50 = getelementptr inbounds nuw i32, ptr %48, i64 %49
  %51 = load i32, ptr %50, align 4, !tbaa !5
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %27

53:                                               ; preds = %46, %42
  %54 = add nsw i32 %0, 1
  %55 = or i32 %1, %54
  %56 = icmp ult i32 %55, 512
  br i1 %56, label %57, label %64

57:                                               ; preds = %53
  %58 = zext nneg i32 %1 to i64
  %59 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %58
  %60 = zext nneg i32 %54 to i64
  %61 = getelementptr inbounds nuw i32, ptr %59, i64 %60
  %62 = load i32, ptr %61, align 4, !tbaa !5
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %27

64:                                               ; preds = %57, %53
  %65 = add nsw i32 %0, -1
  %66 = or i32 %1, %65
  %67 = icmp ult i32 %66, 512
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = zext nneg i32 %1 to i64
  %70 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %69
  %71 = zext nneg i32 %65 to i64
  %72 = getelementptr inbounds nuw i32, ptr %70, i64 %71
  %73 = load i32, ptr %72, align 4, !tbaa !5
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %27

75:                                               ; preds = %68, %64
  %76 = or i32 %17, %54
  %77 = icmp ult i32 %76, 512
  br i1 %77, label %78, label %85

78:                                               ; preds = %75
  %79 = zext nneg i32 %17 to i64
  %80 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %79
  %81 = zext nneg i32 %54 to i64
  %82 = getelementptr inbounds nuw i32, ptr %80, i64 %81
  %83 = load i32, ptr %82, align 4, !tbaa !5
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %27

85:                                               ; preds = %78, %75
  %86 = or i32 %43, %54
  %87 = icmp ult i32 %86, 512
  br i1 %87, label %88, label %95

88:                                               ; preds = %85
  %89 = zext nneg i32 %43 to i64
  %90 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %89
  %91 = zext nneg i32 %54 to i64
  %92 = getelementptr inbounds nuw i32, ptr %90, i64 %91
  %93 = load i32, ptr %92, align 4, !tbaa !5
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %27

95:                                               ; preds = %88, %85
  %96 = or i32 %17, %65
  %97 = icmp ult i32 %96, 512
  br i1 %97, label %98, label %105

98:                                               ; preds = %95
  %99 = zext nneg i32 %17 to i64
  %100 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %99
  %101 = zext nneg i32 %65 to i64
  %102 = getelementptr inbounds nuw i32, ptr %100, i64 %101
  %103 = load i32, ptr %102, align 4, !tbaa !5
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %27

105:                                              ; preds = %98, %95
  %106 = or i32 %43, %65
  %107 = icmp ult i32 %106, 512
  br i1 %107, label %108, label %115

108:                                              ; preds = %105
  %109 = zext nneg i32 %43 to i64
  %110 = getelementptr inbounds nuw [512 x i32], ptr %2, i64 %109
  %111 = zext nneg i32 %65 to i64
  %112 = getelementptr inbounds nuw i32, ptr %110, i64 %111
  %113 = load i32, ptr %112, align 4, !tbaa !5
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %27

115:                                              ; preds = %27, %41, %108, %105, %9
  %116 = phi i32 [ 1, %9 ], [ 1, %27 ], [ 1, %41 ], [ 0, %108 ], [ 0, %105 ]
  ret i32 %116
}

; Function Attrs: nounwind uwtable
define dso_local void @calculateFrame(ptr noundef captures(none) %0, ptr noundef captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef captures(none) %5, ptr noundef captures(none) %6) local_unnamed_addr #4 {
  %8 = tail call i32 @simHasClick() #10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %27, %7
  %11 = load i32, ptr %2, align 4, !tbaa !5
  %12 = icmp slt i32 %11, 399
  br i1 %12, label %30, label %84

13:                                               ; preds = %7, %27
  %14 = tail call i32 @simGetClick() #10
  %15 = ashr i32 %14, 16
  %16 = and i32 %14, 65535
  %17 = add nsw i32 %15, -2
  %18 = icmp ult i32 %17, 510
  %19 = add nsw i32 %16, -2
  %20 = icmp ult i32 %19, 510
  %21 = select i1 %18, i1 %20, i1 false
  br i1 %21, label %22, label %27

22:                                               ; preds = %13
  %23 = zext nneg i32 %16 to i64
  %24 = getelementptr inbounds nuw [512 x i32], ptr %3, i64 %23
  %25 = zext nneg i32 %15 to i64
  %26 = getelementptr inbounds nuw i32, ptr %24, i64 %25
  store i32 1, ptr %26, align 4, !tbaa !5
  store i32 %15, ptr %4, align 4, !tbaa !5
  store i32 %16, ptr %5, align 4, !tbaa !5
  store i32 0, ptr %6, align 4, !tbaa !5
  store i32 -1, ptr %2, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %22, %13
  %28 = tail call i32 @simHasClick() #10
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %10, label %13, !llvm.loop !9

30:                                               ; preds = %10, %81
  %31 = load i32, ptr %6, align 4, !tbaa !5
  %32 = add nsw i32 %31, 6
  %33 = tail call i32 @simRand() #10
  %34 = srem i32 %33, 4
  %35 = load i32, ptr %4, align 4, !tbaa !5
  %36 = sub nsw i32 511, %35
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 %35)
  %38 = load i32, ptr %5, align 4, !tbaa !5
  %39 = tail call i32 @llvm.smax.i32(i32 %38, i32 %37)
  %40 = sub nsw i32 511, %38
  %41 = tail call i32 @llvm.smax.i32(i32 %40, i32 %39)
  %42 = icmp sgt i32 %32, %41
  %43 = tail call i32 @simRand() #10
  br i1 %42, label %44, label %49

44:                                               ; preds = %30
  %45 = srem i32 %43, 512
  switch i32 %34, label %48 [
    i32 0, label %68
    i32 1, label %46
    i32 2, label %47
  ]

46:                                               ; preds = %44
  br label %68

47:                                               ; preds = %44
  br label %68

48:                                               ; preds = %44
  br label %68

49:                                               ; preds = %30
  %50 = shl nsw i32 %32, 1
  %51 = or disjoint i32 %50, 1
  %52 = srem i32 %43, %51
  %53 = sub nsw i32 %52, %32
  %54 = load i32, ptr %4, align 4, !tbaa !5
  %55 = load i32, ptr %5, align 4, !tbaa !5
  switch i32 %34, label %65 [
    i32 0, label %56
    i32 1, label %59
    i32 2, label %62
  ]

56:                                               ; preds = %49
  %57 = sub nsw i32 %54, %32
  %58 = add nsw i32 %55, %53
  br label %68

59:                                               ; preds = %49
  %60 = add nsw i32 %54, %32
  %61 = add nsw i32 %55, %53
  br label %68

62:                                               ; preds = %49
  %63 = add nsw i32 %54, %53
  %64 = sub nsw i32 %55, %32
  br label %68

65:                                               ; preds = %49
  %66 = add nsw i32 %54, %53
  %67 = add nsw i32 %55, %32
  br label %68

68:                                               ; preds = %56, %62, %65, %59, %47, %48, %46, %44
  %69 = phi i32 [ %45, %44 ], [ 511, %48 ], [ %45, %46 ], [ 0, %47 ], [ %58, %56 ], [ %61, %59 ], [ %64, %62 ], [ %67, %65 ]
  %70 = phi i32 [ %34, %44 ], [ %45, %48 ], [ 511, %46 ], [ %45, %47 ], [ %57, %56 ], [ %60, %59 ], [ %63, %62 ], [ %66, %65 ]
  %71 = or i32 %70, %69
  %72 = icmp ult i32 %71, 512
  br i1 %72, label %73, label %81, !llvm.loop !11

73:                                               ; preds = %68
  %74 = load i32, ptr %2, align 4, !tbaa !5
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %2, align 4, !tbaa !5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %0, i64 %76
  store i32 %70, ptr %77, align 4, !tbaa !5
  %78 = load i32, ptr %2, align 4, !tbaa !5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %1, i64 %79
  store i32 %69, ptr %80, align 4, !tbaa !5
  br label %81

81:                                               ; preds = %68, %73
  %82 = load i32, ptr %2, align 4, !tbaa !5
  %83 = icmp slt i32 %82, 399
  br i1 %83, label %30, label %84

84:                                               ; preds = %81, %10
  %85 = phi i32 [ %11, %10 ], [ %82, %81 ]
  br label %86

86:                                               ; preds = %84, %91
  %87 = phi i32 [ %92, %91 ], [ %85, %84 ]
  %88 = phi i32 [ %93, %91 ], [ 0, %84 ]
  %89 = icmp slt i32 %87, 0
  br i1 %89, label %91, label %95

90:                                               ; preds = %91
  ret void

91:                                               ; preds = %152, %86
  %92 = phi i32 [ %87, %86 ], [ %153, %152 ]
  %93 = add nuw nsw i32 %88, 1
  %94 = icmp eq i32 %93, 32
  br i1 %94, label %90, label %86, !llvm.loop !12

95:                                               ; preds = %86, %152
  %96 = phi i32 [ %154, %152 ], [ 0, %86 ]
  %97 = tail call i32 @simRand() #10
  %98 = srem i32 %97, 8
  %99 = sext i32 %96 to i64
  %100 = getelementptr inbounds i32, ptr %0, i64 %99
  %101 = load i32, ptr %100, align 4, !tbaa !5
  %102 = sext i32 %98 to i64
  %103 = getelementptr inbounds i32, ptr @__const.calculateFrame.vector_x, i64 %102
  %104 = load i32, ptr %103, align 4, !tbaa !5
  %105 = add nsw i32 %104, %101
  %106 = getelementptr inbounds i32, ptr %1, i64 %99
  %107 = load i32, ptr %106, align 4, !tbaa !5
  %108 = getelementptr inbounds i32, ptr @__const.calculateFrame.vector_y, i64 %102
  %109 = load i32, ptr %108, align 4, !tbaa !5
  %110 = add nsw i32 %109, %107
  %111 = or i32 %110, %105
  %112 = icmp ult i32 %111, 512
  br i1 %112, label %113, label %124

113:                                              ; preds = %95
  %114 = load i32, ptr %6, align 4, !tbaa !5
  %115 = add nsw i32 %114, 24
  %116 = load i32, ptr %4, align 4, !tbaa !5
  %117 = load i32, ptr %5, align 4, !tbaa !5
  %118 = sub nsw i32 %105, %116
  %119 = sub nsw i32 %110, %117
  %120 = tail call i32 @llvm.abs.i32(i32 %118, i1 true)
  %121 = tail call i32 @llvm.abs.i32(i32 %119, i1 true)
  %122 = tail call range(i32 0, -2147483648) i32 @llvm.umax.i32(i32 %120, i32 %121)
  %123 = icmp sgt i32 %122, %115
  br i1 %123, label %124, label %135

124:                                              ; preds = %113, %95
  %125 = load i32, ptr %2, align 4, !tbaa !5
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, ptr %0, i64 %126
  %128 = load i32, ptr %127, align 4, !tbaa !5
  store i32 %128, ptr %100, align 4, !tbaa !5
  %129 = load i32, ptr %2, align 4, !tbaa !5
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, ptr %1, i64 %130
  %132 = load i32, ptr %131, align 4, !tbaa !5
  store i32 %132, ptr %106, align 4, !tbaa !5
  %133 = load i32, ptr %2, align 4, !tbaa !5
  %134 = add nsw i32 %133, -1
  store i32 %134, ptr %2, align 4, !tbaa !5
  br label %152

135:                                              ; preds = %113
  %136 = tail call i32 @applyNearStatic(i32 noundef %105, i32 noundef %110, ptr noundef %3, i32 noundef %116, i32 noundef %117, ptr noundef nonnull %6)
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %149, label %138

138:                                              ; preds = %135
  %139 = load i32, ptr %2, align 4, !tbaa !5
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, ptr %0, i64 %140
  %142 = load i32, ptr %141, align 4, !tbaa !5
  store i32 %142, ptr %100, align 4, !tbaa !5
  %143 = load i32, ptr %2, align 4, !tbaa !5
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %1, i64 %144
  %146 = load i32, ptr %145, align 4, !tbaa !5
  store i32 %146, ptr %106, align 4, !tbaa !5
  %147 = load i32, ptr %2, align 4, !tbaa !5
  %148 = add nsw i32 %147, -1
  store i32 %148, ptr %2, align 4, !tbaa !5
  br label %152

149:                                              ; preds = %135
  store i32 %105, ptr %100, align 4, !tbaa !5
  store i32 %110, ptr %106, align 4, !tbaa !5
  %150 = add nsw i32 %96, 1
  %151 = load i32, ptr %2, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %138, %149, %124
  %153 = phi i32 [ %134, %124 ], [ %148, %138 ], [ %151, %149 ]
  %154 = phi i32 [ %96, %124 ], [ %96, %138 ], [ %150, %149 ]
  %155 = icmp sgt i32 %154, %153
  br i1 %155, label %91, label %95, !llvm.loop !13
}

declare i32 @simHasClick() local_unnamed_addr #5

declare i32 @simGetClick() local_unnamed_addr #5

declare i32 @simRand() local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @drawFrame(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, i32 noundef %2, ptr noundef readonly captures(none) %3) local_unnamed_addr #4 {
  br label %5

5:                                                ; preds = %4, %14
  %6 = phi i64 [ 0, %4 ], [ %15, %14 ]
  %7 = getelementptr inbounds nuw [512 x i32], ptr %3, i64 %6
  %8 = trunc nuw nsw i64 %6 to i32
  br label %17

9:                                                ; preds = %14
  %10 = icmp slt i32 %2, 0
  br i1 %10, label %43, label %11

11:                                               ; preds = %9
  %12 = add nuw i32 %2, 1
  %13 = zext i32 %12 to i64
  br label %44

14:                                               ; preds = %17
  %15 = add nuw nsw i64 %6, 1
  %16 = icmp eq i64 %15, 512
  br i1 %16, label %9, label %5, !llvm.loop !14

17:                                               ; preds = %5, %17
  %18 = phi i64 [ 0, %5 ], [ %41, %17 ]
  %19 = getelementptr inbounds nuw i32, ptr %7, i64 %18
  %20 = load i32, ptr %19, align 4, !tbaa !5
  %21 = shl nsw i32 %20, 3
  %22 = tail call i32 @llvm.smax.i32(i32 %21, i32 -20)
  %23 = add nsw i32 %22, 20
  %24 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %23, i32 255)
  %25 = mul nsw i32 %20, 3
  %26 = tail call i32 @llvm.smax.i32(i32 %25, i32 -30)
  %27 = add nsw i32 %26, 30
  %28 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %27, i32 255)
  %29 = shl nsw i32 %20, 1
  %30 = sub nsw i32 80, %29
  %31 = tail call i32 @llvm.smax.i32(i32 %30, i32 0)
  %32 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %31, i32 255)
  %33 = icmp eq i32 %20, 0
  %34 = shl nuw nsw i32 %24, 16
  %35 = shl nuw nsw i32 %28, 8
  %36 = or disjoint i32 %34, %35
  %37 = or disjoint i32 %36, %32
  %38 = or disjoint i32 %37, -16777216
  %39 = select i1 %33, i32 -16777216, i32 %38
  %40 = trunc nuw nsw i64 %18 to i32
  tail call void @simPutPixel(i32 noundef %40, i32 noundef %8, i32 noundef %39) #10
  %41 = add nuw nsw i64 %18, 1
  %42 = icmp eq i64 %41, 512
  br i1 %42, label %14, label %17, !llvm.loop !15

43:                                               ; preds = %44, %9
  ret void

44:                                               ; preds = %11, %44
  %45 = phi i64 [ 0, %11 ], [ %50, %44 ]
  %46 = getelementptr inbounds nuw i32, ptr %0, i64 %45
  %47 = load i32, ptr %46, align 4, !tbaa !5
  %48 = getelementptr inbounds nuw i32, ptr %1, i64 %45
  %49 = load i32, ptr %48, align 4, !tbaa !5
  tail call void @simPutPixel(i32 noundef %47, i32 noundef %49, i32 noundef -3618616) #10
  %50 = add nuw nsw i64 %45, 1
  %51 = icmp eq i64 %50, %13
  br i1 %51, label %43, label %44, !llvm.loop !16
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
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1048576) %1, i8 0, i64 1048576, i1 false)
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 527364
  store i32 1, ptr %8, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %2, i8 0, i64 1600, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1600) %3, i8 0, i64 1600, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  store i32 -1, ptr %4, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  store i32 257, ptr %5, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  store i32 257, ptr %6, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #10
  store i32 0, ptr %7, align 4, !tbaa !5
  br label %9

9:                                                ; preds = %57, %0
  call void @calculateFrame(ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %1, ptr noundef nonnull %5, ptr noundef nonnull %6, ptr noundef nonnull %7)
  %10 = load i32, ptr %4, align 4, !tbaa !5
  br label %11

11:                                               ; preds = %20, %9
  %12 = phi i64 [ 0, %9 ], [ %21, %20 ]
  %13 = getelementptr inbounds nuw [512 x i32], ptr %1, i64 %12
  %14 = trunc nuw nsw i64 %12 to i32
  br label %23

15:                                               ; preds = %20
  %16 = icmp slt i32 %10, 0
  br i1 %16, label %57, label %17

17:                                               ; preds = %15
  %18 = add nuw i32 %10, 1
  %19 = zext i32 %18 to i64
  br label %49

20:                                               ; preds = %23
  %21 = add nuw nsw i64 %12, 1
  %22 = icmp eq i64 %21, 512
  br i1 %22, label %15, label %11, !llvm.loop !14

23:                                               ; preds = %23, %11
  %24 = phi i64 [ 0, %11 ], [ %47, %23 ]
  %25 = getelementptr inbounds nuw i32, ptr %13, i64 %24
  %26 = load i32, ptr %25, align 4, !tbaa !5
  %27 = shl nsw i32 %26, 3
  %28 = tail call i32 @llvm.smax.i32(i32 %27, i32 -20)
  %29 = add nsw i32 %28, 20
  %30 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %29, i32 255)
  %31 = mul nsw i32 %26, 3
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 -30)
  %33 = add nsw i32 %32, 30
  %34 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %33, i32 255)
  %35 = shl nsw i32 %26, 1
  %36 = sub nsw i32 80, %35
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = tail call noundef range(i32 0, 256) i32 @llvm.umin.i32(i32 %37, i32 255)
  %39 = icmp eq i32 %26, 0
  %40 = shl nuw nsw i32 %30, 16
  %41 = shl nuw nsw i32 %34, 8
  %42 = or disjoint i32 %40, %41
  %43 = or disjoint i32 %42, %38
  %44 = or disjoint i32 %43, -16777216
  %45 = select i1 %39, i32 -16777216, i32 %44
  %46 = trunc nuw nsw i64 %24 to i32
  tail call void @simPutPixel(i32 noundef %46, i32 noundef %14, i32 noundef %45) #10
  %47 = add nuw nsw i64 %24, 1
  %48 = icmp eq i64 %47, 512
  br i1 %48, label %20, label %23, !llvm.loop !15

49:                                               ; preds = %49, %17
  %50 = phi i64 [ 0, %17 ], [ %55, %49 ]
  %51 = getelementptr inbounds nuw i32, ptr %2, i64 %50
  %52 = load i32, ptr %51, align 4, !tbaa !5
  %53 = getelementptr inbounds nuw i32, ptr %3, i64 %50
  %54 = load i32, ptr %53, align 4, !tbaa !5
  tail call void @simPutPixel(i32 noundef %52, i32 noundef %54, i32 noundef -3618616) #10
  %55 = add nuw nsw i64 %50, 1
  %56 = icmp eq i64 %55, %19
  br i1 %56, label %57, label %49, !llvm.loop !16

57:                                               ; preds = %49, %15
  tail call void @simFlush() #10
  br label %9
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #7

declare void @simFlush() local_unnamed_addr #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #9

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind }

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
