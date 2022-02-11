@.print_message_1 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 41\0A\00", align 1
@.print_message_2 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 41\0A\00", align 1
@.print_message_3 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 49\0A\00", align 1
@.print_message_4 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 49\0A\00", align 1
@.print_message_5 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 56\0A\00", align 1
@.print_message_6 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 56\0A\00", align 1
@.print_message_7 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 62\0A\00", align 1
@.print_message_8 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 62\0A\00", align 1
@.print_message_9 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 63\0A\00", align 1
@.print_message_10 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 63\0A\00", align 1
@.print_message_11 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 64\0A\00", align 1
@.print_message_12 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 64\0A\00", align 1
@.print_message_13 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 69\0A\00", align 1
@.print_message_14 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 69\0A\00", align 1
@.print_message_15 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 70\0A\00", align 1
@.print_message_16 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 70\0A\00", align 1
@.print_message_17 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 71\0A\00", align 1
@.print_message_18 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 71\0A\00", align 1
@.print_message_19 = private unnamed_addr constant [34 x i8] c"Nullpointer exception in line 85\0A\00", align 1
@.print_message_20 = private unnamed_addr constant [38 x i8] c"Index out of bounds error in line 85\0A\00", align 1
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


%array_i32 = type {
     i32  ; length
    ,[0 x i32]  ; data
}

%class_QS = type {
     %vfTableStructQS*  ; procs_pointer
    ,%array_i32*  ; number
    ,i32  ; size
}

%vfTableStructQS = type {
     i32(%class_QS*, i32)*  ; Start
    ,i32(%class_QS*, i32, i32)*  ; Sort
    ,i32(%class_QS*)*  ; Print
    ,i32(%class_QS*, i32)*  ; Init
}

@vtableGVarQS = global %vfTableStructQS  {
    i32(%class_QS*, i32)* @Start,
    i32(%class_QS*, i32, i32)* @Sort,
    i32(%class_QS*)* @Print,
    i32(%class_QS*, i32)* @Init
}


define i32 @Start(%class_QS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    %aux01 = alloca i32
    ;17 start statement : {
    ;18 start statement : int aux01
    ;18 end statement: int aux01
    ;19 start statement : aux01 = this.Init(sz);
    %t = load i32, i32* %sz1
    %vtableAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer, i32 0, i32 3
    %procPointer = load i32(%class_QS*, i32)*, i32(%class_QS*, i32)** %procAddr
    %Init_result = call i32 %procPointer(%class_QS* %this, i32 %t)
    store i32 %Init_result, i32* %aux01
    ;19 end statement: aux01 = this.Init(sz);
    ;20 start statement : aux01 = this.Print();
    %vtableAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer1, i32 0, i32 2
    %procPointer1 = load i32(%class_QS*)*, i32(%class_QS*)** %procAddr1
    %Print_result = call i32 %procPointer1(%class_QS* %this)
    store i32 %Print_result, i32* %aux01
    ;20 end statement: aux01 = this.Print();
    ;21 start statement : printInt(9999);
    call void @print(i32 9999)
    ;21 end statement: printInt(9999);
    ;22 start statement : aux01 = (size - 1);
    %iAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 2
    %t1 = load i32, i32* %iAddr
    %resSubImpl = sub i32 %t1, 1
    store i32 %resSubImpl, i32* %aux01
    ;22 end statement: aux01 = (size - 1);
    ;23 start statement : aux01 = this.Sort(0, aux01);
    %t2 = load i32, i32* %aux01
    %vtableAddr2 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer2, i32 0, i32 1
    %procPointer2 = load i32(%class_QS*, i32, i32)*, i32(%class_QS*, i32, i32)** %procAddr2
    %Sort_result = call i32 %procPointer2(%class_QS* %this, i32 0, i32 %t2)
    store i32 %Sort_result, i32* %aux01
    ;23 end statement: aux01 = this.Sort(0, aux01);
    ;24 start statement : aux01 = this.Print();
    %vtableAddr3 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer3, i32 0, i32 2
    %procPointer3 = load i32(%class_QS*)*, i32(%class_QS*)** %procAddr3
    %Print_result1 = call i32 %procPointer3(%class_QS* %this)
    store i32 %Print_result1, i32* %aux01
    ;24 end statement: aux01 = this.Print();
    ;25 start statement : return 0;
    ret i32 0
    

}

define i32 @Sort(%class_QS* %this, i32 %left, i32 %right) {
init:
    %left1 = alloca i32
    store i32 %left, i32* %left1
    %right1 = alloca i32
    store i32 %right, i32* %right1
    %v = alloca i32
    %i = alloca i32
    %j = alloca i32
    %nt = alloca i32
    %t = alloca i32
    %cont01 = alloca i1
    %cont02 = alloca i1
    %aux03 = alloca i32
    ;30 start statement : {
    ;31 start statement : int v
    ;31 end statement: int v
    ;32 start statement : int i
    ;32 end statement: int i
    ;33 start statement : int j
    ;33 end statement: int j
    ;34 start statement : int nt
    ;34 end statement: int nt
    ;35 start statement : int t
    ;35 end statement: int t
    ;36 start statement : boolean cont01
    ;36 end statement: boolean cont01
    ;37 start statement : boolean cont02
    ;37 end statement: boolean cont02
    ;38 start statement : int aux03
    ;38 end statement: int aux03
    ;39 start statement : t = 0;
    store i32 0, i32* %t
    ;39 end statement: t = 0;
    ;40 start statement : if ((left < right)) {
    %t1 = load i32, i32* %left1
    %t2 = load i32, i32* %right1
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse3
    
ifTrue:
    ;40 start statement : {
    ;41 start statement : v = number[right];
    %iAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t3 = load %array_i32*, %array_i32** %iAddr
    %isNull = icmp eq %array_i32* %t3, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 41
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_1, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull:
    %t4 = load i32, i32* %right1
    %length_addr = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 0
    %len = load i32, i32* %length_addr
    %smallerZero = icmp slt i32 %t4, 0
    %lenMinusOne = sub i32 %len, 1
    %greaterEqualLen = icmp slt i32 %lenMinusOne, %t4
    %outOfBounds = or i1 %smallerZero, %greaterEqualLen
    br i1 %outOfBounds, label %outOfBounds1, label %indexInRange
    
outOfBounds1:
    ; ERROR: Index out of bounds error in line 41
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_2, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t3, i32 0, i32 1, i32 %t4
    %t5 = load i32, i32* %indexAddr
    store i32 %t5, i32* %v
    ;41 end statement: v = number[right];
    ;42 start statement : i = (left - 1);
    %t6 = load i32, i32* %left1
    %resSubImpl = sub i32 %t6, 1
    store i32 %resSubImpl, i32* %i
    ;42 end statement: i = (left - 1);
    ;43 start statement : j = right;
    %t7 = load i32, i32* %right1
    store i32 %t7, i32* %j
    ;43 end statement: j = right;
    ;44 start statement : cont01 = true;
    store i1 1, i1* %cont01
    ;44 end statement: cont01 = true;
    ;45 start statement : while (cont01) {
    br label %whileStart
    
whileStart:
    %t8 = load i1, i1* %cont01
    br i1 %t8, label %loopBodyStart, label %endloop2
    
loopBodyStart:
    ;45 start statement : {
    ;46 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;46 end statement: cont02 = true;
    ;47 start statement : while (cont02) {
    br label %whileStart1
    
whileStart1:
    %t9 = load i1, i1* %cont02
    br i1 %t9, label %loopBodyStart1, label %endloop
    
loopBodyStart1:
    ;47 start statement : {
    ;48 start statement : i = (i + 1);
    %t10 = load i32, i32* %i
    %resAddImpl = add i32 %t10, 1
    store i32 %resAddImpl, i32* %i
    ;48 end statement: i = (i + 1);
    ;49 start statement : aux03 = number[i];
    %iAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t11 = load %array_i32*, %array_i32** %iAddr1
    %isNull1 = icmp eq %array_i32* %t11, null
    br i1 %isNull1, label %whenIsNull1, label %notNull1
    
whenIsNull1:
    ; ERROR: Nullpointer exception in line 49
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_3, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull1:
    %t12 = load i32, i32* %i
    %length_addr1 = getelementptr %array_i32, %array_i32* %t11, i32 0, i32 0
    %len1 = load i32, i32* %length_addr1
    %smallerZero1 = icmp slt i32 %t12, 0
    %lenMinusOne1 = sub i32 %len1, 1
    %greaterEqualLen1 = icmp slt i32 %lenMinusOne1, %t12
    %outOfBounds2 = or i1 %smallerZero1, %greaterEqualLen1
    br i1 %outOfBounds2, label %outOfBounds3, label %indexInRange1
    
outOfBounds3:
    ; ERROR: Index out of bounds error in line 49
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_4, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange1:
    %indexAddr1 = getelementptr %array_i32, %array_i32* %t11, i32 0, i32 1, i32 %t12
    %t13 = load i32, i32* %indexAddr1
    store i32 %t13, i32* %aux03
    ;49 end statement: aux03 = number[i];
    ;50 start statement : if ((! (aux03 < v))) cont02 = false;
    %t14 = load i32, i32* %aux03
    %t15 = load i32, i32* %v
    %resSltImpl1 = icmp slt i32 %t14, %t15
    %neg_res = icmp eq i1 0, %resSltImpl1
    br i1 %neg_res, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;50 start statement : cont02 = false;
    store i1 0, i1* %cont02
    ;50 end statement: cont02 = false;
    br label %endif
    
ifFalse:
    ;51 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;51 end statement: cont02 = true;
    br label %endif
    
endif:
    ;50 end statement: if ((! (aux03 < v))) cont02 = false;
    ;47 end statement: {
    br label %whileStart1
    
endloop:
    ;47 end statement: while (cont02) {
    ;53 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;53 end statement: cont02 = true;
    ;54 start statement : while (cont02) {
    br label %whileStart2
    
whileStart2:
    %t16 = load i1, i1* %cont02
    br i1 %t16, label %loopBodyStart2, label %endloop1
    
loopBodyStart2:
    ;54 start statement : {
    ;55 start statement : j = (j - 1);
    %t17 = load i32, i32* %j
    %resSubImpl1 = sub i32 %t17, 1
    store i32 %resSubImpl1, i32* %j
    ;55 end statement: j = (j - 1);
    ;56 start statement : aux03 = number[j];
    %iAddr2 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t18 = load %array_i32*, %array_i32** %iAddr2
    %isNull2 = icmp eq %array_i32* %t18, null
    br i1 %isNull2, label %whenIsNull2, label %notNull2
    
whenIsNull2:
    ; ERROR: Nullpointer exception in line 56
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_5, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull2:
    %t19 = load i32, i32* %j
    %length_addr2 = getelementptr %array_i32, %array_i32* %t18, i32 0, i32 0
    %len2 = load i32, i32* %length_addr2
    %smallerZero2 = icmp slt i32 %t19, 0
    %lenMinusOne2 = sub i32 %len2, 1
    %greaterEqualLen2 = icmp slt i32 %lenMinusOne2, %t19
    %outOfBounds4 = or i1 %smallerZero2, %greaterEqualLen2
    br i1 %outOfBounds4, label %outOfBounds5, label %indexInRange2
    
outOfBounds5:
    ; ERROR: Index out of bounds error in line 56
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_6, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange2:
    %indexAddr2 = getelementptr %array_i32, %array_i32* %t18, i32 0, i32 1, i32 %t19
    %t20 = load i32, i32* %indexAddr2
    store i32 %t20, i32* %aux03
    ;56 end statement: aux03 = number[j];
    ;57 start statement : if ((! (v < aux03))) cont02 = false;
    %t21 = load i32, i32* %v
    %t22 = load i32, i32* %aux03
    %resSltImpl2 = icmp slt i32 %t21, %t22
    %neg_res1 = icmp eq i1 0, %resSltImpl2
    br i1 %neg_res1, label %ifTrue2, label %ifFalse1
    
ifTrue2:
    ;57 start statement : cont02 = false;
    store i1 0, i1* %cont02
    ;57 end statement: cont02 = false;
    br label %endif1
    
ifFalse1:
    ;58 start statement : cont02 = true;
    store i1 1, i1* %cont02
    ;58 end statement: cont02 = true;
    br label %endif1
    
endif1:
    ;57 end statement: if ((! (v < aux03))) cont02 = false;
    ;54 end statement: {
    br label %whileStart2
    
endloop1:
    ;54 end statement: while (cont02) {
    ;62 start statement : t = number[i];
    %iAddr3 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t23 = load %array_i32*, %array_i32** %iAddr3
    %isNull3 = icmp eq %array_i32* %t23, null
    br i1 %isNull3, label %whenIsNull3, label %notNull3
    
whenIsNull3:
    ; ERROR: Nullpointer exception in line 62
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_7, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull3:
    %t24 = load i32, i32* %i
    %length_addr3 = getelementptr %array_i32, %array_i32* %t23, i32 0, i32 0
    %len3 = load i32, i32* %length_addr3
    %smallerZero3 = icmp slt i32 %t24, 0
    %lenMinusOne3 = sub i32 %len3, 1
    %greaterEqualLen3 = icmp slt i32 %lenMinusOne3, %t24
    %outOfBounds6 = or i1 %smallerZero3, %greaterEqualLen3
    br i1 %outOfBounds6, label %outOfBounds7, label %indexInRange3
    
outOfBounds7:
    ; ERROR: Index out of bounds error in line 62
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_8, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange3:
    %indexAddr3 = getelementptr %array_i32, %array_i32* %t23, i32 0, i32 1, i32 %t24
    %t25 = load i32, i32* %indexAddr3
    store i32 %t25, i32* %t
    ;62 end statement: t = number[i];
    ;63 start statement : number[i] = number[j];
    %iAddr4 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t26 = load %array_i32*, %array_i32** %iAddr4
    %isNull4 = icmp eq %array_i32* %t26, null
    br i1 %isNull4, label %whenIsNull4, label %notNull4
    
whenIsNull4:
    ; ERROR: Nullpointer exception in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_9, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull4:
    %t27 = load i32, i32* %i
    %length_addr4 = getelementptr %array_i32, %array_i32* %t26, i32 0, i32 0
    %len4 = load i32, i32* %length_addr4
    %smallerZero4 = icmp slt i32 %t27, 0
    %lenMinusOne4 = sub i32 %len4, 1
    %greaterEqualLen4 = icmp slt i32 %lenMinusOne4, %t27
    %outOfBounds8 = or i1 %smallerZero4, %greaterEqualLen4
    br i1 %outOfBounds8, label %outOfBounds9, label %indexInRange4
    
outOfBounds9:
    ; ERROR: Index out of bounds error in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_10, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange4:
    %indexAddr4 = getelementptr %array_i32, %array_i32* %t26, i32 0, i32 1, i32 %t27
    %iAddr5 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t28 = load %array_i32*, %array_i32** %iAddr5
    %isNull5 = icmp eq %array_i32* %t28, null
    br i1 %isNull5, label %whenIsNull5, label %notNull5
    
whenIsNull5:
    ; ERROR: Nullpointer exception in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_9, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull5:
    %t29 = load i32, i32* %j
    %length_addr5 = getelementptr %array_i32, %array_i32* %t28, i32 0, i32 0
    %len5 = load i32, i32* %length_addr5
    %smallerZero5 = icmp slt i32 %t29, 0
    %lenMinusOne5 = sub i32 %len5, 1
    %greaterEqualLen5 = icmp slt i32 %lenMinusOne5, %t29
    %outOfBounds10 = or i1 %smallerZero5, %greaterEqualLen5
    br i1 %outOfBounds10, label %outOfBounds11, label %indexInRange5
    
outOfBounds11:
    ; ERROR: Index out of bounds error in line 63
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_10, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange5:
    %indexAddr5 = getelementptr %array_i32, %array_i32* %t28, i32 0, i32 1, i32 %t29
    %t30 = load i32, i32* %indexAddr5
    store i32 %t30, i32* %indexAddr4
    ;63 end statement: number[i] = number[j];
    ;64 start statement : number[j] = t;
    %iAddr6 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t31 = load %array_i32*, %array_i32** %iAddr6
    %isNull6 = icmp eq %array_i32* %t31, null
    br i1 %isNull6, label %whenIsNull6, label %notNull6
    
whenIsNull6:
    ; ERROR: Nullpointer exception in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_11, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull6:
    %t32 = load i32, i32* %j
    %length_addr6 = getelementptr %array_i32, %array_i32* %t31, i32 0, i32 0
    %len6 = load i32, i32* %length_addr6
    %smallerZero6 = icmp slt i32 %t32, 0
    %lenMinusOne6 = sub i32 %len6, 1
    %greaterEqualLen6 = icmp slt i32 %lenMinusOne6, %t32
    %outOfBounds12 = or i1 %smallerZero6, %greaterEqualLen6
    br i1 %outOfBounds12, label %outOfBounds13, label %indexInRange6
    
outOfBounds13:
    ; ERROR: Index out of bounds error in line 64
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_12, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange6:
    %indexAddr6 = getelementptr %array_i32, %array_i32* %t31, i32 0, i32 1, i32 %t32
    %t33 = load i32, i32* %t
    store i32 %t33, i32* %indexAddr6
    ;64 end statement: number[j] = t;
    ;66 start statement : if ((j < (i + 1))) cont01 = false;
    %t34 = load i32, i32* %j
    %t35 = load i32, i32* %i
    %resAddImpl1 = add i32 %t35, 1
    %resSltImpl3 = icmp slt i32 %t34, %resAddImpl1
    br i1 %resSltImpl3, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;66 start statement : cont01 = false;
    store i1 0, i1* %cont01
    ;66 end statement: cont01 = false;
    br label %endif2
    
ifFalse2:
    ;67 start statement : cont01 = true;
    store i1 1, i1* %cont01
    ;67 end statement: cont01 = true;
    br label %endif2
    
endif2:
    ;66 end statement: if ((j < (i + 1))) cont01 = false;
    ;45 end statement: {
    br label %whileStart
    
endloop2:
    ;45 end statement: while (cont01) {
    ;69 start statement : number[j] = number[i];
    %iAddr7 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t36 = load %array_i32*, %array_i32** %iAddr7
    %isNull7 = icmp eq %array_i32* %t36, null
    br i1 %isNull7, label %whenIsNull7, label %notNull7
    
whenIsNull7:
    ; ERROR: Nullpointer exception in line 69
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_13, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull7:
    %t37 = load i32, i32* %j
    %length_addr7 = getelementptr %array_i32, %array_i32* %t36, i32 0, i32 0
    %len7 = load i32, i32* %length_addr7
    %smallerZero7 = icmp slt i32 %t37, 0
    %lenMinusOne7 = sub i32 %len7, 1
    %greaterEqualLen7 = icmp slt i32 %lenMinusOne7, %t37
    %outOfBounds14 = or i1 %smallerZero7, %greaterEqualLen7
    br i1 %outOfBounds14, label %outOfBounds15, label %indexInRange7
    
outOfBounds15:
    ; ERROR: Index out of bounds error in line 69
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_14, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange7:
    %indexAddr7 = getelementptr %array_i32, %array_i32* %t36, i32 0, i32 1, i32 %t37
    %iAddr8 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t38 = load %array_i32*, %array_i32** %iAddr8
    %isNull8 = icmp eq %array_i32* %t38, null
    br i1 %isNull8, label %whenIsNull8, label %notNull8
    
whenIsNull8:
    ; ERROR: Nullpointer exception in line 69
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_13, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull8:
    %t39 = load i32, i32* %i
    %length_addr8 = getelementptr %array_i32, %array_i32* %t38, i32 0, i32 0
    %len8 = load i32, i32* %length_addr8
    %smallerZero8 = icmp slt i32 %t39, 0
    %lenMinusOne8 = sub i32 %len8, 1
    %greaterEqualLen8 = icmp slt i32 %lenMinusOne8, %t39
    %outOfBounds16 = or i1 %smallerZero8, %greaterEqualLen8
    br i1 %outOfBounds16, label %outOfBounds17, label %indexInRange8
    
outOfBounds17:
    ; ERROR: Index out of bounds error in line 69
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_14, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange8:
    %indexAddr8 = getelementptr %array_i32, %array_i32* %t38, i32 0, i32 1, i32 %t39
    %t40 = load i32, i32* %indexAddr8
    store i32 %t40, i32* %indexAddr7
    ;69 end statement: number[j] = number[i];
    ;70 start statement : number[i] = number[right];
    %iAddr9 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t41 = load %array_i32*, %array_i32** %iAddr9
    %isNull9 = icmp eq %array_i32* %t41, null
    br i1 %isNull9, label %whenIsNull9, label %notNull9
    
whenIsNull9:
    ; ERROR: Nullpointer exception in line 70
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_15, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull9:
    %t42 = load i32, i32* %i
    %length_addr9 = getelementptr %array_i32, %array_i32* %t41, i32 0, i32 0
    %len9 = load i32, i32* %length_addr9
    %smallerZero9 = icmp slt i32 %t42, 0
    %lenMinusOne9 = sub i32 %len9, 1
    %greaterEqualLen9 = icmp slt i32 %lenMinusOne9, %t42
    %outOfBounds18 = or i1 %smallerZero9, %greaterEqualLen9
    br i1 %outOfBounds18, label %outOfBounds19, label %indexInRange9
    
outOfBounds19:
    ; ERROR: Index out of bounds error in line 70
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_16, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange9:
    %indexAddr9 = getelementptr %array_i32, %array_i32* %t41, i32 0, i32 1, i32 %t42
    %iAddr10 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t43 = load %array_i32*, %array_i32** %iAddr10
    %isNull10 = icmp eq %array_i32* %t43, null
    br i1 %isNull10, label %whenIsNull10, label %notNull10
    
whenIsNull10:
    ; ERROR: Nullpointer exception in line 70
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_15, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull10:
    %t44 = load i32, i32* %right1
    %length_addr10 = getelementptr %array_i32, %array_i32* %t43, i32 0, i32 0
    %len10 = load i32, i32* %length_addr10
    %smallerZero10 = icmp slt i32 %t44, 0
    %lenMinusOne10 = sub i32 %len10, 1
    %greaterEqualLen10 = icmp slt i32 %lenMinusOne10, %t44
    %outOfBounds20 = or i1 %smallerZero10, %greaterEqualLen10
    br i1 %outOfBounds20, label %outOfBounds21, label %indexInRange10
    
outOfBounds21:
    ; ERROR: Index out of bounds error in line 70
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_16, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange10:
    %indexAddr10 = getelementptr %array_i32, %array_i32* %t43, i32 0, i32 1, i32 %t44
    %t45 = load i32, i32* %indexAddr10
    store i32 %t45, i32* %indexAddr9
    ;70 end statement: number[i] = number[right];
    ;71 start statement : number[right] = t;
    %iAddr11 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t46 = load %array_i32*, %array_i32** %iAddr11
    %isNull11 = icmp eq %array_i32* %t46, null
    br i1 %isNull11, label %whenIsNull11, label %notNull11
    
whenIsNull11:
    ; ERROR: Nullpointer exception in line 71
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.print_message_17, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
notNull11:
    %t47 = load i32, i32* %right1
    %length_addr11 = getelementptr %array_i32, %array_i32* %t46, i32 0, i32 0
    %len11 = load i32, i32* %length_addr11
    %smallerZero11 = icmp slt i32 %t47, 0
    %lenMinusOne11 = sub i32 %len11, 1
    %greaterEqualLen11 = icmp slt i32 %lenMinusOne11, %t47
    %outOfBounds22 = or i1 %smallerZero11, %greaterEqualLen11
    br i1 %outOfBounds22, label %outOfBounds23, label %indexInRange11
    
outOfBounds23:
    ; ERROR: Index out of bounds error in line 71
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_18, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange11:
    %indexAddr11 = getelementptr %array_i32, %array_i32* %t46, i32 0, i32 1, i32 %t47
    %t48 = load i32, i32* %t
    store i32 %t48, i32* %indexAddr11
    ;71 end statement: number[right] = t;
    ;72 start statement : nt = this.Sort(left, (i - 1));
    %t49 = load i32, i32* %left1
    %t50 = load i32, i32* %i
    %resSubImpl2 = sub i32 %t50, 1
    %vtableAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer, i32 0, i32 1
    %procPointer = load i32(%class_QS*, i32, i32)*, i32(%class_QS*, i32, i32)** %procAddr
    %Sort_result = call i32 %procPointer(%class_QS* %this, i32 %t49, i32 %resSubImpl2)
    store i32 %Sort_result, i32* %nt
    ;72 end statement: nt = this.Sort(left, (i - 1));
    ;73 start statement : nt = this.Sort((i + 1), right);
    %t51 = load i32, i32* %i
    %resAddImpl2 = add i32 %t51, 1
    %t52 = load i32, i32* %right1
    %vtableAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer1, i32 0, i32 1
    %procPointer1 = load i32(%class_QS*, i32, i32)*, i32(%class_QS*, i32, i32)** %procAddr1
    %Sort_result1 = call i32 %procPointer1(%class_QS* %this, i32 %resAddImpl2, i32 %t52)
    store i32 %Sort_result1, i32* %nt
    ;73 end statement: nt = this.Sort((i + 1), right);
    ;40 end statement: {
    br label %endif3
    
ifFalse3:
    ;75 start statement : nt = 0;
    store i32 0, i32* %nt
    ;75 end statement: nt = 0;
    br label %endif3
    
endif3:
    ;40 end statement: if ((left < right)) {
    ;76 start statement : return 0;
    ret i32 0
    

}

define i32 @Print(%class_QS* %this) {
init:
    %j = alloca i32
    ;81 start statement : {
    ;82 start statement : int j
    ;82 end statement: int j
    ;83 start statement : j = 0;
    store i32 0, i32* %j
    ;83 end statement: j = 0;
    ;84 start statement : while ((j < size)) {
    br label %whileStart
    
whileStart:
    %t = load i32, i32* %j
    %iAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 2
    %t1 = load i32, i32* %iAddr
    %resSltImpl = icmp slt i32 %t, %t1
    br i1 %resSltImpl, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;84 start statement : {
    ;85 start statement : printInt(number[j]);
    %iAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t2 = load %array_i32*, %array_i32** %iAddr1
    %isNull = icmp eq %array_i32* %t2, null
    br i1 %isNull, label %whenIsNull, label %notNull
    
whenIsNull:
    ; ERROR: Nullpointer exception in line 85
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
    ; ERROR: Index out of bounds error in line 85
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.print_message_20, i32 0, i32 0))
    call void @exit(i32 222)
    unreachable

    
indexInRange:
    %indexAddr = getelementptr %array_i32, %array_i32* %t2, i32 0, i32 1, i32 %t3
    %t4 = load i32, i32* %indexAddr
    call void @print(i32 %t4)
    ;85 end statement: printInt(number[j]);
    ;86 start statement : j = (j + 1);
    %t5 = load i32, i32* %j
    %resAddImpl = add i32 %t5, 1
    store i32 %resAddImpl, i32* %j
    ;86 end statement: j = (j + 1);
    ;84 end statement: {
    br label %whileStart
    
endloop:
    ;84 end statement: while ((j < size)) {
    ;88 start statement : return 0;
    ret i32 0
    

}

define i32 @Init(%class_QS* %this, i32 %sz) {
init:
    %sz1 = alloca i32
    store i32 %sz, i32* %sz1
    ;93 start statement : {
    ;94 start statement : size = sz;
    %iAddr = getelementptr %class_QS, %class_QS* %this, i32 0, i32 2
    %t = load i32, i32* %sz1
    store i32 %t, i32* %iAddr
    ;94 end statement: size = sz;
    ;95 start statement : number = (new int[sz]);
    %iAddr1 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
    %t1 = load i32, i32* %sz1
    %newArray1 = call %array_i32* @newArray(i32 %t1)
    store %array_i32* %newArray1, %array_i32** %iAddr1
    ;95 end statement: number = (new int[sz]);
    ;97 start statement : number[0] = 20;
    %iAddr2 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr3 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr4 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr5 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr6 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr7 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr8 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr9 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr10 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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
    %iAddr11 = getelementptr %class_QS, %class_QS* %this, i32 0, i32 1
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

define %class_QS* @newClassQS() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_QS*
    %iAddr = getelementptr %class_QS, %class_QS* %newObject, i32 0, i32 0
    store %vfTableStructQS* @vtableGVarQS, %vfTableStructQS** %iAddr
    ret %class_QS* %newObject
    

}

define i32 @main() {
init:
    ;1 start statement : {
    ;2 start statement : printInt(new QS().Start(10));
    %NewObjectQS = call %class_QS* @newClassQS()
    %vtableAddr = getelementptr %class_QS, %class_QS* %NewObjectQS, i32 0, i32 0
    %vtablePointer = load %vfTableStructQS*, %vfTableStructQS** %vtableAddr
    %procAddr = getelementptr %vfTableStructQS, %vfTableStructQS* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_QS*, i32)*, i32(%class_QS*, i32)** %procAddr
    %Start_result = call i32 %procPointer(%class_QS* %NewObjectQS, i32 10)
    call void @print(i32 %Start_result)
    ;2 end statement: printInt(new QS().Start(10));
    ;3 start statement : return 0;
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
