

%class_A = type {
     %vfTableStructA*  ; procs_pointer
}

%vfTableStructA = type {
     i32(%class_A*, i32)*  ; give
}

@vtableGVarA = global %vfTableStructA  {
    i32(%class_A*, i32)* @give
}


define i32 @give(%class_A* %this, i32 %y) {
init:
    %y1 = alloca i32
    store i32 %y, i32* %y1
    %x = alloca i32
    ;12 start statement : {
    ;13 start statement : int x
    ;13 end statement: int x
    ;14 start statement : return 0;
    ret i32 0
    

}

define %class_A* @newClassA() {
init:
    %sizeOfStruct = add i32 0, 8
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_A*
    %iAddr = getelementptr %class_A, %class_A* %newObject, i32 0, i32 0
    store %vfTableStructA* @vtableGVarA, %vfTableStructA** %iAddr
    ret %class_A* %newObject
    

}

define i32 @main() {
init:
    %a = alloca %class_A*
    %x = alloca i32
    ;1 start statement : {
    ;2 start statement : A a
    ;2 end statement: A a
    ;3 start statement : a = new A();
    %NewObjectA = call %class_A* @newClassA()
    store %class_A* %NewObjectA, %class_A** %a
    ;3 end statement: a = new A();
    ;4 start statement : int x
    ;4 end statement: int x
    ;5 start statement : x = a.give(10);
    %t = load %class_A*, %class_A** %a
    %vtableAddr = getelementptr %class_A, %class_A* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructA*, %vfTableStructA** %vtableAddr
    %procAddr = getelementptr %vfTableStructA, %vfTableStructA* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_A*, i32)*, i32(%class_A*, i32)** %procAddr
    %give_result = call i32 %procPointer(%class_A* %t, i32 10)
    store i32 %give_result, i32* %x
    ;5 end statement: x = a.give(10);
    ;6 start statement : printInt(x);
    %t1 = load i32, i32* %x
    call void @print(i32 %t1)
    ;6 end statement: printInt(x);
    ;7 start statement : return 0;
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
