package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class ClassDeclaration extends CodeDocument{
	public NormalClassDeclaration normalclassdeclaration;
	public void setNormalClassDeclaration(NormalClassDeclaration t){
		this.normalclassdeclaration=t;
	}
	public EnumDeclaration enumdeclaration;
	public void setEnumDeclaration(EnumDeclaration t){
		this.enumdeclaration=t;
	}
	public void visit(){
		if(coz==0){
			//"normalClassDeclaration";
			add(normalclassdeclaration);
		}
		if(coz==1){
			//"enumDeclaration";
			add(enumdeclaration);
		}
	}
}
