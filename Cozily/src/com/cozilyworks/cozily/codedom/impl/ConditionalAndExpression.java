package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class ConditionalAndExpression extends CodeDocument{
private InclusiveOrExpression inclusiveorexpression;
public void setInclusiveOrExpression(InclusiveOrExpression t){
this.inclusiveorexpression=t;
if(single.get("inclusiveorexpression")==null){single.put("inclusiveorexpression",inclusiveorexpression);}
}
private List<InclusiveOrExpression> inclusiveorexpressions=new ArrayList<InclusiveOrExpression>();
public void addInclusiveOrExpression(InclusiveOrExpression t){
this.inclusiveorexpressions.add(t);
if(multi.get("inclusiveorexpression")==null){multi.put("inclusiveorexpression",inclusiveorexpressions);}
}
public void visit(){
if(coz==0){
format="inclusiveOrExpression ('&&' inclusiveOrExpression)*";
}
}
}
