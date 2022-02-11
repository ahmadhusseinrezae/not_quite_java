package translation;

import static minillvm.ast.Ast.*;

import minillvm.ast.Ast;
import minillvm.ast.BasicBlock;
import minillvm.ast.Operand;
import minillvm.ast.Parameter;
import minillvm.ast.TemporaryVar;
import minillvm.ast.VarRef;
import notquitejava.ast.*;

/** Evaluate L values. */
public class ExprLValue implements NQJExprL.Matcher<Operand> {
    private final Translator tr;

    public ExprLValue(Translator translator) {
        this.tr = translator;
    }

    @Override
    public Operand case_ArrayLookup(NQJArrayLookup e) {
        Operand arrayAddr = tr.exprRvalue(e.getArrayExpr());
        tr.addNullcheck(arrayAddr, "Nullpointer exception in line " + tr.sourceLine(e));

        Operand index = tr.exprRvalue(e.getArrayIndex());

        Operand len = tr.getArrayLen(arrayAddr);
        TemporaryVar smallerZero = Ast.TemporaryVar("smallerZero");
        TemporaryVar lenMinusOne = Ast.TemporaryVar("lenMinusOne");
        TemporaryVar greaterEqualLen = Ast.TemporaryVar("greaterEqualLen");
        TemporaryVar outOfBoundsV = Ast.TemporaryVar("outOfBounds");
        final BasicBlock outOfBounds = tr.newBasicBlock("outOfBounds");
        final BasicBlock indexInRange = tr.newBasicBlock("indexInRange");

        // smallerZero = index < 0
        tr.addInstruction(BinaryOperation(smallerZero, index, Slt(), Ast.ConstInt(0)));
        // lenMinusOne = length - 1
        tr.addInstruction(BinaryOperation(lenMinusOne, len, Sub(), Ast.ConstInt(1)));
        // greaterEqualLen = lenMinusOne < index
        tr.addInstruction(BinaryOperation(greaterEqualLen, VarRef(lenMinusOne), Slt(), index.copy()));
        // outOfBoundsV = smallerZero || greaterEqualLen
        tr.addInstruction(
                BinaryOperation(outOfBoundsV, VarRef(smallerZero), Or(), VarRef(greaterEqualLen)));

        tr.getCurrentBlock().add(Ast.Branch(VarRef(outOfBoundsV), outOfBounds, indexInRange));

        tr.addBasicBlock(outOfBounds);
        outOfBounds.add(Ast.HaltWithError("Index out of bounds error in line " + tr.sourceLine(e)));

        tr.addBasicBlock(indexInRange);
        tr.setCurrentBlock(indexInRange);
        TemporaryVar indexAddr = Ast.TemporaryVar("indexAddr");
        tr.addInstruction(
                Ast.GetElementPtr(
                        indexAddr, arrayAddr, Ast.OperandList(Ast.ConstInt(0), Ast.ConstInt(1), index.copy())));
        return VarRef(indexAddr);
    }

    @Override
    public Operand case_FieldAccess(NQJFieldAccess e) {
        NQJVarDecl varDecl = e.getVariableDeclaration();
        // global TempVar -> first we find the index of field in class, then get the pointer to this
        // object, then find address of that index from this object, then save it and return the ref to
        // that address
        int fieldIndex = tr.getCurrentClass().getClassField(varDecl);
        // we assume checking that says var decl must exist in class decl has been done in Analyze part
        Parameter thisObject = tr.getThisParameter();

        TemporaryVar iAddr = TemporaryVar("iAddr");
        tr.addInstruction(
                GetElementPtr(iAddr, VarRef(thisObject), OperandList(ConstInt(0), ConstInt(fieldIndex))));
        return VarRef(iAddr);
    }

    @Override
    public Operand case_VarUse(NQJVarUse e) {
        NQJVarDecl varDecl = e.getVariableDeclaration();
        if (tr.getLocalVarLocation(varDecl) != null) { // Local Var
            return VarRef(tr.getLocalVarLocation(varDecl));
        } else { // global Var
            int fieldIndex = tr.getCurrentClass().getClassField(e.getVariableDeclaration());
            Parameter thisObject = tr.getThisParameter();
            TemporaryVar iAddr = TemporaryVar("iAddr");
            tr.addInstruction(
                    GetElementPtr(iAddr, VarRef(thisObject), OperandList(ConstInt(0), ConstInt(fieldIndex))));
            return VarRef(iAddr);
        }
    }
}
