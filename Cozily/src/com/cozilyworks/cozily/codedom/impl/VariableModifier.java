package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class VariableModifier extends CodeDocument{
private Annotation annotation;
public void setAnnotation(Annotation t){
this.annotation=t;
}
private String finalStr;
public void setFINAL(String t){
this.finalStr=t;
}
}
