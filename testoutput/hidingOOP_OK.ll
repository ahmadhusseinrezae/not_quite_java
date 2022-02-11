

%class_A = type {
     %vfTableStructA*  ; procs_pointer
    ,i32  ; x
    ,i32  ; x
}

%vfTableStructA = type {
     i32(%class_A*)*  ; give
}

%class_B = type {
     %vfTableStructB*  ; procs_pointer
    ,i32  ; x
}

%vfTableStructB = type {
     i32(%class_B*)*  ; give
}

@vtableGVarA = global %vfTableStructA  {
    i32(%class_A*)* @give1
}


@vtableGVarB = global %vfTableStructB  {
    i32(%class_B*)* @give
}


define i32 @give(%class_B* %this) {
init:
    ;22 start statement : {
    ;23 start statement : this.x = 11;
    %iAddr = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    store i32 11, i32* %iAddr
    ;23 end statement: this.x = 11;
    ;24 start statement : return this.x;
    %iAddr1 = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    %t = load i32, i32* %iAddr1
    ret i32 %t
    

}

define i32 @give1(%class_A* %this) {
init:
    ;13 start statement : {
    ;14 start statement : this.x = 10;
    %iAddr = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    store i32 10, i32* %iAddr
    ;14 end statement: this.x = 10;
    ;15 start statement : return this.x;
    %iAddr1 = getelementptr %class_A, %class_A* %this, i32 0, i32 1
    %t = load i32, i32* %iAddr1
    ret i32 %t
    

}

define %class_A* @newClassA() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_A*
    %iAddr = getelementptr %class_A, %class_A* %newObject, i32 0, i32 0
    store %vfTableStructA* @vtableGVarA, %vfTableStructA** %iAddr
    ret %class_A* %newObject
    

}

define %class_B* @newClassB() {
init:
    %sizeOfStruct = add i32 0, 16
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_B*
    %iAddr = getelementptr %class_B, %class_B* %newObject, i32 0, i32 0
    store %vfTableStructB* @vtableGVarB, %vfTableStructB** %iAddr
    ret %class_B* %newObject
    

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
    ;5 start statement : x = a.give();
    %t = load %class_A*, %class_A** %a
    %vtableAddr = getelementptr %class_A, %class_A* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructA*, %vfTableStructA** %vtableAddr
    %procAddr = getelementptr %vfTableStructA, %vfTableStructA* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_A*)*, i32(%class_A*)** %procAddr
    %give_result = call i32 %procPointer(%class_A* %t)
    store i32 %give_result, i32* %x
    ;5 end statement: x = a.give();
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
