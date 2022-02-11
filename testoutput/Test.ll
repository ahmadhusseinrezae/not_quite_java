

define i32 @get(i32 %a) {
init:
    %a1 = alloca i32
    store i32 %a, i32* %a1
    ;1 start statement : {
    ;1 start statement : return (44 + a);
    %t = load i32, i32* %a1
    %resAddImpl = add i32 44, %t
    ret i32 %resAddImpl
    

}

define i32 @main() {
init:
    %x = alloca i32
    ;1 start statement : {
    ;2 start statement : int x
    ;2 end statement: int x
    ;3 start statement : x = get(200);
    %get_result = call i32 @get(i32 200)
    store i32 %get_result, i32* %x
    ;3 end statement: x = get(200);
    ;4 start statement : printInt(x);
    %t = load i32, i32* %x
    call void @print(i32 %t)
    ;4 end statement: printInt(x);
    ;5 start statement : return 0;
    ret i32 0
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
	%temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
	ret void
}
