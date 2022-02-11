

%class_BT = type {
     %vfTableStructBT*  ; procs_pointer
}

%vfTableStructBT = type {
     i32(%class_BT*)*  ; Start
}

%class_Tree = type {
     %vfTableStructTree*  ; procs_pointer
    ,%class_Tree*  ; left
    ,%class_Tree*  ; right
    ,i32  ; key
    ,i1  ; has_left
    ,i1  ; has_right
    ,%class_Tree*  ; my_null
}

%vfTableStructTree = type {
     i1(%class_Tree*, i32)*  ; Init
    ,i1(%class_Tree*, %class_Tree*)*  ; SetRight
    ,i1(%class_Tree*, %class_Tree*)*  ; SetLeft
    ,%class_Tree*(%class_Tree*)*  ; GetRight
    ,%class_Tree*(%class_Tree*)*  ; GetLeft
    ,i32(%class_Tree*)*  ; GetKey
    ,i1(%class_Tree*, i32)*  ; SetKey
    ,i1(%class_Tree*)*  ; GetHas_Right
    ,i1(%class_Tree*)*  ; GetHas_Left
    ,i1(%class_Tree*, i1)*  ; SetHas_Left
    ,i1(%class_Tree*, i1)*  ; SetHas_Right
    ,i1(%class_Tree*, i32, i32)*  ; Compare
    ,i1(%class_Tree*, i32)*  ; Insert
    ,i1(%class_Tree*, i32)*  ; Delete
    ,i1(%class_Tree*, %class_Tree*, %class_Tree*)*  ; Remove
    ,i1(%class_Tree*, %class_Tree*, %class_Tree*)*  ; RemoveRight
    ,i1(%class_Tree*, %class_Tree*, %class_Tree*)*  ; RemoveLeft
    ,i32(%class_Tree*, i32)*  ; Search
    ,i1(%class_Tree*)*  ; Print
    ,i1(%class_Tree*, %class_Tree*)*  ; RecPrint
}

@vtableGVarBT = global %vfTableStructBT  {
    i32(%class_BT*)* @Start
}


@vtableGVarTree = global %vfTableStructTree  {
    i1(%class_Tree*, i32)* @Init,
    i1(%class_Tree*, %class_Tree*)* @SetRight,
    i1(%class_Tree*, %class_Tree*)* @SetLeft,
    %class_Tree*(%class_Tree*)* @GetRight,
    %class_Tree*(%class_Tree*)* @GetLeft,
    i32(%class_Tree*)* @GetKey,
    i1(%class_Tree*, i32)* @SetKey,
    i1(%class_Tree*)* @GetHas_Right,
    i1(%class_Tree*)* @GetHas_Left,
    i1(%class_Tree*, i1)* @SetHas_Left,
    i1(%class_Tree*, i1)* @SetHas_Right,
    i1(%class_Tree*, i32, i32)* @Compare,
    i1(%class_Tree*, i32)* @Insert,
    i1(%class_Tree*, i32)* @Delete,
    i1(%class_Tree*, %class_Tree*, %class_Tree*)* @Remove,
    i1(%class_Tree*, %class_Tree*, %class_Tree*)* @RemoveRight,
    i1(%class_Tree*, %class_Tree*, %class_Tree*)* @RemoveLeft,
    i32(%class_Tree*, i32)* @Search,
    i1(%class_Tree*)* @Print,
    i1(%class_Tree*, %class_Tree*)* @RecPrint
}


define i32 @Start(%class_BT* %this) {
init:
    %root = alloca %class_Tree*
    %ntb = alloca i1
    %nti = alloca i32
    ;11 start statement : {
    ;12 start statement : Tree root
    ;12 end statement: Tree root
    ;13 start statement : boolean ntb
    ;13 end statement: boolean ntb
    ;14 start statement : int nti
    ;14 end statement: int nti
    ;16 start statement : root = new Tree();
    %NewObjectTree = call %class_Tree* @newClassTree()
    store %class_Tree* %NewObjectTree, %class_Tree** %root
    ;16 end statement: root = new Tree();
    ;17 start statement : ntb = root.Init(16);
    %t = load %class_Tree*, %class_Tree** %root
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 0
    %procPointer = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr
    %Init_result = call i1 %procPointer(%class_Tree* %t, i32 16)
    store i1 %Init_result, i1* %ntb
    ;17 end statement: ntb = root.Init(16);
    ;18 start statement : ntb = root.Print();
    %t1 = load %class_Tree*, %class_Tree** %root
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 18
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %Print_result = call i1 %procPointer1(%class_Tree* %t1)
    store i1 %Print_result, i1* %ntb
    ;18 end statement: ntb = root.Print();
    ;19 start statement : printInt(100000000);
    call void @print(i32 100000000)
    ;19 end statement: printInt(100000000);
    ;20 start statement : ntb = root.Insert(8);
    %t2 = load %class_Tree*, %class_Tree** %root
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 12
    %procPointer2 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr2
    %Insert_result = call i1 %procPointer2(%class_Tree* %t2, i32 8)
    store i1 %Insert_result, i1* %ntb
    ;20 end statement: ntb = root.Insert(8);
    ;21 start statement : ntb = root.Print();
    %t3 = load %class_Tree*, %class_Tree** %root
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 18
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %Print_result1 = call i1 %procPointer3(%class_Tree* %t3)
    store i1 %Print_result1, i1* %ntb
    ;21 end statement: ntb = root.Print();
    ;22 start statement : ntb = root.Insert(24);
    %t4 = load %class_Tree*, %class_Tree** %root
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 12
    %procPointer4 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr4
    %Insert_result1 = call i1 %procPointer4(%class_Tree* %t4, i32 24)
    store i1 %Insert_result1, i1* %ntb
    ;22 end statement: ntb = root.Insert(24);
    ;23 start statement : ntb = root.Insert(4);
    %t5 = load %class_Tree*, %class_Tree** %root
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 12
    %procPointer5 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr5
    %Insert_result2 = call i1 %procPointer5(%class_Tree* %t5, i32 4)
    store i1 %Insert_result2, i1* %ntb
    ;23 end statement: ntb = root.Insert(4);
    ;24 start statement : ntb = root.Insert(12);
    %t6 = load %class_Tree*, %class_Tree** %root
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 12
    %procPointer6 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr6
    %Insert_result3 = call i1 %procPointer6(%class_Tree* %t6, i32 12)
    store i1 %Insert_result3, i1* %ntb
    ;24 end statement: ntb = root.Insert(12);
    ;25 start statement : ntb = root.Insert(20);
    %t7 = load %class_Tree*, %class_Tree** %root
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 12
    %procPointer7 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr7
    %Insert_result4 = call i1 %procPointer7(%class_Tree* %t7, i32 20)
    store i1 %Insert_result4, i1* %ntb
    ;25 end statement: ntb = root.Insert(20);
    ;26 start statement : ntb = root.Insert(28);
    %t8 = load %class_Tree*, %class_Tree** %root
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 12
    %procPointer8 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr8
    %Insert_result5 = call i1 %procPointer8(%class_Tree* %t8, i32 28)
    store i1 %Insert_result5, i1* %ntb
    ;26 end statement: ntb = root.Insert(28);
    ;27 start statement : ntb = root.Insert(14);
    %t9 = load %class_Tree*, %class_Tree** %root
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 12
    %procPointer9 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr9
    %Insert_result6 = call i1 %procPointer9(%class_Tree* %t9, i32 14)
    store i1 %Insert_result6, i1* %ntb
    ;27 end statement: ntb = root.Insert(14);
    ;28 start statement : ntb = root.Print();
    %t10 = load %class_Tree*, %class_Tree** %root
    %vtableAddr10 = getelementptr %class_Tree, %class_Tree* %t10, i32 0, i32 0
    %vtablePointer10 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr10
    %procAddr10 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer10, i32 0, i32 18
    %procPointer10 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr10
    %Print_result2 = call i1 %procPointer10(%class_Tree* %t10)
    store i1 %Print_result2, i1* %ntb
    ;28 end statement: ntb = root.Print();
    ;29 start statement : printInt(root.Search(24));
    %t11 = load %class_Tree*, %class_Tree** %root
    %vtableAddr11 = getelementptr %class_Tree, %class_Tree* %t11, i32 0, i32 0
    %vtablePointer11 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr11
    %procAddr11 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer11, i32 0, i32 17
    %procPointer11 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr11
    %Search_result = call i32 %procPointer11(%class_Tree* %t11, i32 24)
    call void @print(i32 %Search_result)
    ;29 end statement: printInt(root.Search(24));
    ;30 start statement : printInt(root.Search(12));
    %t12 = load %class_Tree*, %class_Tree** %root
    %vtableAddr12 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer12 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr12
    %procAddr12 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer12, i32 0, i32 17
    %procPointer12 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr12
    %Search_result1 = call i32 %procPointer12(%class_Tree* %t12, i32 12)
    call void @print(i32 %Search_result1)
    ;30 end statement: printInt(root.Search(12));
    ;31 start statement : printInt(root.Search(16));
    %t13 = load %class_Tree*, %class_Tree** %root
    %vtableAddr13 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer13 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr13
    %procAddr13 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer13, i32 0, i32 17
    %procPointer13 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr13
    %Search_result2 = call i32 %procPointer13(%class_Tree* %t13, i32 16)
    call void @print(i32 %Search_result2)
    ;31 end statement: printInt(root.Search(16));
    ;32 start statement : printInt(root.Search(50));
    %t14 = load %class_Tree*, %class_Tree** %root
    %vtableAddr14 = getelementptr %class_Tree, %class_Tree* %t14, i32 0, i32 0
    %vtablePointer14 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr14
    %procAddr14 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer14, i32 0, i32 17
    %procPointer14 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr14
    %Search_result3 = call i32 %procPointer14(%class_Tree* %t14, i32 50)
    call void @print(i32 %Search_result3)
    ;32 end statement: printInt(root.Search(50));
    ;33 start statement : printInt(root.Search(12));
    %t15 = load %class_Tree*, %class_Tree** %root
    %vtableAddr15 = getelementptr %class_Tree, %class_Tree* %t15, i32 0, i32 0
    %vtablePointer15 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr15
    %procAddr15 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer15, i32 0, i32 17
    %procPointer15 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr15
    %Search_result4 = call i32 %procPointer15(%class_Tree* %t15, i32 12)
    call void @print(i32 %Search_result4)
    ;33 end statement: printInt(root.Search(12));
    ;34 start statement : ntb = root.Delete(12);
    %t16 = load %class_Tree*, %class_Tree** %root
    %vtableAddr16 = getelementptr %class_Tree, %class_Tree* %t16, i32 0, i32 0
    %vtablePointer16 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr16
    %procAddr16 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer16, i32 0, i32 13
    %procPointer16 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr16
    %Delete_result = call i1 %procPointer16(%class_Tree* %t16, i32 12)
    store i1 %Delete_result, i1* %ntb
    ;34 end statement: ntb = root.Delete(12);
    ;35 start statement : ntb = root.Print();
    %t17 = load %class_Tree*, %class_Tree** %root
    %vtableAddr17 = getelementptr %class_Tree, %class_Tree* %t17, i32 0, i32 0
    %vtablePointer17 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr17
    %procAddr17 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer17, i32 0, i32 18
    %procPointer17 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr17
    %Print_result3 = call i1 %procPointer17(%class_Tree* %t17)
    store i1 %Print_result3, i1* %ntb
    ;35 end statement: ntb = root.Print();
    ;36 start statement : printInt(root.Search(12));
    %t18 = load %class_Tree*, %class_Tree** %root
    %vtableAddr18 = getelementptr %class_Tree, %class_Tree* %t18, i32 0, i32 0
    %vtablePointer18 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr18
    %procAddr18 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer18, i32 0, i32 17
    %procPointer18 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr18
    %Search_result5 = call i32 %procPointer18(%class_Tree* %t18, i32 12)
    call void @print(i32 %Search_result5)
    ;36 end statement: printInt(root.Search(12));
    ;38 start statement : return 0;
    ret i32 0
    

}

define %class_BT* @newClassBT() {
init:
    %sizeOfStruct = add i32 0, 8
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_BT*
    %iAddr = getelementptr %class_BT, %class_BT* %newObject, i32 0, i32 0
    store %vfTableStructBT* @vtableGVarBT, %vfTableStructBT** %iAddr
    ret %class_BT* %newObject
    

}

define i1 @Init(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;52 start statement : {
    ;53 start statement : key = v_key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %iAddr
    ;53 end statement: key = v_key;
    ;54 start statement : has_left = false;
    %iAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    store i1 0, i1* %iAddr1
    ;54 end statement: has_left = false;
    ;55 start statement : has_right = false;
    %iAddr2 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    store i1 0, i1* %iAddr2
    ;55 end statement: has_right = false;
    ;56 start statement : return true;
    ret i1 1
    

}

define i1 @SetRight(%class_Tree* %this, %class_Tree* %rn) {
init:
    %rn1 = alloca %class_Tree*
    store %class_Tree* %rn, %class_Tree** %rn1
    ;60 start statement : {
    ;61 start statement : right = rn;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 2
    %t = load %class_Tree*, %class_Tree** %rn1
    store %class_Tree* %t, %class_Tree** %iAddr
    ;61 end statement: right = rn;
    ;62 start statement : return true;
    ret i1 1
    

}

define i1 @SetLeft(%class_Tree* %this, %class_Tree* %ln) {
init:
    %ln1 = alloca %class_Tree*
    store %class_Tree* %ln, %class_Tree** %ln1
    ;66 start statement : {
    ;67 start statement : left = ln;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 1
    %t = load %class_Tree*, %class_Tree** %ln1
    store %class_Tree* %t, %class_Tree** %iAddr
    ;67 end statement: left = ln;
    ;68 start statement : return true;
    ret i1 1
    

}

define %class_Tree* @GetRight(%class_Tree* %this) {
init:
    ;71 start statement : {
    ;72 start statement : return right;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 2
    %t = load %class_Tree*, %class_Tree** %iAddr
    ret %class_Tree* %t
    

}

define %class_Tree* @GetLeft(%class_Tree* %this) {
init:
    ;75 start statement : {
    ;76 start statement : return left;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 1
    %t = load %class_Tree*, %class_Tree** %iAddr
    ret %class_Tree* %t
    

}

define i32 @GetKey(%class_Tree* %this) {
init:
    ;79 start statement : {
    ;80 start statement : return key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %iAddr
    ret i32 %t
    

}

define i1 @SetKey(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;83 start statement : {
    ;84 start statement : key = v_key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %iAddr
    ;84 end statement: key = v_key;
    ;85 start statement : return true;
    ret i1 1
    

}

define i1 @GetHas_Right(%class_Tree* %this) {
init:
    ;88 start statement : {
    ;89 start statement : return has_right;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    %t = load i1, i1* %iAddr
    ret i1 %t
    

}

define i1 @GetHas_Left(%class_Tree* %this) {
init:
    ;92 start statement : {
    ;93 start statement : return has_left;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    %t = load i1, i1* %iAddr
    ret i1 %t
    

}

define i1 @SetHas_Left(%class_Tree* %this, i1 %val) {
init:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;96 start statement : {
    ;97 start statement : has_left = val;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    %t = load i1, i1* %val1
    store i1 %t, i1* %iAddr
    ;97 end statement: has_left = val;
    ;98 start statement : return true;
    ret i1 1
    

}

define i1 @SetHas_Right(%class_Tree* %this, i1 %val) {
init:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;101 start statement : {
    ;102 start statement : has_right = val;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    %t = load i1, i1* %val1
    store i1 %t, i1* %iAddr
    ;102 end statement: has_right = val;
    ;103 start statement : return true;
    ret i1 1
    

}

define i1 @Compare(%class_Tree* %this, i32 %num1, i32 %num2) {
init:
    %num11 = alloca i32
    store i32 %num1, i32* %num11
    %num21 = alloca i32
    store i32 %num2, i32* %num21
    %ntb = alloca i1
    %nti = alloca i32
    ;109 start statement : {
    ;110 start statement : boolean ntb
    ;110 end statement: boolean ntb
    ;111 start statement : int nti
    ;111 end statement: int nti
    ;113 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;113 end statement: ntb = false;
    ;114 start statement : nti = (num2 + 1);
    %t = load i32, i32* %num21
    %resAddImpl = add i32 %t, 1
    store i32 %resAddImpl, i32* %nti
    ;114 end statement: nti = (num2 + 1);
    ;115 start statement : if ((num1 < num2)) ntb = false;
    %t1 = load i32, i32* %num11
    %t2 = load i32, i32* %num21
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;115 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;115 end statement: ntb = false;
    br label %endif1
    
ifFalse:
    ;116 start statement : if ((! (num1 < nti))) ntb = false;
    %t3 = load i32, i32* %num11
    %t4 = load i32, i32* %nti
    %resSltImpl1 = icmp slt i32 %t3, %t4
    %neg_res = icmp eq i1 0, %resSltImpl1
    br i1 %neg_res, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;116 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;116 end statement: ntb = false;
    br label %endif
    
ifFalse1:
    ;117 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;117 end statement: ntb = true;
    br label %endif
    
endif:
    ;116 end statement: if ((! (num1 < nti))) ntb = false;
    br label %endif1
    
endif1:
    ;115 end statement: if ((num1 < num2)) ntb = false;
    ;118 start statement : return ntb;
    %t5 = load i1, i1* %ntb
    ret i1 %t5
    

}

define i1 @Insert(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %new_node = alloca %class_Tree*
    %ntb = alloca i1
    %cont = alloca i1
    %key_aux = alloca i32
    %current_node = alloca %class_Tree*
    ;123 start statement : {
    ;124 start statement : Tree new_node
    ;124 end statement: Tree new_node
    ;125 start statement : boolean ntb
    ;125 end statement: boolean ntb
    ;126 start statement : boolean cont
    ;126 end statement: boolean cont
    ;127 start statement : int key_aux
    ;127 end statement: int key_aux
    ;128 start statement : Tree current_node
    ;128 end statement: Tree current_node
    ;130 start statement : new_node = new Tree();
    %NewObjectTree = call %class_Tree* @newClassTree()
    store %class_Tree* %NewObjectTree, %class_Tree** %new_node
    ;130 end statement: new_node = new Tree();
    ;131 start statement : ntb = new_node.Init(v_key);
    %t = load %class_Tree*, %class_Tree** %new_node
    %t1 = load i32, i32* %v_key1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 0
    %procPointer = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr
    %Init_result = call i1 %procPointer(%class_Tree* %t, i32 %t1)
    store i1 %Init_result, i1* %ntb
    ;131 end statement: ntb = new_node.Init(v_key);
    ;132 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;132 end statement: current_node = this;
    ;133 start statement : cont = true;
    store i1 1, i1* %cont
    ;133 end statement: cont = true;
    ;134 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t2 = load i1, i1* %cont
    br i1 %t2, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;134 start statement : {
    ;135 start statement : key_aux = current_node.GetKey();
    %t3 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 5
    %procPointer1 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr1
    %GetKey_result = call i32 %procPointer1(%class_Tree* %t3)
    store i32 %GetKey_result, i32* %key_aux
    ;135 end statement: key_aux = current_node.GetKey();
    ;136 start statement : if ((v_key < key_aux)) {
    %t4 = load i32, i32* %v_key1
    %t5 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t4, %t5
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;136 start statement : {
    ;137 start statement : if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t6 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 8
    %procPointer2 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr2
    %GetHas_Left_result = call i1 %procPointer2(%class_Tree* %t6)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;138 start statement : current_node = current_node.GetLeft();
    %t7 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 4
    %procPointer3 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr3
    %GetLeft_result = call %class_Tree* %procPointer3(%class_Tree* %t7)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;138 end statement: current_node = current_node.GetLeft();
    br label %endif
    
ifFalse:
    ;137 start statement : {
    ;140 start statement : cont = false;
    store i1 0, i1* %cont
    ;140 end statement: cont = false;
    ;141 start statement : ntb = current_node.SetHas_Left(true);
    %t8 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 9
    %procPointer4 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr4
    %SetHas_Left_result = call i1 %procPointer4(%class_Tree* %t8, i1 1)
    store i1 %SetHas_Left_result, i1* %ntb
    ;141 end statement: ntb = current_node.SetHas_Left(true);
    ;142 start statement : ntb = current_node.SetLeft(new_node);
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %t10 = load %class_Tree*, %class_Tree** %new_node
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 2
    %procPointer5 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr5
    %SetLeft_result = call i1 %procPointer5(%class_Tree* %t9, %class_Tree* %t10)
    store i1 %SetLeft_result, i1* %ntb
    ;142 end statement: ntb = current_node.SetLeft(new_node);
    ;137 end statement: {
    br label %endif
    
endif:
    ;137 end statement: if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    ;136 end statement: {
    br label %endif2
    
ifFalse1:
    ;136 start statement : {
    ;146 start statement : if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t11 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t11, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 7
    %procPointer6 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr6
    %GetHas_Right_result = call i1 %procPointer6(%class_Tree* %t11)
    br i1 %GetHas_Right_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;147 start statement : current_node = current_node.GetRight();
    %t12 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 3
    %procPointer7 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr7
    %GetRight_result = call %class_Tree* %procPointer7(%class_Tree* %t12)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;147 end statement: current_node = current_node.GetRight();
    br label %endif1
    
ifFalse2:
    ;146 start statement : {
    ;149 start statement : cont = false;
    store i1 0, i1* %cont
    ;149 end statement: cont = false;
    ;150 start statement : ntb = current_node.SetHas_Right(true);
    %t13 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 10
    %procPointer8 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr8
    %SetHas_Right_result = call i1 %procPointer8(%class_Tree* %t13, i1 1)
    store i1 %SetHas_Right_result, i1* %ntb
    ;150 end statement: ntb = current_node.SetHas_Right(true);
    ;151 start statement : ntb = current_node.SetRight(new_node);
    %t14 = load %class_Tree*, %class_Tree** %current_node
    %t15 = load %class_Tree*, %class_Tree** %new_node
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t14, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 1
    %procPointer9 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr9
    %SetRight_result = call i1 %procPointer9(%class_Tree* %t14, %class_Tree* %t15)
    store i1 %SetRight_result, i1* %ntb
    ;151 end statement: ntb = current_node.SetRight(new_node);
    ;146 end statement: {
    br label %endif1
    
endif1:
    ;146 end statement: if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    ;136 end statement: {
    br label %endif2
    
endif2:
    ;136 end statement: if ((v_key < key_aux)) {
    ;134 end statement: {
    br label %whileStart
    
endloop:
    ;134 end statement: while (cont) {
    ;155 start statement : return true;
    ret i1 1
    

}

define i1 @Delete(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %current_node = alloca %class_Tree*
    %parent_node = alloca %class_Tree*
    %cont = alloca i1
    %found = alloca i1
    %is_root = alloca i1
    %key_aux = alloca i32
    %ntb = alloca i1
    ;160 start statement : {
    ;161 start statement : Tree current_node
    ;161 end statement: Tree current_node
    ;162 start statement : Tree parent_node
    ;162 end statement: Tree parent_node
    ;163 start statement : boolean cont
    ;163 end statement: boolean cont
    ;164 start statement : boolean found
    ;164 end statement: boolean found
    ;165 start statement : boolean is_root
    ;165 end statement: boolean is_root
    ;166 start statement : int key_aux
    ;166 end statement: int key_aux
    ;167 start statement : boolean ntb
    ;167 end statement: boolean ntb
    ;169 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;169 end statement: current_node = this;
    ;170 start statement : parent_node = this;
    store %class_Tree* %this, %class_Tree** %parent_node
    ;170 end statement: parent_node = this;
    ;171 start statement : cont = true;
    store i1 1, i1* %cont
    ;171 end statement: cont = true;
    ;172 start statement : found = false;
    store i1 0, i1* %found
    ;172 end statement: found = false;
    ;173 start statement : is_root = true;
    store i1 1, i1* %is_root
    ;173 end statement: is_root = true;
    ;174 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;174 start statement : {
    ;175 start statement : key_aux = current_node.GetKey();
    %t1 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 5
    %procPointer = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr
    %GetKey_result = call i32 %procPointer(%class_Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;175 end statement: key_aux = current_node.GetKey();
    ;176 start statement : if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;177 start statement : if (current_node.GetHas_Left()) {
    %t4 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 8
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %GetHas_Left_result = call i1 %procPointer1(%class_Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;177 start statement : {
    ;178 start statement : parent_node = current_node;
    %t5 = load %class_Tree*, %class_Tree** %current_node
    store %class_Tree* %t5, %class_Tree** %parent_node
    ;178 end statement: parent_node = current_node;
    ;179 start statement : current_node = current_node.GetLeft();
    %t6 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 4
    %procPointer2 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr2
    %GetLeft_result = call %class_Tree* %procPointer2(%class_Tree* %t6)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;179 end statement: current_node = current_node.GetLeft();
    ;177 end statement: {
    br label %endif
    
ifFalse:
    ;181 start statement : cont = false;
    store i1 0, i1* %cont
    ;181 end statement: cont = false;
    br label %endif
    
endif:
    ;177 end statement: if (current_node.GetHas_Left()) {
    br label %endif5
    
ifFalse1:
    ;183 start statement : if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    %t7 = load i32, i32* %key_aux
    %t8 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t7, %t8
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;184 start statement : if (current_node.GetHas_Right()) {
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 7
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %GetHas_Right_result = call i1 %procPointer3(%class_Tree* %t9)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;184 start statement : {
    ;185 start statement : parent_node = current_node;
    %t10 = load %class_Tree*, %class_Tree** %current_node
    store %class_Tree* %t10, %class_Tree** %parent_node
    ;185 end statement: parent_node = current_node;
    ;186 start statement : current_node = current_node.GetRight();
    %t11 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t11, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 3
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetRight_result = call %class_Tree* %procPointer4(%class_Tree* %t11)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;186 end statement: current_node = current_node.GetRight();
    ;184 end statement: {
    br label %endif1
    
ifFalse2:
    ;188 start statement : cont = false;
    store i1 0, i1* %cont
    ;188 end statement: cont = false;
    br label %endif1
    
endif1:
    ;184 end statement: if (current_node.GetHas_Right()) {
    br label %endif4
    
ifFalse3:
    ;183 start statement : {
    ;190 start statement : if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    %t12 = load i1, i1* %is_root
    br i1 %t12, label %ifTrue4, label %ifFalse5
    
ifTrue4:
    ;191 start statement : if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    %t13 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 7
    %procPointer5 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr5
    %GetHas_Right_result1 = call i1 %procPointer5(%class_Tree* %t13)
    %neg_res = icmp eq i1 0, %GetHas_Right_result1
    %andResVar = alloca i1
    store i1 %neg_res, i1* %andResVar
    br i1 %neg_res, label %and_first_true, label %and_end
    
and_first_true:
    %t14 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t14, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 8
    %procPointer6 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr6
    %GetHas_Left_result1 = call i1 %procPointer6(%class_Tree* %t14)
    %neg_res1 = icmp eq i1 0, %GetHas_Left_result1
    store i1 %neg_res1, i1* %andResVar
    br label %and_end
    
and_end:
    %andRes = load i1, i1* %andResVar
    br i1 %andRes, label %ifTrue5, label %ifFalse4
    
ifTrue5:
    ;193 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;193 end statement: ntb = true;
    br label %endif2
    
ifFalse4:
    ;195 start statement : ntb = this.Remove(parent_node, current_node);
    %t15 = load %class_Tree*, %class_Tree** %parent_node
    %t16 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 14
    %procPointer7 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr7
    %Remove_result = call i1 %procPointer7(%class_Tree* %this, %class_Tree* %t15, %class_Tree* %t16)
    store i1 %Remove_result, i1* %ntb
    ;195 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif2
    
endif2:
    ;191 end statement: if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    br label %endif3
    
ifFalse5:
    ;196 start statement : ntb = this.Remove(parent_node, current_node);
    %t17 = load %class_Tree*, %class_Tree** %parent_node
    %t18 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 14
    %procPointer8 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr8
    %Remove_result1 = call i1 %procPointer8(%class_Tree* %this, %class_Tree* %t17, %class_Tree* %t18)
    store i1 %Remove_result1, i1* %ntb
    ;196 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif3
    
endif3:
    ;190 end statement: if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    ;197 start statement : found = true;
    store i1 1, i1* %found
    ;197 end statement: found = true;
    ;198 start statement : cont = false;
    store i1 0, i1* %cont
    ;198 end statement: cont = false;
    ;183 end statement: {
    br label %endif4
    
endif4:
    ;183 end statement: if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    br label %endif5
    
endif5:
    ;176 end statement: if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    ;200 start statement : is_root = false;
    store i1 0, i1* %is_root
    ;200 end statement: is_root = false;
    ;174 end statement: {
    br label %whileStart
    
endloop:
    ;174 end statement: while (cont) {
    ;202 start statement : return found;
    %t19 = load i1, i1* %found
    ret i1 %t19
    

}

define i1 @Remove(%class_Tree* %this, %class_Tree* %p_node, %class_Tree* %c_node) {
init:
    %p_node1 = alloca %class_Tree*
    store %class_Tree* %p_node, %class_Tree** %p_node1
    %c_node1 = alloca %class_Tree*
    store %class_Tree* %c_node, %class_Tree** %c_node1
    %ntb = alloca i1
    %auxkey1 = alloca i32
    %auxkey2 = alloca i32
    ;208 start statement : {
    ;209 start statement : boolean ntb
    ;209 end statement: boolean ntb
    ;210 start statement : int auxkey1
    ;210 end statement: int auxkey1
    ;211 start statement : int auxkey2
    ;211 end statement: int auxkey2
    ;213 start statement : if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    %t = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 8
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Left_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;214 start statement : ntb = this.RemoveLeft(p_node, c_node);
    %t1 = load %class_Tree*, %class_Tree** %p_node1
    %t2 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 16
    %procPointer1 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr1
    %RemoveLeft_result = call i1 %procPointer1(%class_Tree* %this, %class_Tree* %t1, %class_Tree* %t2)
    store i1 %RemoveLeft_result, i1* %ntb
    ;214 end statement: ntb = this.RemoveLeft(p_node, c_node);
    br label %endif2
    
ifFalse:
    ;216 start statement : if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    %t3 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 7
    %procPointer2 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr2
    %GetHas_Right_result = call i1 %procPointer2(%class_Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;217 start statement : ntb = this.RemoveRight(p_node, c_node);
    %t4 = load %class_Tree*, %class_Tree** %p_node1
    %t5 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 15
    %procPointer3 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr3
    %RemoveRight_result = call i1 %procPointer3(%class_Tree* %this, %class_Tree* %t4, %class_Tree* %t5)
    store i1 %RemoveRight_result, i1* %ntb
    ;217 end statement: ntb = this.RemoveRight(p_node, c_node);
    br label %endif1
    
ifFalse1:
    ;216 start statement : {
    ;219 start statement : auxkey1 = c_node.GetKey();
    %t6 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 5
    %procPointer4 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr4
    %GetKey_result = call i32 %procPointer4(%class_Tree* %t6)
    store i32 %GetKey_result, i32* %auxkey1
    ;219 end statement: auxkey1 = c_node.GetKey();
    ;222 start statement : auxkey2 = p_node.GetLeft().GetKey();
    %t7 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 4
    %procPointer5 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr5
    %GetLeft_result = call %class_Tree* %procPointer5(%class_Tree* %t7)
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %GetLeft_result, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 5
    %procPointer6 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr6
    %GetKey_result1 = call i32 %procPointer6(%class_Tree* %GetLeft_result)
    store i32 %GetKey_result1, i32* %auxkey2
    ;222 end statement: auxkey2 = p_node.GetLeft().GetKey();
    ;223 start statement : if (this.Compare(auxkey1, auxkey2)) {
    %t8 = load i32, i32* %auxkey1
    %t9 = load i32, i32* %auxkey2
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 11
    %procPointer7 = load i1(%class_Tree*, i32, i32)*, i1(%class_Tree*, i32, i32)** %procAddr7
    %Compare_result = call i1 %procPointer7(%class_Tree* %this, i32 %t8, i32 %t9)
    br i1 %Compare_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;223 start statement : {
    ;224 start statement : ntb = p_node.SetLeft(my_null);
    %t10 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t11 = load %class_Tree*, %class_Tree** %iAddr
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t10, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 2
    %procPointer8 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr8
    %SetLeft_result = call i1 %procPointer8(%class_Tree* %t10, %class_Tree* %t11)
    store i1 %SetLeft_result, i1* %ntb
    ;224 end statement: ntb = p_node.SetLeft(my_null);
    ;225 start statement : ntb = p_node.SetHas_Left(false);
    %t12 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 9
    %procPointer9 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr9
    %SetHas_Left_result = call i1 %procPointer9(%class_Tree* %t12, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;225 end statement: ntb = p_node.SetHas_Left(false);
    ;223 end statement: {
    br label %endif
    
ifFalse2:
    ;223 start statement : {
    ;228 start statement : ntb = p_node.SetRight(my_null);
    %t13 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t14 = load %class_Tree*, %class_Tree** %iAddr1
    %vtableAddr10 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer10 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr10
    %procAddr10 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer10, i32 0, i32 1
    %procPointer10 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr10
    %SetRight_result = call i1 %procPointer10(%class_Tree* %t13, %class_Tree* %t14)
    store i1 %SetRight_result, i1* %ntb
    ;228 end statement: ntb = p_node.SetRight(my_null);
    ;229 start statement : ntb = p_node.SetHas_Right(false);
    %t15 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr11 = getelementptr %class_Tree, %class_Tree* %t15, i32 0, i32 0
    %vtablePointer11 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr11
    %procAddr11 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer11, i32 0, i32 10
    %procPointer11 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr11
    %SetHas_Right_result = call i1 %procPointer11(%class_Tree* %t15, i1 0)
    store i1 %SetHas_Right_result, i1* %ntb
    ;229 end statement: ntb = p_node.SetHas_Right(false);
    ;223 end statement: {
    br label %endif
    
endif:
    ;223 end statement: if (this.Compare(auxkey1, auxkey2)) {
    ;216 end statement: {
    br label %endif1
    
endif1:
    ;216 end statement: if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    br label %endif2
    
endif2:
    ;213 end statement: if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    ;232 start statement : return true;
    ret i1 1
    

}

define i1 @RemoveRight(%class_Tree* %this, %class_Tree* %p_node, %class_Tree* %c_node) {
init:
    %p_node1 = alloca %class_Tree*
    store %class_Tree* %p_node, %class_Tree** %p_node1
    %c_node1 = alloca %class_Tree*
    store %class_Tree* %c_node, %class_Tree** %c_node1
    %ntb = alloca i1
    ;239 start statement : {
    ;240 start statement : boolean ntb
    ;240 end statement: boolean ntb
    ;242 start statement : while (c_node.GetHas_Right()) {
    br label %whileStart
    
whileStart:
    %t = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 7
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Right_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Right_result, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;242 start statement : {
    ;246 start statement : ntb = c_node.SetKey(c_node.GetRight().GetKey());
    %t1 = load %class_Tree*, %class_Tree** %c_node1
    %t2 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 3
    %procPointer1 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr1
    %GetRight_result = call %class_Tree* %procPointer1(%class_Tree* %t2)
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %GetRight_result, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 5
    %procPointer2 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr2
    %GetKey_result = call i32 %procPointer2(%class_Tree* %GetRight_result)
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 6
    %procPointer3 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr3
    %SetKey_result = call i1 %procPointer3(%class_Tree* %t1, i32 %GetKey_result)
    store i1 %SetKey_result, i1* %ntb
    ;246 end statement: ntb = c_node.SetKey(c_node.GetRight().GetKey());
    ;247 start statement : p_node = c_node;
    %t3 = load %class_Tree*, %class_Tree** %c_node1
    store %class_Tree* %t3, %class_Tree** %p_node1
    ;247 end statement: p_node = c_node;
    ;248 start statement : c_node = c_node.GetRight();
    %t4 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 3
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetRight_result1 = call %class_Tree* %procPointer4(%class_Tree* %t4)
    store %class_Tree* %GetRight_result1, %class_Tree** %c_node1
    ;248 end statement: c_node = c_node.GetRight();
    ;242 end statement: {
    br label %whileStart
    
endloop:
    ;242 end statement: while (c_node.GetHas_Right()) {
    ;250 start statement : ntb = p_node.SetRight(my_null);
    %t5 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t6 = load %class_Tree*, %class_Tree** %iAddr
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 1
    %procPointer5 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr5
    %SetRight_result = call i1 %procPointer5(%class_Tree* %t5, %class_Tree* %t6)
    store i1 %SetRight_result, i1* %ntb
    ;250 end statement: ntb = p_node.SetRight(my_null);
    ;251 start statement : ntb = p_node.SetHas_Right(false);
    %t7 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 10
    %procPointer6 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr6
    %SetHas_Right_result = call i1 %procPointer6(%class_Tree* %t7, i1 0)
    store i1 %SetHas_Right_result, i1* %ntb
    ;251 end statement: ntb = p_node.SetHas_Right(false);
    ;252 start statement : return true;
    ret i1 1
    

}

define i1 @RemoveLeft(%class_Tree* %this, %class_Tree* %p_node, %class_Tree* %c_node) {
init:
    %p_node1 = alloca %class_Tree*
    store %class_Tree* %p_node, %class_Tree** %p_node1
    %c_node1 = alloca %class_Tree*
    store %class_Tree* %c_node, %class_Tree** %c_node1
    %ntb = alloca i1
    ;259 start statement : {
    ;260 start statement : boolean ntb
    ;260 end statement: boolean ntb
    ;262 start statement : while (c_node.GetHas_Left()) {
    br label %whileStart
    
whileStart:
    %t = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 8
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Left_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Left_result, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;262 start statement : {
    ;266 start statement : ntb = c_node.SetKey(c_node.GetLeft().GetKey());
    %t1 = load %class_Tree*, %class_Tree** %c_node1
    %t2 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 4
    %procPointer1 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr1
    %GetLeft_result = call %class_Tree* %procPointer1(%class_Tree* %t2)
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %GetLeft_result, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 5
    %procPointer2 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr2
    %GetKey_result = call i32 %procPointer2(%class_Tree* %GetLeft_result)
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 6
    %procPointer3 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr3
    %SetKey_result = call i1 %procPointer3(%class_Tree* %t1, i32 %GetKey_result)
    store i1 %SetKey_result, i1* %ntb
    ;266 end statement: ntb = c_node.SetKey(c_node.GetLeft().GetKey());
    ;267 start statement : p_node = c_node;
    %t3 = load %class_Tree*, %class_Tree** %c_node1
    store %class_Tree* %t3, %class_Tree** %p_node1
    ;267 end statement: p_node = c_node;
    ;268 start statement : c_node = c_node.GetLeft();
    %t4 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 4
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetLeft_result1 = call %class_Tree* %procPointer4(%class_Tree* %t4)
    store %class_Tree* %GetLeft_result1, %class_Tree** %c_node1
    ;268 end statement: c_node = c_node.GetLeft();
    ;262 end statement: {
    br label %whileStart
    
endloop:
    ;262 end statement: while (c_node.GetHas_Left()) {
    ;270 start statement : ntb = p_node.SetLeft(my_null);
    %t5 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t6 = load %class_Tree*, %class_Tree** %iAddr
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 2
    %procPointer5 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr5
    %SetLeft_result = call i1 %procPointer5(%class_Tree* %t5, %class_Tree* %t6)
    store i1 %SetLeft_result, i1* %ntb
    ;270 end statement: ntb = p_node.SetLeft(my_null);
    ;271 start statement : ntb = p_node.SetHas_Left(false);
    %t7 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 9
    %procPointer6 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr6
    %SetHas_Left_result = call i1 %procPointer6(%class_Tree* %t7, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;271 end statement: ntb = p_node.SetHas_Left(false);
    ;272 start statement : return true;
    ret i1 1
    

}

define i32 @Search(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %cont = alloca i1
    %ifound = alloca i32
    %current_node = alloca %class_Tree*
    %key_aux = alloca i32
    ;276 start statement : {
    ;277 start statement : boolean cont
    ;277 end statement: boolean cont
    ;278 start statement : int ifound
    ;278 end statement: int ifound
    ;279 start statement : Tree current_node
    ;279 end statement: Tree current_node
    ;280 start statement : int key_aux
    ;280 end statement: int key_aux
    ;282 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;282 end statement: current_node = this;
    ;283 start statement : cont = true;
    store i1 1, i1* %cont
    ;283 end statement: cont = true;
    ;284 start statement : ifound = 0;
    store i32 0, i32* %ifound
    ;284 end statement: ifound = 0;
    ;285 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;285 start statement : {
    ;286 start statement : key_aux = current_node.GetKey();
    %t1 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 5
    %procPointer = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr
    %GetKey_result = call i32 %procPointer(%class_Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;286 end statement: key_aux = current_node.GetKey();
    ;287 start statement : if ((v_key < key_aux)) if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;288 start statement : if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t4 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 8
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %GetHas_Left_result = call i1 %procPointer1(%class_Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;289 start statement : current_node = current_node.GetLeft();
    %t5 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 4
    %procPointer2 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr2
    %GetLeft_result = call %class_Tree* %procPointer2(%class_Tree* %t5)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;289 end statement: current_node = current_node.GetLeft();
    br label %endif
    
ifFalse:
    ;290 start statement : cont = false;
    store i1 0, i1* %cont
    ;290 end statement: cont = false;
    br label %endif
    
endif:
    ;288 end statement: if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    br label %endif3
    
ifFalse1:
    ;292 start statement : if ((key_aux < v_key)) if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t6 = load i32, i32* %key_aux
    %t7 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t6, %t7
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;293 start statement : if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t8 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 7
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %GetHas_Right_result = call i1 %procPointer3(%class_Tree* %t8)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;294 start statement : current_node = current_node.GetRight();
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 3
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetRight_result = call %class_Tree* %procPointer4(%class_Tree* %t9)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;294 end statement: current_node = current_node.GetRight();
    br label %endif1
    
ifFalse2:
    ;295 start statement : cont = false;
    store i1 0, i1* %cont
    ;295 end statement: cont = false;
    br label %endif1
    
endif1:
    ;293 end statement: if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    br label %endif2
    
ifFalse3:
    ;292 start statement : {
    ;297 start statement : ifound = 1;
    store i32 1, i32* %ifound
    ;297 end statement: ifound = 1;
    ;298 start statement : cont = false;
    store i1 0, i1* %cont
    ;298 end statement: cont = false;
    ;292 end statement: {
    br label %endif2
    
endif2:
    ;292 end statement: if ((key_aux < v_key)) if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    br label %endif3
    
endif3:
    ;287 end statement: if ((v_key < key_aux)) if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    ;285 end statement: {
    br label %whileStart
    
endloop:
    ;285 end statement: while (cont) {
    ;301 start statement : return ifound;
    %t10 = load i32, i32* %ifound
    ret i32 %t10
    

}

define i1 @Print(%class_Tree* %this) {
init:
    %current_node = alloca %class_Tree*
    %ntb = alloca i1
    ;305 start statement : {
    ;306 start statement : Tree current_node
    ;306 end statement: Tree current_node
    ;307 start statement : boolean ntb
    ;307 end statement: boolean ntb
    ;309 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;309 end statement: current_node = this;
    ;310 start statement : ntb = this.RecPrint(current_node);
    %t = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 19
    %procPointer = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr
    %RecPrint_result = call i1 %procPointer(%class_Tree* %this, %class_Tree* %t)
    store i1 %RecPrint_result, i1* %ntb
    ;310 end statement: ntb = this.RecPrint(current_node);
    ;311 start statement : return true;
    ret i1 1
    

}

define i1 @RecPrint(%class_Tree* %this, %class_Tree* %node) {
init:
    %node1 = alloca %class_Tree*
    store %class_Tree* %node, %class_Tree** %node1
    %ntb = alloca i1
    ;315 start statement : {
    ;316 start statement : boolean ntb
    ;316 end statement: boolean ntb
    ;318 start statement : if (node.GetHas_Left()) {
    %t = load %class_Tree*, %class_Tree** %node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 8
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Left_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;318 start statement : {
    ;321 start statement : ntb = this.RecPrint(node.GetLeft());
    %t1 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 4
    %procPointer1 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr1
    %GetLeft_result = call %class_Tree* %procPointer1(%class_Tree* %t1)
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 19
    %procPointer2 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr2
    %RecPrint_result = call i1 %procPointer2(%class_Tree* %this, %class_Tree* %GetLeft_result)
    store i1 %RecPrint_result, i1* %ntb
    ;321 end statement: ntb = this.RecPrint(node.GetLeft());
    ;318 end statement: {
    br label %endif
    
ifFalse:
    ;322 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;322 end statement: ntb = true;
    br label %endif
    
endif:
    ;318 end statement: if (node.GetHas_Left()) {
    ;323 start statement : printInt(node.GetKey());
    %t2 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 5
    %procPointer3 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr3
    %GetKey_result = call i32 %procPointer3(%class_Tree* %t2)
    call void @print(i32 %GetKey_result)
    ;323 end statement: printInt(node.GetKey());
    ;324 start statement : if (node.GetHas_Right()) {
    %t3 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 7
    %procPointer4 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr4
    %GetHas_Right_result = call i1 %procPointer4(%class_Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;324 start statement : {
    ;327 start statement : ntb = this.RecPrint(node.GetRight());
    %t4 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 3
    %procPointer5 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr5
    %GetRight_result = call %class_Tree* %procPointer5(%class_Tree* %t4)
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 19
    %procPointer6 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr6
    %RecPrint_result1 = call i1 %procPointer6(%class_Tree* %this, %class_Tree* %GetRight_result)
    store i1 %RecPrint_result1, i1* %ntb
    ;327 end statement: ntb = this.RecPrint(node.GetRight());
    ;324 end statement: {
    br label %endif1
    
ifFalse1:
    ;328 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;328 end statement: ntb = true;
    br label %endif1
    
endif1:
    ;324 end statement: if (node.GetHas_Right()) {
    ;329 start statement : return true;
    ret i1 1
    

}

define %class_Tree* @newClassTree() {
init:
    %sizeOfStruct = add i32 0, 42
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_Tree*
    %iAddr = getelementptr %class_Tree, %class_Tree* %newObject, i32 0, i32 0
    store %vfTableStructTree* @vtableGVarTree, %vfTableStructTree** %iAddr
    ret %class_Tree* %newObject
    

}

define i32 @main() {
init:
    ;1 start statement : {
    ;2 start statement : printInt(new BT().Start());
    %NewObjectBT = call %class_BT* @newClassBT()
    %vtableAddr = getelementptr %class_BT, %class_BT* %NewObjectBT, i32 0, i32 0
    %vtablePointer = load %vfTableStructBT*, %vfTableStructBT** %vtableAddr
    %procAddr = getelementptr %vfTableStructBT, %vfTableStructBT* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_BT*)*, i32(%class_BT*)** %procAddr
    %Start_result = call i32 %procPointer(%class_BT* %NewObjectBT)
    call void @print(i32 %Start_result)
    ;2 end statement: printInt(new BT().Start());
    ;3 start statement : return 0;
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
