package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class ParExpression extends CodeDocument{
	public Expression expression;
	public void setExpression(Expression t){
		this.expression=t;
	}
	public void visit(){
		if(coz==0){
			//"'(' expression ')'";
			format("( %s )",this.expression);
		}
	}
}
