package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class RelationalExpression extends CodeDocument{
	public ShiftExpression shiftexpression;
	public void setShiftExpression(ShiftExpression t){
		this.shiftexpression=t;
	}
	public List<RelationalOp> relationalops=new ArrayList<RelationalOp>();
	public void addRelationalOp(RelationalOp t){
		this.relationalops.add(t);
	}
	public List<ShiftExpression> shiftexpressions=new ArrayList<ShiftExpression>();
	public void addShiftExpression(ShiftExpression t){
		this.shiftexpressions.add(t);
	}
	public void visit(){
		if(coz==0){
			//"shiftExpression (relationalOp shiftExpression)*";
			add(this.shiftexpression);
			formats("%s %s",this.relationalops,this.shiftexpressions);
		}
	}
}
