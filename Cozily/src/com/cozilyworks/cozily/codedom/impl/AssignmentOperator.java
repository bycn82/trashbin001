package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class AssignmentOperator extends CodeDocument{
	public void visit(){
		if(coz==0){
			//"'='";
			add("=");
		}
		if(coz==1){
			//"'+='";
			add("+=");
		}
		if(coz==2){
			//"'-='";
			add("-=");
		}
		if(coz==3){
			//"'*='";
			add("*=");
		}
		if(coz==4){
			//"'/='";
			add("/=");
		}
		if(coz==5){
			//"'&='";
			add("&=");
		}
		if(coz==6){
			//"'|='";
			add("|=");
		}
		if(coz==7){
			//"'^='";
			add("^=");
		}
		if(coz==8){
			//"'%='";
			add("%=");
		}
		if(coz==9){
			//"'<' '<' '='";
			add("<<=");
		}
		if(coz==10){
			//"'>' '>' '>' '='";
			add(">>>=");
		}
		if(coz==11){
			//"'>' '>' '='";
			add(">>=");
		}
	}
}
