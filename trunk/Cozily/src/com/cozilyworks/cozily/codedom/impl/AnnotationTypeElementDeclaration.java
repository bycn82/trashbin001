package com.cozilyworks.cozily.codedom.impl;
import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;
public class AnnotationTypeElementDeclaration extends CodeDocument{
	private AnnotationMethodDeclaration annotationmethoddeclaration;
	public void setAnnotationMethodDeclaration(AnnotationMethodDeclaration t){
		this.annotationmethoddeclaration=t;
	}
	private InterfaceFieldDeclaration interfacefielddeclaration;
	public void setInterfaceFieldDeclaration(InterfaceFieldDeclaration t){
		this.interfacefielddeclaration=t;
	}
	private NormalClassDeclaration normalclassdeclaration;
	public void setNormalClassDeclaration(NormalClassDeclaration t){
		this.normalclassdeclaration=t;
	}
	private NormalInterfaceDeclaration normalinterfacedeclaration;
	public void setNormalInterfaceDeclaration(NormalInterfaceDeclaration t){
		this.normalinterfacedeclaration=t;
	}
	private EnumDeclaration enumdeclaration;
	public void setEnumDeclaration(EnumDeclaration t){
		this.enumdeclaration=t;
	}
	private AnnotationTypeDeclaration annotationtypedeclaration;
	public void setAnnotationTypeDeclaration(AnnotationTypeDeclaration t){
		this.annotationtypedeclaration=t;
	}
	public void visit(){
		if(coz==0){
			// "annotationMethodDeclaration";
			add(annotationmethoddeclaration);
		}
		if(coz==1){
			// "interfaceFieldDeclaration";
			add(interfacefielddeclaration);
		}
		if(coz==2){
			// "normalClassDeclaration";
			add(normalclassdeclaration);
		}
		if(coz==3){
			// "normalInterfaceDeclaration";
			add(normalinterfacedeclaration);
		}
		if(coz==4){
			// "enumDeclaration";
			add(enumdeclaration);
		}
		if(coz==5){
			// "annotationTypeDeclaration";
			add(annotationtypedeclaration);
		}
		if(coz==6){
			// "';'";
			add(";\n");
		}
	}
}
