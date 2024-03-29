package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class TypeArguments extends CodeDocument{
	public TypeArgument typeargument;
	public void setTypeArgument(TypeArgument t){
		this.typeargument=t;
	}
	public List<TypeArgument> typearguments=new ArrayList<TypeArgument>();
	public void addTypeArgument(TypeArgument t){
		this.typearguments.add(t);
	}
	public void visit(){
		if(coz==0){
			//"'<' typeArgument (',' typeArgument)* '>'";
			add("<");
			add(this.typeargument);
			adds(", %s",this.typearguments);
			add(">");
		}
	}
}
