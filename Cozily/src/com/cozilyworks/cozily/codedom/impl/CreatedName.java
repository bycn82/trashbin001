package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class CreatedName extends CodeDocument{
private ClassOrInterfaceType classorinterfacetype;
public void setClassOrInterfaceType(ClassOrInterfaceType t){
this.classorinterfacetype=t;
}
private PrimitiveType primitivetype;
public void setPrimitiveType(PrimitiveType t){
this.primitivetype=t;
}
}
