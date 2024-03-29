package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class FileDeclaration extends CodeDocument{
	public Annotations annotations;
	public void setAnnotations(Annotations t){
		this.annotations=t;
	}
	public PackageDeclaration packagedeclaration;
	public void setPackageDeclaration(PackageDeclaration t){
		this.packagedeclaration=t;
	}
	public List<ImportDeclaration> importdeclarations=new ArrayList<ImportDeclaration>();
	public void addImportDeclaration(ImportDeclaration t){
		this.importdeclarations.add(t);
	}
	public List<TypeDeclaration> typedeclarations=new ArrayList<TypeDeclaration>();
	public void addTypeDeclaration(TypeDeclaration t){
		this.typedeclarations.add(t);
	}
	public void visit(){
		if(coz==0){
			//"(annotations? packageDeclaration)? importDeclaration* typeDeclaration*";
			format("%s %s",this.annotations,this.packagedeclaration);
			adds(this.importdeclarations);
			adds(this.typedeclarations);
		}
	}
}
