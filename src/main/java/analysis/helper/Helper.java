package analysis.helper;

import analysis.*;
import analysis.symboltable.*;
import analysis.typeinfo.*;
import analysis.typeinfo.nonPrimativeTypes.*;
import java.util.*;
import notquitejava.ast.*;

/** Helper class to generate function signitures. */
public class Helper {

    /**
     * It makes a function signiture.
     *
     * @param name name
     *
     * @param params params
     *
     * @param analysis analysis
     * @return String
     */
    public static String makeFunctionSignature(
        String name, NQJVarDeclList params, Analysis analysis) {
        String finalName = name;
        for (NQJVarDecl param : params) {
            finalName += "_" + analysis.type(param.getType());
        }
        return finalName;
    }

    /**
     * I makes a list of function signiture.
     *
     * @param funcName funcName
     *
     * @param params params
     *
     * @param analysis analysis
     * @return ArrayList list of valie function signiture
     */
    public static ArrayList<String> makeParentFuncSignature(
        String funcName, NQJVarDeclList params, Analysis analysis) {
        ArrayList<String> finalSigns = new ArrayList<>();
        finalSigns.add(funcName);
        for (NQJVarDecl param : params) {
            List<String> tempSigns = new ArrayList<>();
            Type paramType = analysis.type(param.getType());
            if (paramType instanceof ClassType) {
                ClassScope classScope = ((ClassType) paramType).getClassScope();
                for (String notCompleteSign : finalSigns) {
                    tempSigns.add(notCompleteSign + "_" + classScope.getClassName() + ".class");
                }

                Map<String, ClassScope> validClassNames = classScope.getExtendedClasses();
                for (String notCompleteSign : finalSigns) {
                    for (Map.Entry<String, ClassScope> entry : validClassNames.entrySet()) {
                        tempSigns.add(notCompleteSign + "_" + entry.getKey() + ".class");
                    }
                }
            } else {
                for (String notCompleteSign : finalSigns) {
                    tempSigns.add(notCompleteSign + "_" + paramType);
                }
            }
            finalSigns = new ArrayList<>(tempSigns);
        }
        return finalSigns;
    }

    /**
     * It makes a list of function signiture.
     *
     * @param funcName funcName
     *
     * @param params params
     *
     * @param checker checker
     * @return ArrayList list of valid function signatures
     */
    public static ArrayList<String> makeValidFuncSignature(
        String funcName, NQJExprList params, ExprChecker checker) {
        ArrayList<String> finalSigns = new ArrayList<>();
        finalSigns.add(funcName);
        for (NQJExpr param : params) {
            List<String> tempSigns = new ArrayList<>();
            Type paramType = checker.check(param);
            if (paramType instanceof ClassType) {
                ClassScope classScope = ((ClassType) paramType).getClassScope();
                for (String notCompleteSign : finalSigns) {
                    tempSigns.add(notCompleteSign + "_" + classScope.getClassName() + ".class");
                }

                Map<String, ClassScope> validClasseNames = classScope.getExtendedClasses();
                for (String notCompleteSign : finalSigns) {
                    for (Map.Entry<String, ClassScope> entry : validClasseNames.entrySet()) {
                        tempSigns.add(notCompleteSign + "_" + entry.getKey() + ".class");
                    }
                }
            } else {
                for (String notCompleteSign : finalSigns) {
                    tempSigns.add(notCompleteSign + "_" + paramType);
                }
            }
            finalSigns = new ArrayList<>(tempSigns);
        }
        return finalSigns;
    }

    /**
     * It matchs the extended expression and find the extended class.
     *
     * @param extended extended
     * @return NQJExtendsClass
     */
    public static NQJExtendsClass matchExtendedClass(NQJExtended extended) {

        NQJExtendsClass extendedClass =
                extended.match(
                        new NQJExtended.Matcher<NQJExtendsClass>() {

                            @Override
                            public NQJExtendsClass 
                                case_ExtendsNothing(NQJExtendsNothing extendsNothing) {
                                return null;
                            }

                            @Override
                            public NQJExtendsClass 
                                case_ExtendsClass(NQJExtendsClass extendsClass) {
                                return extendsClass;
                            }
                        });
        return extendedClass;
    }

    /**
     * It matches type and return corresponding type for it.
     *
     * @param type type
     *
     * @param nameTable nameTable
     * @return Type
     */
    public static Type matchType(NQJType type, NameTable nameTable) {
        Type resultType =
                type.match(
                        new NQJType.Matcher<>() {

                            @Override
                            public Type case_TypeBool(NQJTypeBool typeBool) {
                                return PrimativeTypes.BOOL;
                            }

                            @Override
                            public Type case_TypeClass(NQJTypeClass typeClass) {
                                return nameTable.getClassType(typeClass.getName());
                            }

                            @Override
                            public Type case_TypeArray(NQJTypeArray typeArray) {
                                return nameTable.getArrayType(
                                        matchType(typeArray.getComponentType(), nameTable));
                            }

                            @Override
                            public Type case_TypeInt(NQJTypeInt typeInt) {
                                return PrimativeTypes.INT;
                            }
                        });
        return resultType;
    }
}
