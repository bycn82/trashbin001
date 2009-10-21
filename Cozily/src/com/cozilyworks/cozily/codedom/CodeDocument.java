package com.cozilyworks.cozily.codedom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.cozilyworks.cozily.util.StringUtil;
import com.cozilyworks.cozily.util.StringUtilPlus;

@SuppressWarnings("unchecked")
public class CodeDocument{
	public boolean developing=true;
	public int coz=0;
	protected StringBuilder sb=new StringBuilder();
	public void visit(){
	}
	public String toString(){
		visit();
		return ctrlOutput();
	}
	public void add(Object obj){
		if(obj!=null){
			sb.append(obj.toString());
		}
	}
	public void adds(List objs){
		if(objs!=null){
			for(int i=0;i<objs.size();i++){
				add(objs.get(i));
			}
		}
	}
	public void format(String formatStr,Object... args){
		int size=args.length;
		for(int i=0;i<size;i++){
			if(args[i]==null){
				args[i]="";
			}
		}
		add(String.format(formatStr,args));
	}
	public void formats(String formatStr,List... lists){
		if(lists!=null){
			int size=lists[0].size();
			for(int i=0;i<size;i++){
				List args=new ArrayList();
				for(List ls:lists){
					args.add(ls.get(i));
				}
				add(String.format(formatStr,args.toArray()));
			}
		}
	}
	private String ctrlOutput(){
		if(sb.length()==0){
			if(developing){
				return "["+this.getClass().getSimpleName()+"]";
			}else{
				return " ";
			}
		}else{
			return sb.toString();
		}
	}
	public void debug(Object obj){
		System.err.print("[DEBUG:]"+this.getClass().getSimpleName()+(obj!=null?obj.toString(): "null"));
	}
}