package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class InterfaceBody extends CodeDocument{
	public List<InterfaceBodyDeclaration> interfacebodydeclarations=new ArrayList<InterfaceBodyDeclaration>();
	public void addInterfaceBodyDeclaration(InterfaceBodyDeclaration t){
		this.interfacebodydeclarations.add(t);
	}
	public void visit(){
		if(coz==0){
			//"'{' interfaceBodyDeclaration* '}'";
			add("{");
			adds(this.interfacebodydeclarations);
			add("}");
		}
	}
}
