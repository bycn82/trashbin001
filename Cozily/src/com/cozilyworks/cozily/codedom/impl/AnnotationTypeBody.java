package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class AnnotationTypeBody extends CodeDocument{
	public List<AnnotationTypeElementDeclaration> annotationtypeelementdeclarations=new ArrayList<AnnotationTypeElementDeclaration>();
	public void addAnnotationTypeElementDeclaration(AnnotationTypeElementDeclaration t){
		this.annotationtypeelementdeclarations.add(t);
	}
	public void visit(){
		if(coz==0){
			//"'{' annotationTypeElementDeclaration* '}'";
			adds("{ %s }",this.annotationtypeelementdeclarations);
		}
	}
}
