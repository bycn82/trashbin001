package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class MethodDeclaration extends CodeDocument{
	public Modifiers modifiers;
	public void setModifiers(Modifiers t){
		this.modifiers=t;
	}
	public TypeParameters typeparameters;
	public void setTypeParameters(TypeParameters t){
		this.typeparameters=t;
	}
	public String identifierStr;
	public void setIDENTIFIER(String t){
		this.identifierStr=t;
	}
	public FormalParameters formalparameters;
	public void setFormalParameters(FormalParameters t){
		this.formalparameters=t;
	}
	public QualifiedNameList qualifiednamelist;
	public void setQualifiedNameList(QualifiedNameList t){
		this.qualifiednamelist=t;
	}
	public ExplicitConstructorInvocation explicitconstructorinvocation;
	public void setExplicitConstructorInvocation(ExplicitConstructorInvocation t){
		this.explicitconstructorinvocation=t;
	}
	public List<BlockStatement> blockstatements=new ArrayList<BlockStatement>();
	public void addBlockStatement(BlockStatement t){
		this.blockstatements.add(t);
	}
	public ReturnType returntype;
	public void setReturnType(ReturnType t){
		this.returntype=t;
	}
	public List<String> bracketss=new ArrayList<String>();
	public void addBRACKETS(String t){
		this.bracketss.add(t);
	}
	public BlockOrSemi blockorsemi;
	public void setBlockOrSemi(BlockOrSemi t){
		this.blockorsemi=t;
	}
	public void visit(){
		if(coz==0){
			//"modifiers typeParameters? IDENTIFIER formalParameters ('throws' qualifiedNameList)? '{' explicitConstructorInvocation? blockStatement* '}'";
			String qualifiedNameList=this.qualifiednamelist.toString();
			for(String symbol:qualifiedNameList.split(",")){
				source.addSymbols(symbol);
			}
			//
			format("%s %s %s %s",this.modifiers,this.typeparameters,this.identifierStr,this.formalparameters);
			add("throws %s",qualifiedNameList);
			add("{");
			add(this.explicitconstructorinvocation);
			adds(this.blockstatements);
			add("}");
		}
		if(coz==1){
			//"modifiers typeParameters? returnType IDENTIFIER formalParameters BRACKETS* ('throws' qualifiedNameList)? blockOrSemi";
			String qualifiedNameList=null;
			if(this.qualifiednamelist!=null){
				qualifiedNameList=this.qualifiednamelist.toString();
				for(String symbol:qualifiedNameList.split(",")){
					source.addSymbols(symbol);
				}
			}
			//
			format("%s %s %s %s %s",this.modifiers,this.typeparameters,this.returntype,this.identifierStr,
				this.formalparameters);
			adds(this.bracketss);
			add("throws %s",qualifiedNameList);
			add(this.blockorsemi);
		}
	}
}
