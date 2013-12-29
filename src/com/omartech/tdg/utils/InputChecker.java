package com.omartech.tdg.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputChecker {
	/**
	 * if email right return true;else, false;
	 * @param email
	 * @return
	 */
	public static boolean emailChecker(String email){
//		String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		String check = "^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(email);
		boolean isMatched = matcher.matches();
		return isMatched;
	}
	/**
	 * if password.length between 6 and 16, return true; else, false;
	 * @param password
	 * @return
	 */
	public static boolean passwordChecker(String password){
		if(password.length() < 6 || password.length() > 16){
			return false;
		}else{
			return true;
		}
	}
	
	public static void main(String[] args){
		String email = "ruby_mao@126.com";
		System.out.println(emailChecker(email));
	}

}
