package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class ThisOrSuper extends CodeDocument{
private String thisStr;
public void setTHIS(String t){
this.thisStr=t;
}
private String superStr;
public void setSUPER(String t){
this.superStr=t;
}
}