package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class Arguments extends CodeDocument{
	public ExpressionList expressionlist;
	public void setExpressionList(ExpressionList t){
		this.expressionlist=t;
	}
	public void visit(){
		if(coz==0){
			//"'(' expressionList? ')'";
			format("( %s )",this.expressionlist);
		}
	}
}
