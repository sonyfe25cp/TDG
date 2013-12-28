package com.omartech.tdg.test;

public class TestSubString {

	
	public static void main(String[] args){
		String str = "/Users/omar/workspace/mavenworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TDG/WEB-INF/uploads/images/1374550150201.jpg";
		String res = str.substring(str.indexOf("/uploads"));
		System.out.println(res);
		
		String str2  = "1*2*3";
		String[] nums = str2.split("\\*");
		float aaa = 1;
		for(String tmp : nums){
			float num = Float.parseFloat(tmp);
			aaa *= num;
		}
		System.out.println(aaa);
			
	}
	
}
