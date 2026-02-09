; ModuleID = 'input.ll'
source_filename = "input.ll"

; --- external functions ---
declare i32 @puts(ptr)
declare double @sqrt(double)

@.hello = private constant [15 x i8] c"Hello WasmEdge\00"

define i32 @add(i32 %a, i32 %b) {
entry:
  %sum = add i32 %a, %b
  ret i32 %sum
}

define i32 @mul(i32 %a, i32 %b) {
entry:
  %prod = mul i32 %a, %b
  ret i32 %prod
}

define double @sqrt_f64(double %x) {
entry:
  %r = call double @sqrt(double %x)
  ret double %r
}

define void @hello() {
entry:
  %str = getelementptr inbounds [15 x i8], ptr @.hello, i64 0, i64 0
  call i32 @puts(ptr %str)
  ret void
}

define i32 @abs(i32 %x) {
entry:
  %cmp = icmp slt i32 %x, 0
  br i1 %cmp, label %negate, label %done

negate:
  ; -INT_MIN overflows in i32, so clamp that one input to INT_MAX.
  %is_min = icmp eq i32 %x, -2147483648
  br i1 %is_min, label %min_value, label %negate_regular

negate_regular:
  %neg = sub i32 0, %x
  br label %done

min_value:
  br label %done

done:
  %result = phi i32 [ %x, %entry ], [ %neg, %negate_regular ], [ 2147483647, %min_value ]
  ret i32 %result
}

define i32 @main() {
entry:
  call void @hello()

  %a = call i32 @add(i32 -6, i32 2)
  %b = call i32 @mul(i32 %a, i32 3)
  %m = call i32 @abs(i32 %b)
  ret i32 %m
}
