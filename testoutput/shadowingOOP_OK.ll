

%class_A = type {
     %vfTableStructA*  ; procs_pointer
    ,i32  ; b
}

%vfTableStructA = type {
     i32(%class_A*)*  ; check
}

@vtableGVarA = global %vfTableStructA  {
    i32(%class_A*)* @check
}


define i32 @check(%class_A* %this) {
init:
    %b = alloca i32
    ;11 start statement : {
    ;12 start statement : int b
    ;12 end statement: int b
    ;14 start statement : b = 1;
    store i32 1, i32* %b
    ;14 end statement: b = 1;
    ;15 start statement : this.b = 2;
    %iAddr = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    store i32 2, i32* %iAddr
    ;15 end statement: this.b = 2;
    ;16 start statement : printInt(b);
    %t = load i32, i32* %b
    call void @print(i32 %t)
    ;16 end statement: printInt(b);
    ;17 start statement : printInt(this.b);
    %iAddr1 = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    %t1 = load i32, i32* %iAddr1
    call void @print(i32 %t1)
    ;17 end statement: printInt(this.b);
    ;19 start statement : b = (1 + 1);
    %resAddImpl = add i32 1, 1
    store i32 %resAddImpl, i32* %b
    ;19 end statement: b = (1 + 1);
    ;20 start statement : this.b = (2 + 2);
    %iAddr2 = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    %resAddImpl1 = add i32 2, 2
    store i32 %resAddImpl1, i32* %iAddr2
    ;20 end statement: this.b = (2 + 2);
    ;21 start statement : printInt(b);
    %t2 = load i32, i32* %b
    call void @print(i32 %t2)
    ;21 end statement: printInt(b);
    ;22 start statement : printInt(this.b);
    %iAddr3 = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    %t3 = load i32, i32* %iAddr3
    call void @print(i32 %t3)
    ;22 end statement: printInt(this.b);
    ;24 start statement : return 0;
    ret i32 0
    

}

define %class_A* @newClassA() {
init:
    %sizeOfStruct = add i32 0, 16
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_A*
    %iAddr = getelementptr %class_A, %class_A* %newObject, i32 0, i32 0
    store %vfTableStructA* @vtableGVarA, %vfTableStructA** %iAddr
    ret %class_A* %newObject
    

}

define i32 @main() {
init:
    %a = alloca %class_A*
    ;1 start statement : {
    ;2 start statement : A a
    ;2 end statement: A a
    ;3 start statement : a = new A();
    %NewObjectA = call %class_A* @newClassA()
    store %class_A* %NewObjectA, %class_A** %a
    ;3 end statement: a = new A();
    ;4 start statement : printInt(a.check());
    %t = load %class_A*, %class_A** %a
    %vtableAddr = getelementptr %class_A, %class_A* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructA*, %vfTableStructA** %vtableAddr
    %procAddr = getelementptr %vfTableStructA, %vfTableStructA* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_A*)*, i32(%class_A*)** %procAddr
    %check_result = call i32 %procPointer(%class_A* %t)
    call void @print(i32 %check_result)
    ;4 end statement: printInt(a.check());
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
