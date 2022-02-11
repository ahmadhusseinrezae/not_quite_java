@.print_message_1 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 16\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 16\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 18\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 18\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [29 x i8] c"Array Size must be positive\0A\00", align 1


%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

%class_B = type {
     %vfTableStructB*  ; procs_pointer
    ,i32  ; y
    ,%array_i32*  ; x
}

%vfTableStructB = type {
     i32(%class_B*, i32)*  ; give
}

@vtableGVarB = global %vfTableStructB  {
    i32(%class_B*, i32)* @give
}


define i32 @give(%class_B* %this, i32 %some) {
init:
    %some1 = alloca i32
    store i32 %some, i32* %some1
    ;14 start statement : {
    ;15 start statement : this.x = (new int[2]);
    %iAddr = getelementptr %class_B, %class_B* %this, i32 0, i32 2
    %newArray1 = call %array_i32* @newArray(i32 2)
    store %array_i32* %newArray1, %array_i32** %iAddr
    ;15 end statement: this.x = (new int[2]);
    ;16 start statement : this.x[0] = some;
    %iAddr1 = getelementptr %class_B, %class_B* %this, i32 0, i32 2
    %t = load %array_i32*, %array_i32** %iAddr1
    %isNull = icmp eq %array_i32* %t, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 16
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %length_addr = getelementptr %array_i32, %array_i32* %t, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 0, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, 0
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 16
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t, i32 0, i32 1, i32 0
    %t1 = load i32, i32* %some1
    store i32 %t1, i32* %indexAddr
    ;16 end statement: this.x[0] = some;
    ;17 start statement : this.y = 11;
    %iAddr2 = getelementptr %class_B, %class_B* %this, i32 0, i32 1
    store i32 11, i32* %iAddr2
    ;17 end statement: this.y = 11;
    ;18 start statement : return this.x[0];
    %iAddr3 = getelementptr %class_B, %class_B* %this, i32 0, i32 2
    %t2 = load %array_i32*, %array_i32** %iAddr3
    %isNull1 = icmp eq %array_i32* %t2, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 18
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %length_addr1 = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 0, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, 0
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 18
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 0
    %t3 = load i32, i32* %indexAddr1
    ret i32 %t3
    

}

define %class_B* @newClassB() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_B*
    %iAddr = getelementptr %class_B, %class_B* %newObject, i32 0, i32 0
    store %vfTableStructB* @vtableGVarB, %vfTableStructB** %iAddr
    ret %class_B* %newObject
    

}

define i32 @main() {
init:
    %a = alloca %class_B*
    %x = alloca i32
    ;1 start statement : {
    ;2 start statement : B a
    ;2 end statement: B a
    ;3 start statement : a = new B();
    %NewObjectB = call %class_B* @newClassB()
    store %class_B* %NewObjectB, %class_B** %a
    ;3 end statement: a = new B();
    ;4 start statement : int x
    ;4 end statement: int x
    ;5 start statement : x = a.give(10);
    %t = load %class_B*, %class_B** %a
    %vtableAddr = getelementptr %class_B, %class_B* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructB*, %vfTableStructB** %vtableAddr
    %procAddr = getelementptr %vfTableStructB, %vfTableStructB* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_B*, i32)*, i32(%class_B*, i32)** %procAddr
    %give_result = call i32 %procPointer(%class_B* %t, i32 10)
    store i32 %give_result, i32* %x
    ;5 end statement: x = a.give(10);
    ;6 start statement : printInt(x);
    %t1 = load i32, i32* %x
    call void @print(i32 %t1)
    ;6 end statement: printInt(x);
    ;7 start statement : return 0;
    ret i32 0
    

}

define %array_i32* @newArray(i32 %size) {
init:
    %sizeLessThanZero = icmp slt i32 %size, 0
    br i1 %sizeLessThanZero, label %negativeSize, label %goodSize
    
negativeSize:
    ; ERROR: Array Size must be positive
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.print_message_5, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
goodSize:
    %arraySizeInBytes = mul i32 %size, 4
    %arraySizeWitLen = add i32 %arraySizeInBytes, 4
    %mallocRes = call i8* @malloc(i32 %arraySizeWitLen)
    %newArray1 = bitcast i8* %mallocRes to %array_i32*
    %sizeAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 0
    store i32 %size, i32* %sizeAddr
    %iVar = alloca i32
    store i32 0, i32* %iVar
    br label %loopStart
    
loopStart:
    %i = load i32, i32* %iVar
    %smallerSize = icmp slt i32 %i, %size
    br i1 %smallerSize, label %loopBody, label %loopEnd
    
loopBody:
    %iAddr = getelementptr %array_i32, %array_i32* %newArray1, i32 0, i32 1, i32 %i
    store i32 0, i32* %iAddr
    %nextI = add i32 %i, 1
    store i32 %nextI, i32* %iVar
    br label %loopStart
    
loopEnd:
    ret %array_i32* %newArray1
    

}


declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32)

@.printstr = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
define void @print(i32 %i) {
	%temp = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.printstr, i32 0, i32 0), i32 %i)
	ret void
}
