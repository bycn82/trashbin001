package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class Selector extends CodeDocument{
private String identifierStr;
public void setIDENTIFIER(String t){
this.identifierStr=t;
}
private Arguments arguments;
public void setArguments(Arguments t){
this.arguments=t;
}
private SuperSuffix supersuffix;
public void setSuperSuffix(SuperSuffix t){
this.supersuffix=t;
}
private InnerCreator innercreator;
public void setInnerCreator(InnerCreator t){
this.innercreator=t;
}
private Expression expression;
public void setExpression(Expression t){
this.expression=t;
}
}
