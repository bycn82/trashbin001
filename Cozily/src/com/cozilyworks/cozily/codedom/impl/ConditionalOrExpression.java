package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class ConditionalOrExpression extends CodeDocument{
	public ConditionalAndExpression conditionalandexpression;
	public void setConditionalAndExpression(ConditionalAndExpression t){
		this.conditionalandexpression=t;
	}
	public List<ConditionalAndExpression> conditionalandexpressions=new ArrayList<ConditionalAndExpression>();
	public void addConditionalAndExpression(ConditionalAndExpression t){
		this.conditionalandexpressions.add(t);
	}
	public void visit(){
		if(coz==0){
			//"conditionalAndExpression ('||' conditionalAndExpression)*";
			add(this.conditionalandexpression);
			formats("|| %s",this.conditionalandexpressions);
		}
	}
}
