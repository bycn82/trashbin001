package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class VariableModifiers extends CodeDocument{
private List<VariableModifier> variablemodifiers=new ArrayList<VariableModifier>();
public void addVariableModifier(VariableModifier t){
this.variablemodifiers.add(t);
if(multi.get("variablemodifier")==null){multi.put("variablemodifier",variablemodifiers);}
}
public void visit(){
if(coz==0){
format="variableModifier*";
}
}
}