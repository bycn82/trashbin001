package com.cozilyworks.cozily.codedom.impl;

import java.util.ArrayList;
import java.util.List;
import com.cozilyworks.cozily.codedom.*;

public class ShiftOp extends CodeDocument{
	public void visit(){
		if(coz==0){
			//"'<' '<'";
			add("<<");
		}
		if(coz==1){
			//"'>' '>' '>'";
			add(">>>");
		}
		if(coz==2){
			//"'>' '>'";
			add(">>");
		}
	}
}
