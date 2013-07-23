package com.omartech.tdg.test;

public class TestSubString {

	
	public static void main(String[] args){
		String str = "/Users/omar/workspace/mavenworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TDG/WEB-INF/uploads/images/1374550150201.jpg";
		String res = str.substring(str.indexOf("/uploads"));
		System.out.println(res);
	}
	
}
