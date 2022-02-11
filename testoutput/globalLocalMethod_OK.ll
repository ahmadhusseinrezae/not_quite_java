

%class_B = type {
     %vfTableStructB*  ; procs_pointer
}

%vfTableStructB = type {
     i32(%class_A*)*  ; show
    ,i32(%class_B*)*  ; check
}

%class_A = type {
     %vfTableStructA*  ; procs_pointer
}

%vfTableStructA = type {
     i32(%class_A*)*  ; show
}

@vtableGVarB = global %vfTableStructB  {
    i32(%class_A*)* @show,
    i32(%class_B*)* @check
}


@vtableGVarA = global %vfTableStructA  {
    i32(%class_A*)* @show
}


define i32 @show(%class_A* %this) {
init:
    %a = alloca i32
    ;17 start statement : {
    ;18 start statement : int a
    ;18 end statement: int a
    ;19 start statement : a = 20;
    store i32 20, i32* %a
    ;19 end statement: a = 20;
    ;20 start statement : printInt(a);
    %t = load i32, i32* %a
    call void @print(i32 %t)
    ;20 end statement: printInt(a);
    ;21 start statement : return 0;
    ret i32 0
    

}

define i32 @check(%class_B* %this) {
init:
    ;10 start statement : {
    ;11 start statement : show();
    %castValue = bitcast %class_B* %this to %class_A*
    %vtableAddr = getelementptr %class_A, %class_A* %castValue, i32 0, i32 0
    %vtablePointer = load %vfTableStructA*, %vfTableStructA** %vtableAddr
    %procAddr = getelementptr %vfTableStructA, %vfTableStructA* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_A*)*, i32(%class_A*)** %procAddr
    %show_result = call i32 %procPointer(%class_A* %castValue)
    ;11 end statement: show();
    ;12 start statement : return 0;
    ret i32 0
    

}

define %class_B* @newClassB() {
init:
    %sizeOfStruct = add i32 0, 8
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_B*
    %iAddr = getelementptr %class_B, %class_B* %newObject, i32 0, i32 0
    store %vfTableStructB* @vtableGVarB, %vfTableStructB** %iAddr
    ret %class_B* %newObject
    

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

define i32 @show1() {
init:
    %a = alloca i32
    ;25 start statement : {
    ;26 start statement : int a
    ;26 end statement: int a
    ;27 start statement : a = 10;
    store i32 10, i32* %a
    ;27 end statement: a = 10;
    ;28 start statement : printInt(a);
    %t = load i32, i32* %a
    call void @print(i32 %t)
    ;28 end statement: printInt(a);
    ;29 start statement : return 0;
    ret i32 0
    

}

define i32 @main() {
init:
    %b = alloca %class_B*
    ;1 start statement : {
    ;2 start statement : B b
    ;2 end statement: B b
    ;3 start statement : b = new B();
    %NewObjectB = call %class_B* @newClassB()
    store %class_B* %NewObjectB, %class_B** %b
    ;3 end statement: b = new B();
    ;4 start statement : printInt(show());
    %show_result = call i32 @show1()
    call void @print(i32 %show_result)
    ;4 end statement: printInt(show());
    ;5 start statement : b.check();
    %t = load %class_B*, %class_B** %b
    %vtableAddr = getelementptr %class_B, %class_B* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructB*, %vfTableStructB** %vtableAddr
    %procAddr = getelementptr %vfTableStructB, %vfTableStructB* %vtablePointer, i32 0, i32 1
    %procPointer = load i32(%class_B*)*, i32(%class_B*)** %procAddr
    %check_result = call i32 %procPointer(%class_B* %t)
    ;5 end statement: b.check();
    ;6 start statement : return 0;
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
