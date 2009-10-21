package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class Modifier extends CodeDocument{
private Annotation annotation;
public void setAnnotation(Annotation t){
this.annotation=t;
}
private String publicStr;
public void setPUBLIC(String t){
this.publicStr=t;
}
private String protectedStr;
public void setPROTECTED(String t){
this.protectedStr=t;
}
private String privateStr;
public void setPRIVATE(String t){
this.privateStr=t;
}
private String staticStr;
public void setSTATIC(String t){
this.staticStr=t;
}
private String abstractStr;
public void setABSTRACT(String t){
this.abstractStr=t;
}
private String finalStr;
public void setFINAL(String t){
this.finalStr=t;
}
private String nativeStr;
public void setNATIVE(String t){
this.nativeStr=t;
}
private String synchronizedStr;
public void setSYNCHRONIZED(String t){
this.synchronizedStr=t;
}
private String transientStr;
public void setTRANSIENT(String t){
this.transientStr=t;
}
private String volatileStr;
public void setVOLATILE(String t){
this.volatileStr=t;
}
private String strictfpStr;
public void setSTRICTFP(String t){
this.strictfpStr=t;
}
public void visit(){
if(coz==0){
//"annotation";
}
if(coz==1){
//"PUBLIC";
}
if(coz==2){
//"PROTECTED";
}
if(coz==3){
//"PRIVATE";
}
if(coz==4){
//"STATIC";
}
if(coz==5){
//"ABSTRACT";
}
if(coz==6){
//"FINAL";
}
if(coz==7){
//"NATIVE";
}
if(coz==8){
//"SYNCHRONIZED";
}
if(coz==9){
//"TRANSIENT";
}
if(coz==10){
//"VOLATILE";
}
if(coz==11){
//"STRICTFP";
}
}
}