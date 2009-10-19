package com.cozilyworks.cozily.util;
public class StringUtilPlus{
	public static String ucword(String str){
		String begin=str.substring(0,1);
		String end=str.substring(1);
		return begin.toUpperCase()+end;
	}
	public static String getSuffixInt(String now){
		for(int i=0;i<now.length();i++){
			char c=now.charAt(now.length()-i-1);
			if(StringUtil.isUpperCase(c)){
				return now.substring(now.length()-i);
			}
		}
		return null;
	}
	public static String setOrGetDependsOnNextOneOrTwoChar(int pos,String rule){
		String next=getNextOneChar(pos,rule);
		if(next!=null){
			if(next.equals("+")||next.equals("*")){
				return "add";
			}else{
				if(next.equals(")")){
					next=getNextOneChar(pos+1,rule);
					if(next!=null){
						if(next.equals("+")||next.equals("*")){
							return "add";
						}
					}
				}
			}
		}
		return "set";
	}
	public static String getNextOneChar(int pos,String rule){
		if(rule.length()>pos){
			String next=rule.substring(pos,pos+1);
			if(next.equals(" ")){
				return getNextOneChar(pos+1,rule);
			}else{
				return next;
			}
		}
		return null;
	}
	public static String clean(String tree){
		if(tree.indexOf("'")!=-1){
			int x=tree.indexOf("'");
			String left=tree.substring(0,x);
			String right=tree.substring(x+1);
			int y=right.indexOf("'");
			if(right.length()>=y+1){
				right=right.substring(y+1);
			}else{
				right="";
			}
			return left+clean(right);
		}else{
			return tree;
		}
	}
	public static String setOrAdd(int start,String rule){
		String c=getNextOneChar(start,rule);
		if(c==null){
			// the end
			return "set";
		}else if(c.equals("*")||c.equals("+")){
			return "add";
		}else{
			boolean complexAdd=checkRparens(start,rule);
			if(complexAdd){
				return "add";
			}
			return "set";
		}
	}
	private static boolean checkRparens(int start,String rule){
		int n=0;
		for(int i=start;i<rule.length();i++){
			String c=rule.substring(i,i+1);
			if(c.equals("(")){
				n--;
			}
			if(c.equals(")")){
				n++;
			}
			if(n>0){
				String tmp=getNextOneChar(i,rule);
				if(tmp.equals("+") || tmp.equals("*")){
					return true;
				}
			}
		}

		return false;
	}
	public static void main(String[] args){
		System.out.println(setOrAdd(3,"(ab  (abc) (ok))+"));
	}
}
