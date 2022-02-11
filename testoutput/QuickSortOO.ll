@.print_message_1 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 30\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 30\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 38\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 38\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 47\0A\00", align 1
@.print_message_6 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 47\0A\00", align 1
@.print_message_7 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 54\0A\00", align 1
@.print_message_8 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 54\0A\00", align 1
@.print_message_9 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 55\0A\00", align 1
@.print_message_10 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 55\0A\00", align 1
@.print_message_11 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 56\0A\00", align 1
@.print_message_12 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 56\0A\00", align 1
@.print_message_13 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 63\0A\00", align 1
@.print_message_14 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 63\0A\00", align 1
@.print_message_15 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 64\0A\00", align 1
@.print_message_16 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 64\0A\00", align 1
@.print_message_17 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 65\0A\00", align 1
@.print_message_18 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 65\0A\00", align 1
@.print_message_19 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 86\0A\00", align 1
@.print_message_20 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 86\0A\00", align 1
@.print_message_21 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 97\0A\00", align 1
@.print_message_22 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 97\0A\00", align 1
@.print_message_23 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 98\0A\00", align 1
@.print_message_24 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 98\0A\00", align 1
@.print_message_25 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 99\0A\00", align 1
@.print_message_26 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 99\0A\00", align 1
@.print_message_27 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 100\0A\00", align 1
@.print_message_28 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 100\0A\00", align 1
@.print_message_29 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 101\0A\00", align 1
@.print_message_30 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 101\0A\00", align 1
@.print_message_31 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 102\0A\00", align 1
@.print_message_32 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 102\0A\00", align 1
@.print_message_33 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 103\0A\00", align 1
@.print_message_34 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 103\0A\00", align 1
@.print_message_35 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 104\0A\00", align 1
@.print_message_36 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 104\0A\00", align 1
@.print_message_37 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 105\0A\00", align 1
@.print_message_38 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 105\0A\00", align 1
@.print_message_39 = private unnamed_addr constant [35 x i8] c"Nullpointer exception in line 106\0A\00", align 1
@.print_message_40 = private unnamed_addr constant [39 x i8] c"Index out of bounds error in line 106\0A\00", align 1
@.print_message_41 = private unnamed_addr constant [29 x i8] c"Array Size must be positive\0A\00", align 1


%class_QS = type {
     %vfTableStructQS*  ; procs_pointer
    ,i32  ; maxlen
}

%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

%vfTableStructQS = type {
     i32(%class_QS*, i32, i32, %array_i32*)*  ; Sort
}

%class_TestQS = type {
     %vfTableStructTestQS*  ; procs_pointer
    ,i32  ; maxlen
    ,%array_i32*  ; number
    ,i32  ; size
    ,i32  ; indent
}

%vfTableStructTestQS = type {
     i32(%class_QS*, i32, i32, %array_i32*)*  ; Sort
    ,i32(%class_TestQS*)*  ; Print
    ,i32(%class_TestQS*, i32)*  ; Init
    ,i32(%class_TestQS*, i32)*  ; Start
}

@vtableGVarQS = global %vfTableStructQS  {
    i32(%class_QS*, i32, i32, %array_i32*)* @Sort
}


@vtableGVarTestQS = global %vfTableStructTestQS  {
    i32(%class_QS*, i32, i32, %array_i32*)* @Sort,
    i32(%class_TestQS*)* @Print,
    i32(%class_TestQS*, i32)* @Init,
    i32(%class_TestQS*, i32)* @Start
}


define i32 @Sort(%class_QS* %this, i32 %left, i32 %right, %array_i32* %number) {
init:
    %left1 = alloca i32
    store i32 %left, i32* %left1
    %right1 = alloca i32
    store i32 %right, i32* %right1
    %number1 = alloca %array_i32*
    store %array_i32* %number, %array_i32** %number1
    %v = alloca i32
    %i = alloca i32
    %j = alloca i32
    %nt = alloca i32
    %t = alloca i32
    %cont01 = alloca i1
    %cont02 = alloca i1
    %aux03 = alloca i32
    ;15 start statement : {
    ;16 start statement : int v
    ;16 end statement: int v
    ;17 start statement : int i
    ;17 end statement: int i
    ;18 start statement : int j
    ;18 end statement: int j
    ;19 start statement : int nt
    ;19 end statement: int nt
    ;20 start statement : int t
    ;20 end statement: int t
    ;21 start statement : boolean cont01
    ;21 end statement: boolean cont01
    ;22 start statement : boolean cont02
    ;22 end statement: boolean cont02
    ;23 start statement : int aux03
    ;23 end statement: int aux03
    ;24 start statement : if ((maxlen < right)) maxlen = right;
    %iAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t1 = load i32, i32* %iAddr
    %t2 = load i32, i32* %right1
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;25 start statement : maxlen = right;
    %iAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t3 = load i32, i32* %right1
    store i32 %t3, i32* %iAddr1
    ;25 end statement: maxlen = right;
    br label %endif
    
ifFalse:
    ;27 start statement : maxlen = maxlen;
    %iAddr2 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %iAddr3 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t4 = load i32, i32* %iAddr3
    store i32 %t4, i32* %iAddr2
    ;27 end statement: maxlen = maxlen;
    br label %endif
    
endif:
    ;24 end statement: if ((maxlen < right)) maxlen = right;
    ;28 start statement : t = 0;
    store i32 0, i32* %t
    ;28 end statement: t = 0;
    ;29 start statement : if ((left < right)) {
    %t5 = load i32, i32* %left1
    %t6 = load i32, i32* %right1
    %resSltImpl1 = icmp slt i32 %t5, %t6
    br i1 %resSltImpl1, label %ifTrue1, label %ifFalse4
    
ifTrue1:
    ;29 start statement : {
    ;30 start statement : v = number[right];
    %t7 = load %array_i32*, %array_i32** %number1
    %isNull = icmp eq %array_i32* %t7, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 30
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t8 = load i32, i32* %right1
    %length_addr = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t8, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t8
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 30
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 1, i32 %t8
    %t9 = load i32, i32* %indexAddr
    store i32 %t9, i32* %v
    ;30 end statement: v = number[right];
    ;31 start statement : i = (left - 1);
    %t10 = load i32, i32* %left1
    %resSubImpl = sub i32 %t10, 1
    store i32 %resSubImpl, i32* %i
    ;31 end statement: i = (left - 1);
    ;32 start statement : j = right;
    %t11 = load i32, i32* %right1
    store i32 %t11, i32* %j
    ;32 end statement: j = right;
    ;33 start statement : cont01 = true;
    store i1 1, i1* %cont01
    ;33 end statement: cont01 = true;
    ;34 start statement : while (cont01) {
    br label %whileStart
    
whileStart:
    %t12 = load i1, i1* %cont01
    br i1 %t12, label %loopBodyStart, label %endloop2
    
loopBodyStart:
    ;34 start statement : {
    ;35 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;35 end statement: cont02 = true;
    ;36 start statement : while (cont02) {
    br label %whileStart1
    
whileStart1:
    %t13 = load i1, i1* %cont02
    br i1 %t13, label %loopBodyStart1, label %endloop
    
loopBodyStart1:
    ;36 start statement : {
    ;37 start statement : i = (i + 1);
    %t14 = load i32, i32* %i
    %resAddImpl = add i32 %t14, 1
    store i32 %resAddImpl, i32* %i
    ;37 end statement: i = (i + 1);
    ;38 start statement : aux03 = number[i];
    %t15 = load %array_i32*, %array_i32** %number1
    %isNull1 = icmp eq %array_i32* %t15, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 38
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %t16 = load i32, i32* %i
    %length_addr1 = getelementptr %array_i32, %array_i32* %t15, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 %t16, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, %t16
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 38
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t15, i32 0, i32 1, i32 %t16
    %t17 = load i32, i32* %indexAddr1
    store i32 %t17, i32* %aux03
    ;38 end statement: aux03 = number[i];
    ;39 start statement : if ((! (aux03 < v))) cont02 = false;
    %t18 = load i32, i32* %aux03
    %t19 = load i32, i32* %v
    %resSltImpl2 = icmp slt i32 %t18, %t19
    %neg_res = icmp eq i1 0, %resSltImpl2
    br i1 %neg_res, label %ifTrue2, label %ifFalse1
    
ifTrue2:
    ;40 start statement : cont02 = false;
    store i1 0, i1* %cont02
    ;40 end statement: cont02 = false;
    br label %endif1
    
ifFalse1:
    ;42 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;42 end statement: cont02 = true;
    br label %endif1
    
endif1:
    ;39 end statement: if ((! (aux03 < v))) cont02 = false;
    ;36 end statement: {
    br label %whileStart1
    
endloop:
    ;36 end statement: while (cont02) {
    ;44 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;44 end statement: cont02 = true;
    ;45 start statement : while (cont02) {
    br label %whileStart2
    
whileStart2:
    %t20 = load i1, i1* %cont02
    br i1 %t20, label %loopBodyStart2, label %endloop1
    
loopBodyStart2:
    ;45 start statement : {
    ;46 start statement : j = (j - 1);
    %t21 = load i32, i32* %j
    %resSubImpl1 = sub i32 %t21, 1
    store i32 %resSubImpl1, i32* %j
    ;46 end statement: j = (j - 1);
    ;47 start statement : aux03 = number[j];
    %t22 = load %array_i32*, %array_i32** %number1
    %isNull2 = icmp eq %array_i32* %t22, null
    br i1 %isNull2, label %whenIsNull2, label %notNull2
    
whenIsNull2:
    ; ERROR: Nullpointer exception in line 47
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_5, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull2:
    %t23 = load i32, i32* %j
    %length_addr2 = getelementptr %array_i32, %array_i32* %t22, i32 0, i32 0
    %len2 = load i32, i32* %length_addr2
    %smallerZero2 = icmp slt i32 %t23, 0
    %lenMinusOne2 = sub i32 %len2, 1
    %greaterEqualLen2 = icmp slt i32 %lenMinusOne2, %t23
    %outOfBounds4 = or i1 %smallerZero2, %greaterEqualLen2
    br i1 %outOfBounds4, label %outOfBounds5, label %indexInRange2
    
outOfBounds5:
    ; ERROR: Index out of bounds error in line 47
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_6, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange2:
    %indexAddr2 = getelementptr %array_i32, %array_i32* %t22, i32 0, i32 1, i32 %t23
    %t24 = load i32, i32* %indexAddr2
    store i32 %t24, i32* %aux03
    ;47 end statement: aux03 = number[j];
    ;48 start statement : if ((! (v < aux03))) cont02 = false;
    %t25 = load i32, i32* %v
    %t26 = load i32, i32* %aux03
    %resSltImpl3 = icmp slt i32 %t25, %t26
    %neg_res1 = icmp eq i1 0, %resSltImpl3
    br i1 %neg_res1, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;49 start statement : cont02 = false;
    store i1 0, i1* %cont02
    ;49 end statement: cont02 = false;
    br label %endif2
    
ifFalse2:
    ;51 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;51 end statement: cont02 = true;
    br label %endif2
    
endif2:
    ;48 end statement: if ((! (v < aux03))) cont02 = false;
    ;45 end statement: {
    br label %whileStart2
    
endloop1:
    ;45 end statement: while (cont02) {
    ;54 start statement : t = number[i];
    %t27 = load %array_i32*, %array_i32** %number1
    %isNull3 = icmp eq %array_i32* %t27, null
    br i1 %isNull3, label %whenIsNull3, label %notNull3
    
whenIsNull3:
    ; ERROR: Nullpointer exception in line 54
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_7, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull3:
    %t28 = load i32, i32* %i
    %length_addr3 = getelementptr %array_i32, %array_i32* %t27, i32 0, i32 0
    %len3 = load i32, i32* %length_addr3
    %smallerZero3 = icmp slt i32 %t28, 0
    %lenMinusOne3 = sub i32 %len3, 1
    %greaterEqualLen3 = icmp slt i32 %lenMinusOne3, %t28
    %outOfBounds6 = or i1 %smallerZero3, %greaterEqualLen3
    br i1 %outOfBounds6, label %outOfBounds7, label %indexInRange3
    
outOfBounds7:
    ; ERROR: Index out of bounds error in line 54
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_8, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange3:
    %indexAddr3 = getelementptr %array_i32, %array_i32* %t27, i32 0, i32 1, i32 %t28
    %t29 = load i32, i32* %indexAddr3
    store i32 %t29, i32* %t
    ;54 end statement: t = number[i];
    ;55 start statement : number[i] = number[j];
    %t30 = load %array_i32*, %array_i32** %number1
    %isNull4 = icmp eq %array_i32* %t30, null
    br i1 %isNull4, label %whenIsNull4, label %notNull4
    
whenIsNull4:
    ; ERROR: Nullpointer exception in line 55
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_9, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull4:
    %t31 = load i32, i32* %i
    %length_addr4 = getelementptr %array_i32, %array_i32* %t30, i32 0, i32 0
    %len4 = load i32, i32* %length_addr4
    %smallerZero4 = icmp slt i32 %t31, 0
    %lenMinusOne4 = sub i32 %len4, 1
    %greaterEqualLen4 = icmp slt i32 %lenMinusOne4, %t31
    %outOfBounds8 = or i1 %smallerZero4, %greaterEqualLen4
    br i1 %outOfBounds8, label %outOfBounds9, label %indexInRange4
    
outOfBounds9:
    ; ERROR: Index out of bounds error in line 55
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_10, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange4:
    %indexAddr4 = getelementptr %array_i32, %array_i32* %t30, i32 0, i32 1, i32 %t31
    %t32 = load %array_i32*, %array_i32** %number1
    %isNull5 = icmp eq %array_i32* %t32, null
    br i1 %isNull5, label %whenIsNull5, label %notNull5
    
whenIsNull5:
    ; ERROR: Nullpointer exception in line 55
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_9, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull5:
    %t33 = load i32, i32* %j
    %length_addr5 = getelementptr %array_i32, %array_i32* %t32, i32 0, i32 0
    %len5 = load i32, i32* %length_addr5
    %smallerZero5 = icmp slt i32 %t33, 0
    %lenMinusOne5 = sub i32 %len5, 1
    %greaterEqualLen5 = icmp slt i32 %lenMinusOne5, %t33
    %outOfBounds10 = or i1 %smallerZero5, %greaterEqualLen5
    br i1 %outOfBounds10, label %outOfBounds11, label %indexInRange5
    
outOfBounds11:
    ; ERROR: Index out of bounds error in line 55
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_10, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange5:
    %indexAddr5 = getelementptr %array_i32, %array_i32* %t32, i32 0, i32 1, i32 %t33
    %t34 = load i32, i32* %indexAddr5
    store i32 %t34, i32* %indexAddr4
    ;55 end statement: number[i] = number[j];
    ;56 start statement : number[j] = t;
    %t35 = load %array_i32*, %array_i32** %number1
    %isNull6 = icmp eq %array_i32* %t35, null
    br i1 %isNull6, label %whenIsNull6, label %notNull6
    
whenIsNull6:
    ; ERROR: Nullpointer exception in line 56
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_11, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull6:
    %t36 = load i32, i32* %j
    %length_addr6 = getelementptr %array_i32, %array_i32* %t35, i32 0, i32 0
    %len6 = load i32, i32* %length_addr6
    %smallerZero6 = icmp slt i32 %t36, 0
    %lenMinusOne6 = sub i32 %len6, 1
    %greaterEqualLen6 = icmp slt i32 %lenMinusOne6, %t36
    %outOfBounds12 = or i1 %smallerZero6, %greaterEqualLen6
    br i1 %outOfBounds12, label %outOfBounds13, label %indexInRange6
    
outOfBounds13:
    ; ERROR: Index out of bounds error in line 56
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_12, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange6:
    %indexAddr6 = getelementptr %array_i32, %array_i32* %t35, i32 0, i32 1, i32 %t36
    %t37 = load i32, i32* %t
    store i32 %t37, i32* %indexAddr6
    ;56 end statement: number[j] = t;
    ;58 start statement : if ((j < (i + 1))) cont01 = false;
    %t38 = load i32, i32* %j
    %t39 = load i32, i32* %i
    %resAddImpl1 = add i32 %t39, 1
    %resSltImpl4 = icmp slt i32 %t38, %resAddImpl1
    br i1 %resSltImpl4, label %ifTrue4, label %ifFalse3
    
ifTrue4:
    ;59 start statement : cont01 = false;
    store i1 0, i1* %cont01
    ;59 end statement: cont01 = false;
    br label %endif3
    
ifFalse3:
    ;61 start statement : cont01 = true;
    store i1 1, i1* %cont01
    ;61 end statement: cont01 = true;
    br label %endif3
    
endif3:
    ;58 end statement: if ((j < (i + 1))) cont01 = false;
    ;34 end statement: {
    br label %whileStart
    
endloop2:
    ;34 end statement: while (cont01) {
    ;63 start statement : number[j] = number[i];
    %t40 = load %array_i32*, %array_i32** %number1
    %isNull7 = icmp eq %array_i32* %t40, null
    br i1 %isNull7, label %whenIsNull7, label %notNull7
    
whenIsNull7:
    ; ERROR: Nullpointer exception in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_13, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull7:
    %t41 = load i32, i32* %j
    %length_addr7 = getelementptr %array_i32, %array_i32* %t40, i32 0, i32 0
    %len7 = load i32, i32* %length_addr7
    %smallerZero7 = icmp slt i32 %t41, 0
    %lenMinusOne7 = sub i32 %len7, 1
    %greaterEqualLen7 = icmp slt i32 %lenMinusOne7, %t41
    %outOfBounds14 = or i1 %smallerZero7, %greaterEqualLen7
    br i1 %outOfBounds14, label %outOfBounds15, label %indexInRange7
    
outOfBounds15:
    ; ERROR: Index out of bounds error in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_14, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange7:
    %indexAddr7 = getelementptr %array_i32, %array_i32* %t40, i32 0, i32 1, i32 %t41
    %t42 = load %array_i32*, %array_i32** %number1
    %isNull8 = icmp eq %array_i32* %t42, null
    br i1 %isNull8, label %whenIsNull8, label %notNull8
    
whenIsNull8:
    ; ERROR: Nullpointer exception in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_13, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull8:
    %t43 = load i32, i32* %i
    %length_addr8 = getelementptr %array_i32, %array_i32* %t42, i32 0, i32 0
    %len8 = load i32, i32* %length_addr8
    %smallerZero8 = icmp slt i32 %t43, 0
    %lenMinusOne8 = sub i32 %len8, 1
    %greaterEqualLen8 = icmp slt i32 %lenMinusOne8, %t43
    %outOfBounds16 = or i1 %smallerZero8, %greaterEqualLen8
    br i1 %outOfBounds16, label %outOfBounds17, label %indexInRange8
    
outOfBounds17:
    ; ERROR: Index out of bounds error in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_14, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange8:
    %indexAddr8 = getelementptr %array_i32, %array_i32* %t42, i32 0, i32 1, i32 %t43
    %t44 = load i32, i32* %indexAddr8
    store i32 %t44, i32* %indexAddr7
    ;63 end statement: number[j] = number[i];
    ;64 start statement : number[i] = number[right];
    %t45 = load %array_i32*, %array_i32** %number1
    %isNull9 = icmp eq %array_i32* %t45, null
    br i1 %isNull9, label %whenIsNull9, label %notNull9
    
whenIsNull9:
    ; ERROR: Nullpointer exception in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_15, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull9:
    %t46 = load i32, i32* %i
    %length_addr9 = getelementptr %array_i32, %array_i32* %t45, i32 0, i32 0
    %len9 = load i32, i32* %length_addr9
    %smallerZero9 = icmp slt i32 %t46, 0
    %lenMinusOne9 = sub i32 %len9, 1
    %greaterEqualLen9 = icmp slt i32 %lenMinusOne9, %t46
    %outOfBounds18 = or i1 %smallerZero9, %greaterEqualLen9
    br i1 %outOfBounds18, label %outOfBounds19, label %indexInRange9
    
outOfBounds19:
    ; ERROR: Index out of bounds error in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_16, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange9:
    %indexAddr9 = getelementptr %array_i32, %array_i32* %t45, i32 0, i32 1, i32 %t46
    %t47 = load %array_i32*, %array_i32** %number1
    %isNull10 = icmp eq %array_i32* %t47, null
    br i1 %isNull10, label %whenIsNull10, label %notNull10
    
whenIsNull10:
    ; ERROR: Nullpointer exception in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_15, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull10:
    %t48 = load i32, i32* %right1
    %length_addr10 = getelementptr %array_i32, %array_i32* %t47, i32 0, i32 0
    %len10 = load i32, i32* %length_addr10
    %smallerZero10 = icmp slt i32 %t48, 0
    %lenMinusOne10 = sub i32 %len10, 1
    %greaterEqualLen10 = icmp slt i32 %lenMinusOne10, %t48
    %outOfBounds20 = or i1 %smallerZero10, %greaterEqualLen10
    br i1 %outOfBounds20, label %outOfBounds21, label %indexInRange10
    
outOfBounds21:
    ; ERROR: Index out of bounds error in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_16, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange10:
    %indexAddr10 = getelementptr %array_i32, %array_i32* %t47, i32 0, i32 1, i32 %t48
    %t49 = load i32, i32* %indexAddr10
    store i32 %t49, i32* %indexAddr9
    ;64 end statement: number[i] = number[right];
    ;65 start statement : number[right] = t;
    %t50 = load %array_i32*, %array_i32** %number1
    %isNull11 = icmp eq %array_i32* %t50, null
    br i1 %isNull11, label %whenIsNull11, label %notNull11
    
whenIsNull11:
    ; ERROR: Nullpointer exception in line 65
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_17, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull11:
    %t51 = load i32, i32* %right1
    %length_addr11 = getelementptr %array_i32, %array_i32* %t50, i32 0, i32 0
    %len11 = load i32, i32* %length_addr11
    %smallerZero11 = icmp slt i32 %t51, 0
    %lenMinusOne11 = sub i32 %len11, 1
    %greaterEqualLen11 = icmp slt i32 %lenMinusOne11, %t51
    %outOfBounds22 = or i1 %smallerZero11, %greaterEqualLen11
    br i1 %outOfBounds22, label %outOfBounds23, label %indexInRange11
    
outOfBounds23:
    ; ERROR: Index out of bounds error in line 65
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_18, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange11:
    %indexAddr11 = getelementptr %array_i32, %array_i32* %t50, i32 0, i32 1, i32 %t51
    %t52 = load i32, i32* %t
    store i32 %t52, i32* %indexAddr11
    ;65 end statement: number[right] = t;
    ;66 start statement : nt = this.Sort(left, (i - 1), number);
    %t53 = load i32, i32* %left1
    %t54 = load i32, i32* %i
    %resSubImpl2 = sub i32 %t54, 1
    %t55 = load %array_i32*, %array_i32** %number1
    %vtableAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_QS*, i32, i32, %array_i32*)*, i32(%class_QS*, i32, i32, %array_i32*)** %procAddr
    %Sort_result = call i32 %procPointer(%class_QS* %this, i32 %t53, i32 %resSubImpl2, %array_i32* %t55)
    store i32 %Sort_result, i32* %nt
    ;66 end statement: nt = this.Sort(left, (i - 1), number);
    ;67 start statement : nt = this.Sort((i + 1), right, number);
    %t56 = load i32, i32* %i
    %resAddImpl2 = add i32 %t56, 1
    %t57 = load i32, i32* %right1
    %t58 = load %array_i32*, %array_i32** %number1
    %vtableAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer1, i32 0, i32 0
    %procPointer1 = load i32(%class_QS*, i32, i32, %array_i32*)*, i32(%class_QS*, i32, i32, %array_i32*)** %procAddr1
    %Sort_result1 = call i32 %procPointer1(%class_QS* %this, i32 %resAddImpl2, i32 %t57, %array_i32* %t58)
    store i32 %Sort_result1, i32* %nt
    ;67 end statement: nt = this.Sort((i + 1), right, number);
    ;29 end statement: {
    br label %endif4
    
ifFalse4:
    ;69 start statement : nt = 0;
    store i32 0, i32* %nt
    ;69 end statement: nt = 0;
    br label %endif4
    
endif4:
    ;29 end statement: if ((left < right)) {
    ;70 start statement : return 0;
    ret i32 0
    

}

define %class_QS* @newClassQS() {
init:
    %sizeOfStruct = add i32 0, 16
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_QS*
    %iAddr = getelementptr %class_QS, %class_QS* %newObject, i32 0, i32 0
    store %vfTableStructQS* @vtableGVarQS, %vfTableStructQS** %iAddr
    ret %class_QS* %newObject
    

}

define i32 @Print(%class_TestQS* %this) {
init:
    %j = alloca i32
    ;82 start statement : {
    ;83 start statement : int j
    ;83 end statement: int j
    ;84 start statement : j = 0;
    store i32 0, i32* %j
    ;84 end statement: j = 0;
    ;85 start statement : while ((j < size)) {
    br label %whileStart
    
whileStart:
    %t = load i32, i32* %j
    %iAddr = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 3
    %t1 = load i32, i32* %iAddr
    %resSltImpl = icmp slt i32 %t, %t1
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;85 start statement : {
    ;86 start statement : printInt(number[j]);
    %iAddr1 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t2 = load %array_i32*, %array_i32** %iAddr1
    %isNull = icmp eq %array_i32* %t2, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 86
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_19, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t3 = load i32, i32* %j
    %length_addr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t3, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t3
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 86
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_20, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 %t3
    %t4 = load i32, i32* %indexAddr
    call void @print(i32 %t4)
    ;86 end statement: printInt(number[j]);
    ;87 start statement : j = (j + 1);
    %t5 = load i32, i32* %j
    %resAddImpl = add i32 %t5, 1
    store i32 %resAddImpl, i32* %j
    ;87 end statement: j = (j + 1);
    ;85 end statement: {
    br label %whileStart
    
endloop:
    ;85 end statement: while ((j < size)) {
    ;89 start statement : return 0;
    ret i32 0
    

}

define i32 @Init(%class_TestQS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    ;93 start statement : {
    ;94 start statement : size = sz;
    %iAddr = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 3
    %t = load i32, i32* %sz1
    store i32 %t, i32* %iAddr
    ;94 end statement: size = sz;
    ;95 start statement : number = (new int[sz]);
    %iAddr1 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t1 = load i32, i32* %sz1
    %newArray1 = call %array_i32* @newArray(i32 %t1)
    store %array_i32* %newArray1, %array_i32** %iAddr1
    ;95 end statement: number = (new int[sz]);
    ;97 start statement : number[0] = 20;
    %iAddr2 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t2 = load %array_i32*, %array_i32** %iAddr2
    %isNull = icmp eq %array_i32* %t2, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 97
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_21, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %length_addr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 0, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, 0
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 97
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_22, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 0
    store i32 20, i32* %indexAddr
    ;97 end statement: number[0] = 20;
    ;98 start statement : number[1] = 7;
    %iAddr3 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t3 = load %array_i32*, %array_i32** %iAddr3
    %isNull1 = icmp eq %array_i32* %t3, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 98
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_23, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %length_addr1 = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 1, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, 1
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 98
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_24, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 1, i32 1
    store i32 7, i32* %indexAddr1
    ;98 end statement: number[1] = 7;
    ;99 start statement : number[2] = 12;
    %iAddr4 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t4 = load %array_i32*, %array_i32** %iAddr4
    %isNull2 = icmp eq %array_i32* %t4, null
    br i1 %isNull2, label %whenIsNull2, label %notNull2
    
whenIsNull2:
    ; ERROR: Nullpointer exception in line 99
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_25, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull2:
    %length_addr2 = getelementptr %array_i32, %array_i32* %t4, i32 0, i32 0
    %len2 = load i32, i32* %length_addr2
    %smallerZero2 = icmp slt i32 2, 0
    %lenMinusOne2 = sub i32 %len2, 1
    %greaterEqualLen2 = icmp slt i32 %lenMinusOne2, 2
    %outOfBounds4 = or i1 %smallerZero2, %greaterEqualLen2
    br i1 %outOfBounds4, label %outOfBounds5, label %indexInRange2
    
outOfBounds5:
    ; ERROR: Index out of bounds error in line 99
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_26, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange2:
    %indexAddr2 = getelementptr %array_i32, %array_i32* %t4, i32 0, i32 1, i32 2
    store i32 12, i32* %indexAddr2
    ;99 end statement: number[2] = 12;
    ;100 start statement : number[3] = 18;
    %iAddr5 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t5 = load %array_i32*, %array_i32** %iAddr5
    %isNull3 = icmp eq %array_i32* %t5, null
    br i1 %isNull3, label %whenIsNull3, label %notNull3
    
whenIsNull3:
    ; ERROR: Nullpointer exception in line 100
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_27, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull3:
    %length_addr3 = getelementptr %array_i32, %array_i32* %t5, i32 0, i32 0
    %len3 = load i32, i32* %length_addr3
    %smallerZero3 = icmp slt i32 3, 0
    %lenMinusOne3 = sub i32 %len3, 1
    %greaterEqualLen3 = icmp slt i32 %lenMinusOne3, 3
    %outOfBounds6 = or i1 %smallerZero3, %greaterEqualLen3
    br i1 %outOfBounds6, label %outOfBounds7, label %indexInRange3
    
outOfBounds7:
    ; ERROR: Index out of bounds error in line 100
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_28, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange3:
    %indexAddr3 = getelementptr %array_i32, %array_i32* %t5, i32 0, i32 1, i32 3
    store i32 18, i32* %indexAddr3
    ;100 end statement: number[3] = 18;
    ;101 start statement : number[4] = 2;
    %iAddr6 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t6 = load %array_i32*, %array_i32** %iAddr6
    %isNull4 = icmp eq %array_i32* %t6, null
    br i1 %isNull4, label %whenIsNull4, label %notNull4
    
whenIsNull4:
    ; ERROR: Nullpointer exception in line 101
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_29, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull4:
    %length_addr4 = getelementptr %array_i32, %array_i32* %t6, i32 0, i32 0
    %len4 = load i32, i32* %length_addr4
    %smallerZero4 = icmp slt i32 4, 0
    %lenMinusOne4 = sub i32 %len4, 1
    %greaterEqualLen4 = icmp slt i32 %lenMinusOne4, 4
    %outOfBounds8 = or i1 %smallerZero4, %greaterEqualLen4
    br i1 %outOfBounds8, label %outOfBounds9, label %indexInRange4
    
outOfBounds9:
    ; ERROR: Index out of bounds error in line 101
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_30, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange4:
    %indexAddr4 = getelementptr %array_i32, %array_i32* %t6, i32 0, i32 1, i32 4
    store i32 2, i32* %indexAddr4
    ;101 end statement: number[4] = 2;
    ;102 start statement : number[5] = 11;
    %iAddr7 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t7 = load %array_i32*, %array_i32** %iAddr7
    %isNull5 = icmp eq %array_i32* %t7, null
    br i1 %isNull5, label %whenIsNull5, label %notNull5
    
whenIsNull5:
    ; ERROR: Nullpointer exception in line 102
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_31, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull5:
    %length_addr5 = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 0
    %len5 = load i32, i32* %length_addr5
    %smallerZero5 = icmp slt i32 5, 0
    %lenMinusOne5 = sub i32 %len5, 1
    %greaterEqualLen5 = icmp slt i32 %lenMinusOne5, 5
    %outOfBounds10 = or i1 %smallerZero5, %greaterEqualLen5
    br i1 %outOfBounds10, label %outOfBounds11, label %indexInRange5
    
outOfBounds11:
    ; ERROR: Index out of bounds error in line 102
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_32, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange5:
    %indexAddr5 = getelementptr %array_i32, %array_i32* %t7, i32 0, i32 1, i32 5
    store i32 11, i32* %indexAddr5
    ;102 end statement: number[5] = 11;
    ;103 start statement : number[6] = 6;
    %iAddr8 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t8 = load %array_i32*, %array_i32** %iAddr8
    %isNull6 = icmp eq %array_i32* %t8, null
    br i1 %isNull6, label %whenIsNull6, label %notNull6
    
whenIsNull6:
    ; ERROR: Nullpointer exception in line 103
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_33, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull6:
    %length_addr6 = getelementptr %array_i32, %array_i32* %t8, i32 0, i32 0
    %len6 = load i32, i32* %length_addr6
    %smallerZero6 = icmp slt i32 6, 0
    %lenMinusOne6 = sub i32 %len6, 1
    %greaterEqualLen6 = icmp slt i32 %lenMinusOne6, 6
    %outOfBounds12 = or i1 %smallerZero6, %greaterEqualLen6
    br i1 %outOfBounds12, label %outOfBounds13, label %indexInRange6
    
outOfBounds13:
    ; ERROR: Index out of bounds error in line 103
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_34, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange6:
    %indexAddr6 = getelementptr %array_i32, %array_i32* %t8, i32 0, i32 1, i32 6
    store i32 6, i32* %indexAddr6
    ;103 end statement: number[6] = 6;
    ;104 start statement : number[7] = 9;
    %iAddr9 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t9 = load %array_i32*, %array_i32** %iAddr9
    %isNull7 = icmp eq %array_i32* %t9, null
    br i1 %isNull7, label %whenIsNull7, label %notNull7
    
whenIsNull7:
    ; ERROR: Nullpointer exception in line 104
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_35, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull7:
    %length_addr7 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 0
    %len7 = load i32, i32* %length_addr7
    %smallerZero7 = icmp slt i32 7, 0
    %lenMinusOne7 = sub i32 %len7, 1
    %greaterEqualLen7 = icmp slt i32 %lenMinusOne7, 7
    %outOfBounds14 = or i1 %smallerZero7, %greaterEqualLen7
    br i1 %outOfBounds14, label %outOfBounds15, label %indexInRange7
    
outOfBounds15:
    ; ERROR: Index out of bounds error in line 104
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_36, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange7:
    %indexAddr7 = getelementptr %array_i32, %array_i32* %t9, i32 0, i32 1, i32 7
    store i32 9, i32* %indexAddr7
    ;104 end statement: number[7] = 9;
    ;105 start statement : number[8] = 19;
    %iAddr10 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t10 = load %array_i32*, %array_i32** %iAddr10
    %isNull8 = icmp eq %array_i32* %t10, null
    br i1 %isNull8, label %whenIsNull8, label %notNull8
    
whenIsNull8:
    ; ERROR: Nullpointer exception in line 105
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_37, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull8:
    %length_addr8 = getelementptr %array_i32, %array_i32* %t10, i32 0, i32 0
    %len8 = load i32, i32* %length_addr8
    %smallerZero8 = icmp slt i32 8, 0
    %lenMinusOne8 = sub i32 %len8, 1
    %greaterEqualLen8 = icmp slt i32 %lenMinusOne8, 8
    %outOfBounds16 = or i1 %smallerZero8, %greaterEqualLen8
    br i1 %outOfBounds16, label %outOfBounds17, label %indexInRange8
    
outOfBounds17:
    ; ERROR: Index out of bounds error in line 105
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_38, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange8:
    %indexAddr8 = getelementptr %array_i32, %array_i32* %t10, i32 0, i32 1, i32 8
    store i32 19, i32* %indexAddr8
    ;105 end statement: number[8] = 19;
    ;106 start statement : number[9] = 5;
    %iAddr11 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t11 = load %array_i32*, %array_i32** %iAddr11
    %isNull9 = icmp eq %array_i32* %t11, null
    br i1 %isNull9, label %whenIsNull9, label %notNull9
    
whenIsNull9:
    ; ERROR: Nullpointer exception in line 106
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.print_message_39, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull9:
    %length_addr9 = getelementptr %array_i32, %array_i32* %t11, i32 0, i32 0
    %len9 = load i32, i32* %length_addr9
    %smallerZero9 = icmp slt i32 9, 0
    %lenMinusOne9 = sub i32 %len9, 1
    %greaterEqualLen9 = icmp slt i32 %lenMinusOne9, 9
    %outOfBounds18 = or i1 %smallerZero9, %greaterEqualLen9
    br i1 %outOfBounds18, label %outOfBounds19, label %indexInRange9
    
outOfBounds19:
    ; ERROR: Index out of bounds error in line 106
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.print_message_40, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange9:
    %indexAddr9 = getelementptr %array_i32, %array_i32* %t11, i32 0, i32 1, i32 9
    store i32 5, i32* %indexAddr9
    ;106 end statement: number[9] = 5;
    ;108 start statement : return 0;
    ret i32 0
    

}

define i32 @Start(%class_TestQS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    %aux01 = alloca i32
    ;113 start statement : {
    ;114 start statement : int aux01
    ;114 end statement: int aux01
    ;115 start statement : maxlen = 0;
    %iAddr = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 1
    store i32 0, i32* %iAddr
    ;115 end statement: maxlen = 0;
    ;116 start statement : aux01 = this.Init(sz);
    %t = load i32, i32* %sz1
    %vtableAddr = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructTestQS*, %vfTableStructTestQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructTestQS, %vfTableStructTestQS* %vtablePointer, i32 0, i32 2
    %procPointer = load i32(%class_TestQS*, i32)*, i32(%class_TestQS*, i32)** %procAddr
    %Init_result = call i32 %procPointer(%class_TestQS* %this, i32 %t)
    store i32 %Init_result, i32* %aux01
    ;116 end statement: aux01 = this.Init(sz);
    ;117 start statement : aux01 = this.Print();
    %vtableAddr1 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTestQS*, %vfTableStructTestQS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTestQS, %vfTableStructTestQS* %vtablePointer1, i32 0, i32 1
    %procPointer1 = load i32(%class_TestQS*)*, i32(%class_TestQS*)** %procAddr1
    %Print_result = call i32 %procPointer1(%class_TestQS* %this)
    store i32 %Print_result, i32* %aux01
    ;117 end statement: aux01 = this.Print();
    ;118 start statement : printInt(9999);
    call void @print(i32 9999)
    ;118 end statement: printInt(9999);
    ;119 start statement : aux01 = (size - 1);
    %iAddr1 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 3
    %t1 = load i32, i32* %iAddr1
    %resSubImpl = sub i32 %t1, 1
    store i32 %resSubImpl, i32* %aux01
    ;119 end statement: aux01 = (size - 1);
    ;120 start statement : aux01 = this.Sort(0, aux01, number);
    %castValue = bitcast %class_TestQS* %this to %class_QS*
    %t2 = load i32, i32* %aux01
    %iAddr2 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 2
    %t3 = load %array_i32*, %array_i32** %iAddr2
    %vtableAddr2 = getelementptr %class_QS, %class_QS* %castValue, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer2, i32 0, i32 0
    %procPointer2 = load i32(%class_QS*, i32, i32, %array_i32*)*, i32(%class_QS*, i32, i32, %array_i32*)** %procAddr2
    %Sort_result = call i32 %procPointer2(%class_QS* %castValue, i32 0, i32 %t2, %array_i32* %t3)
    store i32 %Sort_result, i32* %aux01
    ;120 end statement: aux01 = this.Sort(0, aux01, number);
    ;121 start statement : aux01 = this.Print();
    %vtableAddr3 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTestQS*, %vfTableStructTestQS** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTestQS, %vfTableStructTestQS* %vtablePointer3, i32 0, i32 1
    %procPointer3 = load i32(%class_TestQS*)*, i32(%class_TestQS*)** %procAddr3
    %Print_result1 = call i32 %procPointer3(%class_TestQS* %this)
    store i32 %Print_result1, i32* %aux01
    ;121 end statement: aux01 = this.Print();
    ;122 start statement : printInt(9999);
    call void @print(i32 9999)
    ;122 end statement: printInt(9999);
    ;123 start statement : printInt(maxlen);
    %iAddr3 = getelementptr %class_TestQS, %class_TestQS* %this, i32 0, i32 1
    %t4 = load i32, i32* %iAddr3
    call void @print(i32 %t4)
    ;123 end statement: printInt(maxlen);
    ;124 start statement : return 0;
    ret i32 0
    

}

define %class_TestQS* @newClassTestQS() {
init:
    %sizeOfStruct = add i32 0, 40
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_TestQS*
    %iAddr = getelementptr %class_TestQS, %class_TestQS* %newObject, i32 0, i32 0
    store %vfTableStructTestQS* @vtableGVarTestQS, %vfTableStructTestQS** %iAddr
    ret %class_TestQS* %newObject
    

}

define i32 @main() {
init:
    ;3 start statement : {
    ;4 start statement : printInt(new TestQS().Start(10));
    %NewObjectTestQS = call %class_TestQS* @newClassTestQS()
    %vtableAddr = getelementptr %class_TestQS, %class_TestQS* %NewObjectTestQS, i32 0, i32 0
    %vtablePointer = load %vfTableStructTestQS*, %vfTableStructTestQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructTestQS, %vfTableStructTestQS* %vtablePointer, i32 0, i32 3
    %procPointer = load i32(%class_TestQS*, i32)*, i32(%class_TestQS*, i32)** %procAddr
    %Start_result = call i32 %procPointer(%class_TestQS* %NewObjectTestQS, i32 10)
    call void @print(i32 %Start_result)
    ;4 end statement: printInt(new TestQS().Start(10));
    ;5 start statement : return 0;
    ret i32 0
    

}

define %array_i32* @newArray(i32 %size) {
init:
    %sizeLessThanZero = icmp slt i32 %size, 0
    br i1 %sizeLessThanZero, label %negativeSize, label %goodSize
    
negativeSize:
    ; ERROR: Array Size must be positive
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.print_message_41, i32 0, i32 0))
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
