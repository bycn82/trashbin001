package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class FormalParameterDecls extends CodeDocument{
	public EllipsisParameterDecl ellipsisparameterdecl;
	public void setEllipsisParameterDecl(EllipsisParameterDecl t){
		this.ellipsisparameterdecl=t;
	}
	public NormalParameterDecl normalparameterdecl;
	public void setNormalParameterDecl(NormalParameterDecl t){
		this.normalparameterdecl=t;
	}
	public List<NormalParameterDecl> normalparameterdecls=new ArrayList<NormalParameterDecl>();
	public void addNormalParameterDecl(NormalParameterDecl t){
		this.normalparameterdecls.add(t);
	}
	public void visit(){
		if(coz==0){
			//"ellipsisParameterDecl";
			add(ellipsisparameterdecl);
		}
		if(coz==1){
			//"normalParameterDecl (',' normalParameterDecl)*";
			add(this.normalparameterdecl);
			adds(", %s",this.normalparameterdecls);
		}
		if(coz==2){
			//"(normalParameterDecl ',')+ ellipsisParameterDecl";
			adds("%s ,",this.normalparameterdecls);
			add(this.ellipsisparameterdecl);
		}
	}
}
