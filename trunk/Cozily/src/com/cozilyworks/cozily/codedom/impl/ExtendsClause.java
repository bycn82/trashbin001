package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class ExtendsClause extends CodeDocument{
private List<Type> types=new ArrayList<Type>();
public void addType(Type t){
this.types.add(t);
}
}