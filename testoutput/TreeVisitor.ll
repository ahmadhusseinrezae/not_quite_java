

%class_TV = type {
     %vfTableStructTV*  ; procs_pointer
}

%vfTableStructTV = type {
     i32(%class_TV*)*  ; Start
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
    ,i32(%class_Tree*, %class_Visitor*)*  ; accept
}

%class_Visitor = type {
     %vfTableStructVisitor*  ; procs_pointer
    ,%class_Tree*  ; l
    ,%class_Tree*  ; r
}

%vfTableStructVisitor = type {
     i32(%class_Visitor*, %class_Tree*)*  ; visit
}

%class_MyVisitor = type {
     %vfTableStructMyVisitor*  ; procs_pointer
    ,%class_Tree*  ; l
    ,%class_Tree*  ; r
}

%vfTableStructMyVisitor = type {
     i32(%class_MyVisitor*, %class_Tree*)*  ; visit
}

@vtableGVarTV = global %vfTableStructTV  {
    i32(%class_TV*)* @Start
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
    i1(%class_Tree*, %class_Tree*)* @RecPrint,
    i32(%class_Tree*, %class_Visitor*)* @accept
}


@vtableGVarVisitor = global %vfTableStructVisitor  {
    i32(%class_Visitor*, %class_Tree*)* @visit
}


@vtableGVarMyVisitor = global %vfTableStructMyVisitor  {
    i32(%class_MyVisitor*, %class_Tree*)* @visit1
}


define i32 @Start(%class_TV* %this) {
init:
    %root = alloca %class_Tree*
    %ntb = alloca i1
    %nti = alloca i32
    %v = alloca %class_MyVisitor*
    ;12 start statement : {
    ;13 start statement : Tree root
    ;13 end statement: Tree root
    ;14 start statement : boolean ntb
    ;14 end statement: boolean ntb
    ;15 start statement : int nti
    ;15 end statement: int nti
    ;16 start statement : MyVisitor v
    ;16 end statement: MyVisitor v
    ;18 start statement : root = new Tree();
    %NewObjectTree = call %class_Tree* @newClassTree()
    store %class_Tree* %NewObjectTree, %class_Tree** %root
    ;18 end statement: root = new Tree();
    ;19 start statement : ntb = root.Init(16);
    %t = load %class_Tree*, %class_Tree** %root
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 0
    %procPointer = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr
    %Init_result = call i1 %procPointer(%class_Tree* %t, i32 16)
    store i1 %Init_result, i1* %ntb
    ;19 end statement: ntb = root.Init(16);
    ;20 start statement : ntb = root.Print();
    %t1 = load %class_Tree*, %class_Tree** %root
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 18
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %Print_result = call i1 %procPointer1(%class_Tree* %t1)
    store i1 %Print_result, i1* %ntb
    ;20 end statement: ntb = root.Print();
    ;21 start statement : printInt(100000000);
    call void @print(i32 100000000)
    ;21 end statement: printInt(100000000);
    ;22 start statement : ntb = root.Insert(8);
    %t2 = load %class_Tree*, %class_Tree** %root
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 12
    %procPointer2 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr2
    %Insert_result = call i1 %procPointer2(%class_Tree* %t2, i32 8)
    store i1 %Insert_result, i1* %ntb
    ;22 end statement: ntb = root.Insert(8);
    ;23 start statement : ntb = root.Insert(24);
    %t3 = load %class_Tree*, %class_Tree** %root
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 12
    %procPointer3 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr3
    %Insert_result1 = call i1 %procPointer3(%class_Tree* %t3, i32 24)
    store i1 %Insert_result1, i1* %ntb
    ;23 end statement: ntb = root.Insert(24);
    ;24 start statement : ntb = root.Insert(4);
    %t4 = load %class_Tree*, %class_Tree** %root
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 12
    %procPointer4 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr4
    %Insert_result2 = call i1 %procPointer4(%class_Tree* %t4, i32 4)
    store i1 %Insert_result2, i1* %ntb
    ;24 end statement: ntb = root.Insert(4);
    ;25 start statement : ntb = root.Insert(12);
    %t5 = load %class_Tree*, %class_Tree** %root
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 12
    %procPointer5 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr5
    %Insert_result3 = call i1 %procPointer5(%class_Tree* %t5, i32 12)
    store i1 %Insert_result3, i1* %ntb
    ;25 end statement: ntb = root.Insert(12);
    ;26 start statement : ntb = root.Insert(20);
    %t6 = load %class_Tree*, %class_Tree** %root
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 12
    %procPointer6 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr6
    %Insert_result4 = call i1 %procPointer6(%class_Tree* %t6, i32 20)
    store i1 %Insert_result4, i1* %ntb
    ;26 end statement: ntb = root.Insert(20);
    ;27 start statement : ntb = root.Insert(28);
    %t7 = load %class_Tree*, %class_Tree** %root
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 12
    %procPointer7 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr7
    %Insert_result5 = call i1 %procPointer7(%class_Tree* %t7, i32 28)
    store i1 %Insert_result5, i1* %ntb
    ;27 end statement: ntb = root.Insert(28);
    ;28 start statement : ntb = root.Insert(14);
    %t8 = load %class_Tree*, %class_Tree** %root
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 12
    %procPointer8 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr8
    %Insert_result6 = call i1 %procPointer8(%class_Tree* %t8, i32 14)
    store i1 %Insert_result6, i1* %ntb
    ;28 end statement: ntb = root.Insert(14);
    ;29 start statement : ntb = root.Print();
    %t9 = load %class_Tree*, %class_Tree** %root
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 18
    %procPointer9 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr9
    %Print_result1 = call i1 %procPointer9(%class_Tree* %t9)
    store i1 %Print_result1, i1* %ntb
    ;29 end statement: ntb = root.Print();
    ;30 start statement : printInt(100000000);
    call void @print(i32 100000000)
    ;30 end statement: printInt(100000000);
    ;31 start statement : v = new MyVisitor();
    %NewObjectMyVisitor = call %class_MyVisitor* @newClassMyVisitor()
    store %class_MyVisitor* %NewObjectMyVisitor, %class_MyVisitor** %v
    ;31 end statement: v = new MyVisitor();
    ;32 start statement : printInt(50000000);
    call void @print(i32 50000000)
    ;32 end statement: printInt(50000000);
    ;33 start statement : nti = root.accept(v);
    %t10 = load %class_Tree*, %class_Tree** %root
    %t11 = load %class_MyVisitor*, %class_MyVisitor** %v
    %castValue = bitcast %class_MyVisitor* %t11 to %class_Visitor*
    %vtableAddr10 = getelementptr %class_Tree, %class_Tree* %t10, i32 0, i32 0
    %vtablePointer10 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr10
    %procAddr10 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer10, i32 0, i32 20
    %procPointer10 = load i32(%class_Tree*, %class_Visitor*)*, i32(%class_Tree*, %class_Visitor*)** %procAddr10
    %accept_result = call i32 %procPointer10(%class_Tree* %t10, %class_Visitor* %castValue)
    store i32 %accept_result, i32* %nti
    ;33 end statement: nti = root.accept(v);
    ;34 start statement : printInt(100000000);
    call void @print(i32 100000000)
    ;34 end statement: printInt(100000000);
    ;35 start statement : printInt(root.Search(24));
    %t12 = load %class_Tree*, %class_Tree** %root
    %vtableAddr11 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer11 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr11
    %procAddr11 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer11, i32 0, i32 17
    %procPointer11 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr11
    %Search_result = call i32 %procPointer11(%class_Tree* %t12, i32 24)
    call void @print(i32 %Search_result)
    ;35 end statement: printInt(root.Search(24));
    ;36 start statement : printInt(root.Search(12));
    %t13 = load %class_Tree*, %class_Tree** %root
    %vtableAddr12 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer12 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr12
    %procAddr12 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer12, i32 0, i32 17
    %procPointer12 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr12
    %Search_result1 = call i32 %procPointer12(%class_Tree* %t13, i32 12)
    call void @print(i32 %Search_result1)
    ;36 end statement: printInt(root.Search(12));
    ;37 start statement : printInt(root.Search(16));
    %t14 = load %class_Tree*, %class_Tree** %root
    %vtableAddr13 = getelementptr %class_Tree, %class_Tree* %t14, i32 0, i32 0
    %vtablePointer13 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr13
    %procAddr13 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer13, i32 0, i32 17
    %procPointer13 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr13
    %Search_result2 = call i32 %procPointer13(%class_Tree* %t14, i32 16)
    call void @print(i32 %Search_result2)
    ;37 end statement: printInt(root.Search(16));
    ;38 start statement : printInt(root.Search(50));
    %t15 = load %class_Tree*, %class_Tree** %root
    %vtableAddr14 = getelementptr %class_Tree, %class_Tree* %t15, i32 0, i32 0
    %vtablePointer14 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr14
    %procAddr14 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer14, i32 0, i32 17
    %procPointer14 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr14
    %Search_result3 = call i32 %procPointer14(%class_Tree* %t15, i32 50)
    call void @print(i32 %Search_result3)
    ;38 end statement: printInt(root.Search(50));
    ;39 start statement : printInt(root.Search(12));
    %t16 = load %class_Tree*, %class_Tree** %root
    %vtableAddr15 = getelementptr %class_Tree, %class_Tree* %t16, i32 0, i32 0
    %vtablePointer15 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr15
    %procAddr15 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer15, i32 0, i32 17
    %procPointer15 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr15
    %Search_result4 = call i32 %procPointer15(%class_Tree* %t16, i32 12)
    call void @print(i32 %Search_result4)
    ;39 end statement: printInt(root.Search(12));
    ;40 start statement : ntb = root.Delete(12);
    %t17 = load %class_Tree*, %class_Tree** %root
    %vtableAddr16 = getelementptr %class_Tree, %class_Tree* %t17, i32 0, i32 0
    %vtablePointer16 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr16
    %procAddr16 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer16, i32 0, i32 13
    %procPointer16 = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr16
    %Delete_result = call i1 %procPointer16(%class_Tree* %t17, i32 12)
    store i1 %Delete_result, i1* %ntb
    ;40 end statement: ntb = root.Delete(12);
    ;41 start statement : ntb = root.Print();
    %t18 = load %class_Tree*, %class_Tree** %root
    %vtableAddr17 = getelementptr %class_Tree, %class_Tree* %t18, i32 0, i32 0
    %vtablePointer17 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr17
    %procAddr17 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer17, i32 0, i32 18
    %procPointer17 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr17
    %Print_result2 = call i1 %procPointer17(%class_Tree* %t18)
    store i1 %Print_result2, i1* %ntb
    ;41 end statement: ntb = root.Print();
    ;42 start statement : printInt(root.Search(12));
    %t19 = load %class_Tree*, %class_Tree** %root
    %vtableAddr18 = getelementptr %class_Tree, %class_Tree* %t19, i32 0, i32 0
    %vtablePointer18 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr18
    %procAddr18 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer18, i32 0, i32 17
    %procPointer18 = load i32(%class_Tree*, i32)*, i32(%class_Tree*, i32)** %procAddr18
    %Search_result5 = call i32 %procPointer18(%class_Tree* %t19, i32 12)
    call void @print(i32 %Search_result5)
    ;42 end statement: printInt(root.Search(12));
    ;44 start statement : return 0;
    ret i32 0
    

}

define %class_TV* @newClassTV() {
init:
    %sizeOfStruct = add i32 0, 8
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_TV*
    %iAddr = getelementptr %class_TV, %class_TV* %newObject, i32 0, i32 0
    store %vfTableStructTV* @vtableGVarTV, %vfTableStructTV** %iAddr
    ret %class_TV* %newObject
    

}

define i1 @Init(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;74 start statement : {
    ;75 start statement : key = v_key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %iAddr
    ;75 end statement: key = v_key;
    ;76 start statement : has_left = false;
    %iAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    store i1 0, i1* %iAddr1
    ;76 end statement: has_left = false;
    ;77 start statement : has_right = false;
    %iAddr2 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    store i1 0, i1* %iAddr2
    ;77 end statement: has_right = false;
    ;78 start statement : return true;
    ret i1 1
    

}

define i1 @SetRight(%class_Tree* %this, %class_Tree* %rn) {
init:
    %rn1 = alloca %class_Tree*
    store %class_Tree* %rn, %class_Tree** %rn1
    ;81 start statement : {
    ;82 start statement : right = rn;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 2
    %t = load %class_Tree*, %class_Tree** %rn1
    store %class_Tree* %t, %class_Tree** %iAddr
    ;82 end statement: right = rn;
    ;83 start statement : return true;
    ret i1 1
    

}

define i1 @SetLeft(%class_Tree* %this, %class_Tree* %ln) {
init:
    %ln1 = alloca %class_Tree*
    store %class_Tree* %ln, %class_Tree** %ln1
    ;86 start statement : {
    ;87 start statement : left = ln;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 1
    %t = load %class_Tree*, %class_Tree** %ln1
    store %class_Tree* %t, %class_Tree** %iAddr
    ;87 end statement: left = ln;
    ;88 start statement : return true;
    ret i1 1
    

}

define %class_Tree* @GetRight(%class_Tree* %this) {
init:
    ;91 start statement : {
    ;92 start statement : return right;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 2
    %t = load %class_Tree*, %class_Tree** %iAddr
    ret %class_Tree* %t
    

}

define %class_Tree* @GetLeft(%class_Tree* %this) {
init:
    ;95 start statement : {
    ;96 start statement : return left;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 1
    %t = load %class_Tree*, %class_Tree** %iAddr
    ret %class_Tree* %t
    

}

define i32 @GetKey(%class_Tree* %this) {
init:
    ;99 start statement : {
    ;100 start statement : return key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %iAddr
    ret i32 %t
    

}

define i1 @SetKey(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    ;103 start statement : {
    ;104 start statement : key = v_key;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 3
    %t = load i32, i32* %v_key1
    store i32 %t, i32* %iAddr
    ;104 end statement: key = v_key;
    ;105 start statement : return true;
    ret i1 1
    

}

define i1 @GetHas_Right(%class_Tree* %this) {
init:
    ;108 start statement : {
    ;109 start statement : return has_right;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    %t = load i1, i1* %iAddr
    ret i1 %t
    

}

define i1 @GetHas_Left(%class_Tree* %this) {
init:
    ;112 start statement : {
    ;113 start statement : return has_left;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    %t = load i1, i1* %iAddr
    ret i1 %t
    

}

define i1 @SetHas_Left(%class_Tree* %this, i1 %val) {
init:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;116 start statement : {
    ;117 start statement : has_left = val;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 4
    %t = load i1, i1* %val1
    store i1 %t, i1* %iAddr
    ;117 end statement: has_left = val;
    ;118 start statement : return true;
    ret i1 1
    

}

define i1 @SetHas_Right(%class_Tree* %this, i1 %val) {
init:
    %val1 = alloca i1
    store i1 %val, i1* %val1
    ;121 start statement : {
    ;122 start statement : has_right = val;
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 5
    %t = load i1, i1* %val1
    store i1 %t, i1* %iAddr
    ;122 end statement: has_right = val;
    ;123 start statement : return true;
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
    ;126 start statement : {
    ;127 start statement : boolean ntb
    ;127 end statement: boolean ntb
    ;128 start statement : int nti
    ;128 end statement: int nti
    ;130 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;130 end statement: ntb = false;
    ;131 start statement : nti = (num2 + 1);
    %t = load i32, i32* %num21
    %resAddImpl = add i32 %t, 1
    store i32 %resAddImpl, i32* %nti
    ;131 end statement: nti = (num2 + 1);
    ;132 start statement : if ((num1 < num2)) ntb = false;
    %t1 = load i32, i32* %num11
    %t2 = load i32, i32* %num21
    %resSltImpl = icmp slt i32 %t1, %t2
    br i1 %resSltImpl, label %ifTrue, label %ifFalse
    
ifTrue:
    ;132 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;132 end statement: ntb = false;
    br label %endif1
    
ifFalse:
    ;133 start statement : if ((! (num1 < nti))) ntb = false;
    %t3 = load i32, i32* %num11
    %t4 = load i32, i32* %nti
    %resSltImpl1 = icmp slt i32 %t3, %t4
    %neg_res = icmp eq i1 0, %resSltImpl1
    br i1 %neg_res, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;133 start statement : ntb = false;
    store i1 0, i1* %ntb
    ;133 end statement: ntb = false;
    br label %endif
    
ifFalse1:
    ;134 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;134 end statement: ntb = true;
    br label %endif
    
endif:
    ;133 end statement: if ((! (num1 < nti))) ntb = false;
    br label %endif1
    
endif1:
    ;132 end statement: if ((num1 < num2)) ntb = false;
    ;135 start statement : return ntb;
    %t5 = load i1, i1* %ntb
    ret i1 %t5
    

}

define i1 @Insert(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %new_node = alloca %class_Tree*
    %ntb = alloca i1
    %current_node = alloca %class_Tree*
    %cont = alloca i1
    %key_aux = alloca i32
    ;138 start statement : {
    ;139 start statement : Tree new_node
    ;139 end statement: Tree new_node
    ;140 start statement : boolean ntb
    ;140 end statement: boolean ntb
    ;141 start statement : Tree current_node
    ;141 end statement: Tree current_node
    ;142 start statement : boolean cont
    ;142 end statement: boolean cont
    ;143 start statement : int key_aux
    ;143 end statement: int key_aux
    ;145 start statement : new_node = new Tree();
    %NewObjectTree = call %class_Tree* @newClassTree()
    store %class_Tree* %NewObjectTree, %class_Tree** %new_node
    ;145 end statement: new_node = new Tree();
    ;146 start statement : ntb = new_node.Init(v_key);
    %t = load %class_Tree*, %class_Tree** %new_node
    %t1 = load i32, i32* %v_key1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 0
    %procPointer = load i1(%class_Tree*, i32)*, i1(%class_Tree*, i32)** %procAddr
    %Init_result = call i1 %procPointer(%class_Tree* %t, i32 %t1)
    store i1 %Init_result, i1* %ntb
    ;146 end statement: ntb = new_node.Init(v_key);
    ;147 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;147 end statement: current_node = this;
    ;148 start statement : cont = true;
    store i1 1, i1* %cont
    ;148 end statement: cont = true;
    ;149 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t2 = load i1, i1* %cont
    br i1 %t2, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;149 start statement : {
    ;150 start statement : key_aux = current_node.GetKey();
    %t3 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 5
    %procPointer1 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr1
    %GetKey_result = call i32 %procPointer1(%class_Tree* %t3)
    store i32 %GetKey_result, i32* %key_aux
    ;150 end statement: key_aux = current_node.GetKey();
    ;151 start statement : if ((v_key < key_aux)) {
    %t4 = load i32, i32* %v_key1
    %t5 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t4, %t5
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;151 start statement : {
    ;152 start statement : if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t6 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 8
    %procPointer2 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr2
    %GetHas_Left_result = call i1 %procPointer2(%class_Tree* %t6)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;153 start statement : current_node = current_node.GetLeft();
    %t7 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 4
    %procPointer3 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr3
    %GetLeft_result = call %class_Tree* %procPointer3(%class_Tree* %t7)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;153 end statement: current_node = current_node.GetLeft();
    br label %endif
    
ifFalse:
    ;152 start statement : {
    ;155 start statement : cont = false;
    store i1 0, i1* %cont
    ;155 end statement: cont = false;
    ;156 start statement : ntb = current_node.SetHas_Left(true);
    %t8 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 9
    %procPointer4 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr4
    %SetHas_Left_result = call i1 %procPointer4(%class_Tree* %t8, i1 1)
    store i1 %SetHas_Left_result, i1* %ntb
    ;156 end statement: ntb = current_node.SetHas_Left(true);
    ;157 start statement : ntb = current_node.SetLeft(new_node);
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %t10 = load %class_Tree*, %class_Tree** %new_node
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 2
    %procPointer5 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr5
    %SetLeft_result = call i1 %procPointer5(%class_Tree* %t9, %class_Tree* %t10)
    store i1 %SetLeft_result, i1* %ntb
    ;157 end statement: ntb = current_node.SetLeft(new_node);
    ;152 end statement: {
    br label %endif
    
endif:
    ;152 end statement: if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    ;151 end statement: {
    br label %endif2
    
ifFalse1:
    ;151 start statement : {
    ;161 start statement : if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t11 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t11, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 7
    %procPointer6 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr6
    %GetHas_Right_result = call i1 %procPointer6(%class_Tree* %t11)
    br i1 %GetHas_Right_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;162 start statement : current_node = current_node.GetRight();
    %t12 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 3
    %procPointer7 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr7
    %GetRight_result = call %class_Tree* %procPointer7(%class_Tree* %t12)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;162 end statement: current_node = current_node.GetRight();
    br label %endif1
    
ifFalse2:
    ;161 start statement : {
    ;164 start statement : cont = false;
    store i1 0, i1* %cont
    ;164 end statement: cont = false;
    ;165 start statement : ntb = current_node.SetHas_Right(true);
    %t13 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 10
    %procPointer8 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr8
    %SetHas_Right_result = call i1 %procPointer8(%class_Tree* %t13, i1 1)
    store i1 %SetHas_Right_result, i1* %ntb
    ;165 end statement: ntb = current_node.SetHas_Right(true);
    ;166 start statement : ntb = current_node.SetRight(new_node);
    %t14 = load %class_Tree*, %class_Tree** %current_node
    %t15 = load %class_Tree*, %class_Tree** %new_node
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t14, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 1
    %procPointer9 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr9
    %SetRight_result = call i1 %procPointer9(%class_Tree* %t14, %class_Tree* %t15)
    store i1 %SetRight_result, i1* %ntb
    ;166 end statement: ntb = current_node.SetRight(new_node);
    ;161 end statement: {
    br label %endif1
    
endif1:
    ;161 end statement: if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    ;151 end statement: {
    br label %endif2
    
endif2:
    ;151 end statement: if ((v_key < key_aux)) {
    ;149 end statement: {
    br label %whileStart
    
endloop:
    ;149 end statement: while (cont) {
    ;170 start statement : return true;
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
    %ntb = alloca i1
    %is_root = alloca i1
    %key_aux = alloca i32
    ;173 start statement : {
    ;174 start statement : Tree current_node
    ;174 end statement: Tree current_node
    ;175 start statement : Tree parent_node
    ;175 end statement: Tree parent_node
    ;176 start statement : boolean cont
    ;176 end statement: boolean cont
    ;177 start statement : boolean found
    ;177 end statement: boolean found
    ;178 start statement : boolean ntb
    ;178 end statement: boolean ntb
    ;179 start statement : boolean is_root
    ;179 end statement: boolean is_root
    ;180 start statement : int key_aux
    ;180 end statement: int key_aux
    ;182 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;182 end statement: current_node = this;
    ;183 start statement : parent_node = this;
    store %class_Tree* %this, %class_Tree** %parent_node
    ;183 end statement: parent_node = this;
    ;184 start statement : cont = true;
    store i1 1, i1* %cont
    ;184 end statement: cont = true;
    ;185 start statement : found = false;
    store i1 0, i1* %found
    ;185 end statement: found = false;
    ;186 start statement : is_root = true;
    store i1 1, i1* %is_root
    ;186 end statement: is_root = true;
    ;187 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;187 start statement : {
    ;188 start statement : key_aux = current_node.GetKey();
    %t1 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 5
    %procPointer = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr
    %GetKey_result = call i32 %procPointer(%class_Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;188 end statement: key_aux = current_node.GetKey();
    ;189 start statement : if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;190 start statement : if (current_node.GetHas_Left()) {
    %t4 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 8
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %GetHas_Left_result = call i1 %procPointer1(%class_Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;190 start statement : {
    ;191 start statement : parent_node = current_node;
    %t5 = load %class_Tree*, %class_Tree** %current_node
    store %class_Tree* %t5, %class_Tree** %parent_node
    ;191 end statement: parent_node = current_node;
    ;192 start statement : current_node = current_node.GetLeft();
    %t6 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 4
    %procPointer2 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr2
    %GetLeft_result = call %class_Tree* %procPointer2(%class_Tree* %t6)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;192 end statement: current_node = current_node.GetLeft();
    ;190 end statement: {
    br label %endif
    
ifFalse:
    ;194 start statement : cont = false;
    store i1 0, i1* %cont
    ;194 end statement: cont = false;
    br label %endif
    
endif:
    ;190 end statement: if (current_node.GetHas_Left()) {
    br label %endif5
    
ifFalse1:
    ;196 start statement : if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    %t7 = load i32, i32* %key_aux
    %t8 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t7, %t8
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;197 start statement : if (current_node.GetHas_Right()) {
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 7
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %GetHas_Right_result = call i1 %procPointer3(%class_Tree* %t9)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;197 start statement : {
    ;198 start statement : parent_node = current_node;
    %t10 = load %class_Tree*, %class_Tree** %current_node
    store %class_Tree* %t10, %class_Tree** %parent_node
    ;198 end statement: parent_node = current_node;
    ;199 start statement : current_node = current_node.GetRight();
    %t11 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t11, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 3
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetRight_result = call %class_Tree* %procPointer4(%class_Tree* %t11)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;199 end statement: current_node = current_node.GetRight();
    ;197 end statement: {
    br label %endif1
    
ifFalse2:
    ;201 start statement : cont = false;
    store i1 0, i1* %cont
    ;201 end statement: cont = false;
    br label %endif1
    
endif1:
    ;197 end statement: if (current_node.GetHas_Right()) {
    br label %endif4
    
ifFalse3:
    ;196 start statement : {
    ;203 start statement : if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    %t12 = load i1, i1* %is_root
    br i1 %t12, label %ifTrue4, label %ifFalse5
    
ifTrue4:
    ;204 start statement : if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
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
    ;206 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;206 end statement: ntb = true;
    br label %endif2
    
ifFalse4:
    ;208 start statement : ntb = this.Remove(parent_node, current_node);
    %t15 = load %class_Tree*, %class_Tree** %parent_node
    %t16 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 14
    %procPointer7 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr7
    %Remove_result = call i1 %procPointer7(%class_Tree* %this, %class_Tree* %t15, %class_Tree* %t16)
    store i1 %Remove_result, i1* %ntb
    ;208 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif2
    
endif2:
    ;204 end statement: if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    br label %endif3
    
ifFalse5:
    ;209 start statement : ntb = this.Remove(parent_node, current_node);
    %t17 = load %class_Tree*, %class_Tree** %parent_node
    %t18 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 14
    %procPointer8 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr8
    %Remove_result1 = call i1 %procPointer8(%class_Tree* %this, %class_Tree* %t17, %class_Tree* %t18)
    store i1 %Remove_result1, i1* %ntb
    ;209 end statement: ntb = this.Remove(parent_node, current_node);
    br label %endif3
    
endif3:
    ;203 end statement: if (is_root) if (((! current_node.GetHas_Right()) && (! current_node.GetHas_Left()))) ntb = true;
    ;210 start statement : found = true;
    store i1 1, i1* %found
    ;210 end statement: found = true;
    ;211 start statement : cont = false;
    store i1 0, i1* %cont
    ;211 end statement: cont = false;
    ;196 end statement: {
    br label %endif4
    
endif4:
    ;196 end statement: if ((key_aux < v_key)) if (current_node.GetHas_Right()) {
    br label %endif5
    
endif5:
    ;189 end statement: if ((v_key < key_aux)) if (current_node.GetHas_Left()) {
    ;213 start statement : is_root = false;
    store i1 0, i1* %is_root
    ;213 end statement: is_root = false;
    ;187 end statement: {
    br label %whileStart
    
endloop:
    ;187 end statement: while (cont) {
    ;215 start statement : return found;
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
    ;218 start statement : {
    ;219 start statement : boolean ntb
    ;219 end statement: boolean ntb
    ;220 start statement : int auxkey1
    ;220 end statement: int auxkey1
    ;221 start statement : int auxkey2
    ;221 end statement: int auxkey2
    ;223 start statement : if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    %t = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 8
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Left_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;224 start statement : ntb = this.RemoveLeft(p_node, c_node);
    %t1 = load %class_Tree*, %class_Tree** %p_node1
    %t2 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 16
    %procPointer1 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr1
    %RemoveLeft_result = call i1 %procPointer1(%class_Tree* %this, %class_Tree* %t1, %class_Tree* %t2)
    store i1 %RemoveLeft_result, i1* %ntb
    ;224 end statement: ntb = this.RemoveLeft(p_node, c_node);
    br label %endif2
    
ifFalse:
    ;226 start statement : if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    %t3 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 7
    %procPointer2 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr2
    %GetHas_Right_result = call i1 %procPointer2(%class_Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;227 start statement : ntb = this.RemoveRight(p_node, c_node);
    %t4 = load %class_Tree*, %class_Tree** %p_node1
    %t5 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 15
    %procPointer3 = load i1(%class_Tree*, %class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*, %class_Tree*)** %procAddr3
    %RemoveRight_result = call i1 %procPointer3(%class_Tree* %this, %class_Tree* %t4, %class_Tree* %t5)
    store i1 %RemoveRight_result, i1* %ntb
    ;227 end statement: ntb = this.RemoveRight(p_node, c_node);
    br label %endif1
    
ifFalse1:
    ;226 start statement : {
    ;229 start statement : auxkey1 = c_node.GetKey();
    %t6 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 5
    %procPointer4 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr4
    %GetKey_result = call i32 %procPointer4(%class_Tree* %t6)
    store i32 %GetKey_result, i32* %auxkey1
    ;229 end statement: auxkey1 = c_node.GetKey();
    ;230 start statement : auxkey2 = p_node.GetLeft().GetKey();
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
    ;230 end statement: auxkey2 = p_node.GetLeft().GetKey();
    ;231 start statement : if (this.Compare(auxkey1, auxkey2)) {
    %t8 = load i32, i32* %auxkey1
    %t9 = load i32, i32* %auxkey2
    %vtableAddr7 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer7 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr7
    %procAddr7 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer7, i32 0, i32 11
    %procPointer7 = load i1(%class_Tree*, i32, i32)*, i1(%class_Tree*, i32, i32)** %procAddr7
    %Compare_result = call i1 %procPointer7(%class_Tree* %this, i32 %t8, i32 %t9)
    br i1 %Compare_result, label %ifTrue2, label %ifFalse2
    
ifTrue2:
    ;231 start statement : {
    ;232 start statement : ntb = p_node.SetLeft(my_null);
    %t10 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t11 = load %class_Tree*, %class_Tree** %iAddr
    %vtableAddr8 = getelementptr %class_Tree, %class_Tree* %t10, i32 0, i32 0
    %vtablePointer8 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr8
    %procAddr8 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer8, i32 0, i32 2
    %procPointer8 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr8
    %SetLeft_result = call i1 %procPointer8(%class_Tree* %t10, %class_Tree* %t11)
    store i1 %SetLeft_result, i1* %ntb
    ;232 end statement: ntb = p_node.SetLeft(my_null);
    ;233 start statement : ntb = p_node.SetHas_Left(false);
    %t12 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr9 = getelementptr %class_Tree, %class_Tree* %t12, i32 0, i32 0
    %vtablePointer9 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr9
    %procAddr9 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer9, i32 0, i32 9
    %procPointer9 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr9
    %SetHas_Left_result = call i1 %procPointer9(%class_Tree* %t12, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;233 end statement: ntb = p_node.SetHas_Left(false);
    ;231 end statement: {
    br label %endif
    
ifFalse2:
    ;231 start statement : {
    ;236 start statement : ntb = p_node.SetRight(my_null);
    %t13 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr1 = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t14 = load %class_Tree*, %class_Tree** %iAddr1
    %vtableAddr10 = getelementptr %class_Tree, %class_Tree* %t13, i32 0, i32 0
    %vtablePointer10 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr10
    %procAddr10 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer10, i32 0, i32 1
    %procPointer10 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr10
    %SetRight_result = call i1 %procPointer10(%class_Tree* %t13, %class_Tree* %t14)
    store i1 %SetRight_result, i1* %ntb
    ;236 end statement: ntb = p_node.SetRight(my_null);
    ;237 start statement : ntb = p_node.SetHas_Right(false);
    %t15 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr11 = getelementptr %class_Tree, %class_Tree* %t15, i32 0, i32 0
    %vtablePointer11 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr11
    %procAddr11 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer11, i32 0, i32 10
    %procPointer11 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr11
    %SetHas_Right_result = call i1 %procPointer11(%class_Tree* %t15, i1 0)
    store i1 %SetHas_Right_result, i1* %ntb
    ;237 end statement: ntb = p_node.SetHas_Right(false);
    ;231 end statement: {
    br label %endif
    
endif:
    ;231 end statement: if (this.Compare(auxkey1, auxkey2)) {
    ;226 end statement: {
    br label %endif1
    
endif1:
    ;226 end statement: if (c_node.GetHas_Right()) ntb = this.RemoveRight(p_node, c_node);
    br label %endif2
    
endif2:
    ;223 end statement: if (c_node.GetHas_Left()) ntb = this.RemoveLeft(p_node, c_node);
    ;240 start statement : return true;
    ret i1 1
    

}

define i1 @RemoveRight(%class_Tree* %this, %class_Tree* %p_node, %class_Tree* %c_node) {
init:
    %p_node1 = alloca %class_Tree*
    store %class_Tree* %p_node, %class_Tree** %p_node1
    %c_node1 = alloca %class_Tree*
    store %class_Tree* %c_node, %class_Tree** %c_node1
    %ntb = alloca i1
    ;243 start statement : {
    ;244 start statement : boolean ntb
    ;244 end statement: boolean ntb
    ;245 start statement : while (c_node.GetHas_Right()) {
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
    ;245 start statement : {
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
    ;245 end statement: {
    br label %whileStart
    
endloop:
    ;245 end statement: while (c_node.GetHas_Right()) {
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
    ;255 start statement : {
    ;256 start statement : boolean ntb
    ;256 end statement: boolean ntb
    ;257 start statement : while (c_node.GetHas_Left()) {
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
    ;257 start statement : {
    ;258 start statement : ntb = c_node.SetKey(c_node.GetLeft().GetKey());
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
    ;258 end statement: ntb = c_node.SetKey(c_node.GetLeft().GetKey());
    ;259 start statement : p_node = c_node;
    %t3 = load %class_Tree*, %class_Tree** %c_node1
    store %class_Tree* %t3, %class_Tree** %p_node1
    ;259 end statement: p_node = c_node;
    ;260 start statement : c_node = c_node.GetLeft();
    %t4 = load %class_Tree*, %class_Tree** %c_node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 4
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetLeft_result1 = call %class_Tree* %procPointer4(%class_Tree* %t4)
    store %class_Tree* %GetLeft_result1, %class_Tree** %c_node1
    ;260 end statement: c_node = c_node.GetLeft();
    ;257 end statement: {
    br label %whileStart
    
endloop:
    ;257 end statement: while (c_node.GetHas_Left()) {
    ;262 start statement : ntb = p_node.SetLeft(my_null);
    %t5 = load %class_Tree*, %class_Tree** %p_node1
    %iAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 6
    %t6 = load %class_Tree*, %class_Tree** %iAddr
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 2
    %procPointer5 = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr5
    %SetLeft_result = call i1 %procPointer5(%class_Tree* %t5, %class_Tree* %t6)
    store i1 %SetLeft_result, i1* %ntb
    ;262 end statement: ntb = p_node.SetLeft(my_null);
    ;263 start statement : ntb = p_node.SetHas_Left(false);
    %t7 = load %class_Tree*, %class_Tree** %p_node1
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t7, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 9
    %procPointer6 = load i1(%class_Tree*, i1)*, i1(%class_Tree*, i1)** %procAddr6
    %SetHas_Left_result = call i1 %procPointer6(%class_Tree* %t7, i1 0)
    store i1 %SetHas_Left_result, i1* %ntb
    ;263 end statement: ntb = p_node.SetHas_Left(false);
    ;264 start statement : return true;
    ret i1 1
    

}

define i32 @Search(%class_Tree* %this, i32 %v_key) {
init:
    %v_key1 = alloca i32
    store i32 %v_key, i32* %v_key1
    %current_node = alloca %class_Tree*
    %ifound = alloca i32
    %cont = alloca i1
    %key_aux = alloca i32
    ;268 start statement : {
    ;269 start statement : Tree current_node
    ;269 end statement: Tree current_node
    ;270 start statement : int ifound
    ;270 end statement: int ifound
    ;271 start statement : boolean cont
    ;271 end statement: boolean cont
    ;272 start statement : int key_aux
    ;272 end statement: int key_aux
    ;274 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;274 end statement: current_node = this;
    ;275 start statement : cont = true;
    store i1 1, i1* %cont
    ;275 end statement: cont = true;
    ;276 start statement : ifound = 0;
    store i32 0, i32* %ifound
    ;276 end statement: ifound = 0;
    ;277 start statement : while (cont) {
    br label %whileStart
    
whileStart:
    %t = load i1, i1* %cont
    br i1 %t, label %loopBodyStart, label %endloop
    
loopBodyStart:
    ;277 start statement : {
    ;278 start statement : key_aux = current_node.GetKey();
    %t1 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 5
    %procPointer = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr
    %GetKey_result = call i32 %procPointer(%class_Tree* %t1)
    store i32 %GetKey_result, i32* %key_aux
    ;278 end statement: key_aux = current_node.GetKey();
    ;279 start statement : if ((v_key < key_aux)) if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t2 = load i32, i32* %v_key1
    %t3 = load i32, i32* %key_aux
    %resSltImpl = icmp slt i32 %t2, %t3
    br i1 %resSltImpl, label %ifTrue, label %ifFalse1
    
ifTrue:
    ;280 start statement : if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    %t4 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 8
    %procPointer1 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr1
    %GetHas_Left_result = call i1 %procPointer1(%class_Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse
    
ifTrue1:
    ;281 start statement : current_node = current_node.GetLeft();
    %t5 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 4
    %procPointer2 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr2
    %GetLeft_result = call %class_Tree* %procPointer2(%class_Tree* %t5)
    store %class_Tree* %GetLeft_result, %class_Tree** %current_node
    ;281 end statement: current_node = current_node.GetLeft();
    br label %endif
    
ifFalse:
    ;282 start statement : cont = false;
    store i1 0, i1* %cont
    ;282 end statement: cont = false;
    br label %endif
    
endif:
    ;280 end statement: if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    br label %endif3
    
ifFalse1:
    ;284 start statement : if ((key_aux < v_key)) if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t6 = load i32, i32* %key_aux
    %t7 = load i32, i32* %v_key1
    %resSltImpl1 = icmp slt i32 %t6, %t7
    br i1 %resSltImpl1, label %ifTrue2, label %ifFalse3
    
ifTrue2:
    ;285 start statement : if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    %t8 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t8, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 7
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %GetHas_Right_result = call i1 %procPointer3(%class_Tree* %t8)
    br i1 %GetHas_Right_result, label %ifTrue3, label %ifFalse2
    
ifTrue3:
    ;286 start statement : current_node = current_node.GetRight();
    %t9 = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t9, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 3
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetRight_result = call %class_Tree* %procPointer4(%class_Tree* %t9)
    store %class_Tree* %GetRight_result, %class_Tree** %current_node
    ;286 end statement: current_node = current_node.GetRight();
    br label %endif1
    
ifFalse2:
    ;287 start statement : cont = false;
    store i1 0, i1* %cont
    ;287 end statement: cont = false;
    br label %endif1
    
endif1:
    ;285 end statement: if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    br label %endif2
    
ifFalse3:
    ;284 start statement : {
    ;289 start statement : ifound = 1;
    store i32 1, i32* %ifound
    ;289 end statement: ifound = 1;
    ;290 start statement : cont = false;
    store i1 0, i1* %cont
    ;290 end statement: cont = false;
    ;284 end statement: {
    br label %endif2
    
endif2:
    ;284 end statement: if ((key_aux < v_key)) if (current_node.GetHas_Right()) current_node = current_node.GetRight();
    br label %endif3
    
endif3:
    ;279 end statement: if ((v_key < key_aux)) if (current_node.GetHas_Left()) current_node = current_node.GetLeft();
    ;277 end statement: {
    br label %whileStart
    
endloop:
    ;277 end statement: while (cont) {
    ;293 start statement : return ifound;
    %t10 = load i32, i32* %ifound
    ret i32 %t10
    

}

define i1 @Print(%class_Tree* %this) {
init:
    %ntb = alloca i1
    %current_node = alloca %class_Tree*
    ;296 start statement : {
    ;297 start statement : boolean ntb
    ;297 end statement: boolean ntb
    ;298 start statement : Tree current_node
    ;298 end statement: Tree current_node
    ;300 start statement : current_node = this;
    store %class_Tree* %this, %class_Tree** %current_node
    ;300 end statement: current_node = this;
    ;301 start statement : ntb = this.RecPrint(current_node);
    %t = load %class_Tree*, %class_Tree** %current_node
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %this, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 19
    %procPointer = load i1(%class_Tree*, %class_Tree*)*, i1(%class_Tree*, %class_Tree*)** %procAddr
    %RecPrint_result = call i1 %procPointer(%class_Tree* %this, %class_Tree* %t)
    store i1 %RecPrint_result, i1* %ntb
    ;301 end statement: ntb = this.RecPrint(current_node);
    ;302 start statement : return true;
    ret i1 1
    

}

define i1 @RecPrint(%class_Tree* %this, %class_Tree* %node) {
init:
    %node1 = alloca %class_Tree*
    store %class_Tree* %node, %class_Tree** %node1
    %ntb = alloca i1
    ;305 start statement : {
    ;306 start statement : boolean ntb
    ;306 end statement: boolean ntb
    ;308 start statement : if (node.GetHas_Left()) {
    %t = load %class_Tree*, %class_Tree** %node1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 8
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Left_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Left_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;308 start statement : {
    ;309 start statement : ntb = this.RecPrint(node.GetLeft());
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
    ;309 end statement: ntb = this.RecPrint(node.GetLeft());
    ;308 end statement: {
    br label %endif
    
ifFalse:
    ;310 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;310 end statement: ntb = true;
    br label %endif
    
endif:
    ;308 end statement: if (node.GetHas_Left()) {
    ;311 start statement : printInt(node.GetKey());
    %t2 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 5
    %procPointer3 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr3
    %GetKey_result = call i32 %procPointer3(%class_Tree* %t2)
    call void @print(i32 %GetKey_result)
    ;311 end statement: printInt(node.GetKey());
    ;312 start statement : if (node.GetHas_Right()) {
    %t3 = load %class_Tree*, %class_Tree** %node1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 7
    %procPointer4 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr4
    %GetHas_Right_result = call i1 %procPointer4(%class_Tree* %t3)
    br i1 %GetHas_Right_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;312 start statement : {
    ;313 start statement : ntb = this.RecPrint(node.GetRight());
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
    ;313 end statement: ntb = this.RecPrint(node.GetRight());
    ;312 end statement: {
    br label %endif1
    
ifFalse1:
    ;314 start statement : ntb = true;
    store i1 1, i1* %ntb
    ;314 end statement: ntb = true;
    br label %endif1
    
endif1:
    ;312 end statement: if (node.GetHas_Right()) {
    ;315 start statement : return true;
    ret i1 1
    

}

define i32 @accept(%class_Tree* %this, %class_Visitor* %v) {
init:
    %v1 = alloca %class_Visitor*
    store %class_Visitor* %v, %class_Visitor** %v1
    %nti = alloca i32
    ;318 start statement : {
    ;319 start statement : int nti
    ;319 end statement: int nti
    ;321 start statement : printInt(333);
    call void @print(i32 333)
    ;321 end statement: printInt(333);
    ;322 start statement : nti = v.visit(this);
    %t = load %class_Visitor*, %class_Visitor** %v1
    %vtableAddr = getelementptr %class_Visitor, %class_Visitor* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructVisitor*, %vfTableStructVisitor** %vtableAddr
    %procAddr = getelementptr %vfTableStructVisitor, %vfTableStructVisitor* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_Visitor*, %class_Tree*)*, i32(%class_Visitor*, %class_Tree*)** %procAddr
    %visit_result = call i32 %procPointer(%class_Visitor* %t, %class_Tree* %this)
    store i32 %visit_result, i32* %nti
    ;322 end statement: nti = v.visit(this);
    ;323 start statement : return 0;
    ret i32 0
    

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

define i32 @visit(%class_Visitor* %this, %class_Tree* %n) {
init:
    %n1 = alloca %class_Tree*
    store %class_Tree* %n, %class_Tree** %n1
    %nti = alloca i32
    ;334 start statement : {
    ;335 start statement : int nti
    ;335 end statement: int nti
    ;337 start statement : if (n.GetHas_Right()) {
    %t = load %class_Tree*, %class_Tree** %n1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 7
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Right_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Right_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;337 start statement : {
    ;338 start statement : r = n.GetRight();
    %iAddr = getelementptr %class_Visitor, %class_Visitor* %this, i32 0, i32 2
    %t1 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 3
    %procPointer1 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr1
    %GetRight_result = call %class_Tree* %procPointer1(%class_Tree* %t1)
    store %class_Tree* %GetRight_result, %class_Tree** %iAddr
    ;338 end statement: r = n.GetRight();
    ;339 start statement : nti = r.accept(this);
    %iAddr1 = getelementptr %class_Visitor, %class_Visitor* %this, i32 0, i32 2
    %t2 = load %class_Tree*, %class_Tree** %iAddr1
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 20
    %procPointer2 = load i32(%class_Tree*, %class_Visitor*)*, i32(%class_Tree*, %class_Visitor*)** %procAddr2
    %accept_result = call i32 %procPointer2(%class_Tree* %t2, %class_Visitor* %this)
    store i32 %accept_result, i32* %nti
    ;339 end statement: nti = r.accept(this);
    ;337 end statement: {
    br label %endif
    
ifFalse:
    ;340 start statement : nti = 0;
    store i32 0, i32* %nti
    ;340 end statement: nti = 0;
    br label %endif
    
endif:
    ;337 end statement: if (n.GetHas_Right()) {
    ;342 start statement : if (n.GetHas_Left()) {
    %t3 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 8
    %procPointer3 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr3
    %GetHas_Left_result = call i1 %procPointer3(%class_Tree* %t3)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;342 start statement : {
    ;343 start statement : l = n.GetLeft();
    %iAddr2 = getelementptr %class_Visitor, %class_Visitor* %this, i32 0, i32 1
    %t4 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 4
    %procPointer4 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr4
    %GetLeft_result = call %class_Tree* %procPointer4(%class_Tree* %t4)
    store %class_Tree* %GetLeft_result, %class_Tree** %iAddr2
    ;343 end statement: l = n.GetLeft();
    ;344 start statement : nti = l.accept(this);
    %iAddr3 = getelementptr %class_Visitor, %class_Visitor* %this, i32 0, i32 1
    %t5 = load %class_Tree*, %class_Tree** %iAddr3
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 20
    %procPointer5 = load i32(%class_Tree*, %class_Visitor*)*, i32(%class_Tree*, %class_Visitor*)** %procAddr5
    %accept_result1 = call i32 %procPointer5(%class_Tree* %t5, %class_Visitor* %this)
    store i32 %accept_result1, i32* %nti
    ;344 end statement: nti = l.accept(this);
    ;342 end statement: {
    br label %endif1
    
ifFalse1:
    ;345 start statement : nti = 0;
    store i32 0, i32* %nti
    ;345 end statement: nti = 0;
    br label %endif1
    
endif1:
    ;342 end statement: if (n.GetHas_Left()) {
    ;347 start statement : return 0;
    ret i32 0
    

}

define %class_Visitor* @newClassVisitor() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_Visitor*
    %iAddr = getelementptr %class_Visitor, %class_Visitor* %newObject, i32 0, i32 0
    store %vfTableStructVisitor* @vtableGVarVisitor, %vfTableStructVisitor** %iAddr
    ret %class_Visitor* %newObject
    

}

define i32 @visit1(%class_MyVisitor* %this, %class_Tree* %n) {
init:
    %n1 = alloca %class_Tree*
    store %class_Tree* %n, %class_Tree** %n1
    %nti = alloca i32
    ;355 start statement : {
    ;356 start statement : int nti
    ;356 end statement: int nti
    ;358 start statement : if (n.GetHas_Right()) {
    %t = load %class_Tree*, %class_Tree** %n1
    %vtableAddr = getelementptr %class_Tree, %class_Tree* %t, i32 0, i32 0
    %vtablePointer = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr
    %procAddr = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer, i32 0, i32 7
    %procPointer = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr
    %GetHas_Right_result = call i1 %procPointer(%class_Tree* %t)
    br i1 %GetHas_Right_result, label %ifTrue, label %ifFalse
    
ifTrue:
    ;358 start statement : {
    ;359 start statement : r = n.GetRight();
    %iAddr = getelementptr %class_MyVisitor, %class_MyVisitor* %this, i32 0, i32 2
    %t1 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr1 = getelementptr %class_Tree, %class_Tree* %t1, i32 0, i32 0
    %vtablePointer1 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr1
    %procAddr1 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer1, i32 0, i32 3
    %procPointer1 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr1
    %GetRight_result = call %class_Tree* %procPointer1(%class_Tree* %t1)
    store %class_Tree* %GetRight_result, %class_Tree** %iAddr
    ;359 end statement: r = n.GetRight();
    ;360 start statement : nti = r.accept(this);
    %iAddr1 = getelementptr %class_MyVisitor, %class_MyVisitor* %this, i32 0, i32 2
    %t2 = load %class_Tree*, %class_Tree** %iAddr1
    %castValue = bitcast %class_MyVisitor* %this to %class_Visitor*
    %vtableAddr2 = getelementptr %class_Tree, %class_Tree* %t2, i32 0, i32 0
    %vtablePointer2 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr2
    %procAddr2 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer2, i32 0, i32 20
    %procPointer2 = load i32(%class_Tree*, %class_Visitor*)*, i32(%class_Tree*, %class_Visitor*)** %procAddr2
    %accept_result = call i32 %procPointer2(%class_Tree* %t2, %class_Visitor* %castValue)
    store i32 %accept_result, i32* %nti
    ;360 end statement: nti = r.accept(this);
    ;358 end statement: {
    br label %endif
    
ifFalse:
    ;361 start statement : nti = 0;
    store i32 0, i32* %nti
    ;361 end statement: nti = 0;
    br label %endif
    
endif:
    ;358 end statement: if (n.GetHas_Right()) {
    ;363 start statement : printInt(n.GetKey());
    %t3 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr3 = getelementptr %class_Tree, %class_Tree* %t3, i32 0, i32 0
    %vtablePointer3 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr3
    %procAddr3 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer3, i32 0, i32 5
    %procPointer3 = load i32(%class_Tree*)*, i32(%class_Tree*)** %procAddr3
    %GetKey_result = call i32 %procPointer3(%class_Tree* %t3)
    call void @print(i32 %GetKey_result)
    ;363 end statement: printInt(n.GetKey());
    ;365 start statement : if (n.GetHas_Left()) {
    %t4 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr4 = getelementptr %class_Tree, %class_Tree* %t4, i32 0, i32 0
    %vtablePointer4 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr4
    %procAddr4 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer4, i32 0, i32 8
    %procPointer4 = load i1(%class_Tree*)*, i1(%class_Tree*)** %procAddr4
    %GetHas_Left_result = call i1 %procPointer4(%class_Tree* %t4)
    br i1 %GetHas_Left_result, label %ifTrue1, label %ifFalse1
    
ifTrue1:
    ;365 start statement : {
    ;366 start statement : l = n.GetLeft();
    %iAddr2 = getelementptr %class_MyVisitor, %class_MyVisitor* %this, i32 0, i32 1
    %t5 = load %class_Tree*, %class_Tree** %n1
    %vtableAddr5 = getelementptr %class_Tree, %class_Tree* %t5, i32 0, i32 0
    %vtablePointer5 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr5
    %procAddr5 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer5, i32 0, i32 4
    %procPointer5 = load %class_Tree*(%class_Tree*)*, %class_Tree*(%class_Tree*)** %procAddr5
    %GetLeft_result = call %class_Tree* %procPointer5(%class_Tree* %t5)
    store %class_Tree* %GetLeft_result, %class_Tree** %iAddr2
    ;366 end statement: l = n.GetLeft();
    ;367 start statement : nti = l.accept(this);
    %iAddr3 = getelementptr %class_MyVisitor, %class_MyVisitor* %this, i32 0, i32 1
    %t6 = load %class_Tree*, %class_Tree** %iAddr3
    %castValue1 = bitcast %class_MyVisitor* %this to %class_Visitor*
    %vtableAddr6 = getelementptr %class_Tree, %class_Tree* %t6, i32 0, i32 0
    %vtablePointer6 = load %vfTableStructTree*, %vfTableStructTree** %vtableAddr6
    %procAddr6 = getelementptr %vfTableStructTree, %vfTableStructTree* %vtablePointer6, i32 0, i32 20
    %procPointer6 = load i32(%class_Tree*, %class_Visitor*)*, i32(%class_Tree*, %class_Visitor*)** %procAddr6
    %accept_result1 = call i32 %procPointer6(%class_Tree* %t6, %class_Visitor* %castValue1)
    store i32 %accept_result1, i32* %nti
    ;367 end statement: nti = l.accept(this);
    ;365 end statement: {
    br label %endif1
    
ifFalse1:
    ;368 start statement : nti = 0;
    store i32 0, i32* %nti
    ;368 end statement: nti = 0;
    br label %endif1
    
endif1:
    ;365 end statement: if (n.GetHas_Left()) {
    ;370 start statement : return 0;
    ret i32 0
    

}

define %class_MyVisitor* @newClassMyVisitor() {
init:
    %sizeOfStruct = add i32 0, 24
    %mallocRes = call i8* @malloc(i32 %sizeOfStruct)
    %newObject = bitcast i8* %mallocRes to %class_MyVisitor*
    %iAddr = getelementptr %class_MyVisitor, %class_MyVisitor* %newObject, i32 0, i32 0
    store %vfTableStructMyVisitor* @vtableGVarMyVisitor, %vfTableStructMyVisitor** %iAddr
    ret %class_MyVisitor* %newObject
    

}

define i32 @main() {
init:
    ;5 start statement : {
    ;6 start statement : printInt(new TV().Start());
    %NewObjectTV = call %class_TV* @newClassTV()
    %vtableAddr = getelementptr %class_TV, %class_TV* %NewObjectTV, i32 0, i32 0
    %vtablePointer = load %vfTableStructTV*, %vfTableStructTV** %vtableAddr
    %procAddr = getelementptr %vfTableStructTV, %vfTableStructTV* %vtablePointer, i32 0, i32 0
    %procPointer = load i32(%class_TV*)*, i32(%class_TV*)** %procAddr
    %Start_result = call i32 %procPointer(%class_TV* %NewObjectTV)
    call void @print(i32 %Start_result)
    ;6 end statement: printInt(new TV().Start());
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
