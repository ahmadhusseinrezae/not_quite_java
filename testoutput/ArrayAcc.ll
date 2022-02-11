@.print_message_1 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 10\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 10\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 15\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 15\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [29 x i8] c"Array Size must be positive\0A\00", align 1


%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

define i32 @main() {
init:
    %a = alloca %array_i32*
    %i = alloca i32
    %u = alloca i32
    ;1 start statement : {
    ;2 start statement : int[] a
    ;2 end statement: int[] a
    ;3 start statement : int i
    ;3 end statement: int i
    ;4 start statement : int u
    ;4 end statement: int u
    ;5 start statement : u = 5;
    store i32 5, i32* %u
    ;5 end statement: u = 5;
    ;7 start statement : a = (new int[u]);
    %t = load i32, i32* %u
    %newArray1 = call %array_i32* @newArray(i32 %t)
    store %array_i32* %newArray1, %array_i32** %a
    ;7 end statement: a = (new int[u]);
    ;8 start statement : i = 0;
    store i32 0, i32* %i
    ;8 end statement: i = 0;
    ;9 start statement : while ((i < u)) {
    br label %whileStart
    
whileStart:
    %t1 = load i32, i32* %i
    %t2 = load i32, i32* %u
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;9 start statement : {
    ;10 start statement : a[i] = (i + 1);
    %t3 = load %array_i32*, %array_i32** %a
    %isNull = icmp eq %array_i32* %t3, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 10
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t4 = load i32, i32* %i
    %length_addr = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t4, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t4
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 10
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 1, i32 %t4
    %t5 = load i32, i32* %i
    %resAddImpl = add i32 %t5, 1
    store i32 %resAddImpl, i32* %indexAddr
    ;10 end statement: a[i] = (i + 1);
    ;11 start statement : i = (i + 1);
    %t6 = load i32, i32* %i
    %resAddImpl1 = add i32 %t6, 1
    store i32 %resAddImpl1, i32* %i
    ;11 end statement: i = (i + 1);
    ;9 end statement: {
    br label %whileStart
    
endloop:
    ;9 end statement: while ((i < u)) {
    ;13 start statement : i = 0;
    store i32 0, i32* %i
    ;13 end statement: i = 0;
    ;14 start statement : while ((i < (u * 2))) {
    br label %whileStart1
    
whileStart1:
    %t7 = load i32, i32* %i
    %t8 = load i32, i32* %u
    %resMulImpl = mul i32 %t8, 2
    %resSltImpl1 = icmp slt i32 %t7, %resMulImpl
    br i1 %resSltImpl1, label %loopBodyStart1, label %endloop1
    
loopBodyStart1:
    ;14 start statement : {
    ;15 start statement : printInt(a[i]);
    %t9 = load %array_i32*, %array_i32** %a
    %isNull1 = icmp eq %array_i32* %t9, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 15
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %t10 = load i32, i32* %i
    %length_addr1 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 %t10, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, %t10
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 15
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 1, i32 %t10
    %t11 = load i32, i32* %indexAddr1
    call void @print(i32 %t11)
    ;15 end statement: printInt(a[i]);
    ;16 start statement : i = (i + 1);
    %t12 = load i32, i32* %i
    %resAddImpl2 = add i32 %t12, 1
    store i32 %resAddImpl2, i32* %i
    ;16 end statement: i = (i + 1);
    ;14 end statement: {
    br label %whileStart1
    
endloop1:
    ;14 end statement: while ((i < (u * 2))) {
    ;18 start statement : return 0;
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
