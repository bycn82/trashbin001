package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class InnerCreator extends CodeDocument{
	public NonWildcardTypeArguments nonwildcardtypearguments;
	public void setNonWildcardTypeArguments(NonWildcardTypeArguments t){
		this.nonwildcardtypearguments=t;
	}
	public IdentifierArgs identifierargs;
	public void setIdentifierArgs(IdentifierArgs t){
		this.identifierargs=t;
	}
	public ClassCreatorRest classcreatorrest;
	public void setClassCreatorRest(ClassCreatorRest t){
		this.classcreatorrest=t;
	}
	public void visit(){
		if(coz==0){
			//"'.' 'new' nonWildcardTypeArguments? identifierArgs classCreatorRest";
			format(".new %s %s %s",this.nonwildcardtypearguments,this.identifierargs,this.classcreatorrest);
		}
	}
}
