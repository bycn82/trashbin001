package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class QualifiedNameList extends CodeDocument{
	public QualifiedName qualifiedname;
	public void setQualifiedName(QualifiedName t){
		this.qualifiedname=t;
	}
	public List<QualifiedName> qualifiednames=new ArrayList<QualifiedName>();
	public void addQualifiedName(QualifiedName t){
		this.qualifiednames.add(t);
	}
	public void visit(){
		if(coz==0){
			//"qualifiedName (',' qualifiedName)*";
			add(this.qualifiedname);
			adds(",%s",this.qualifiednames);
		}
	}
}
