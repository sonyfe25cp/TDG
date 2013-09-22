package com.omartech.tdg.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class TimeFormat {
	
	public static Date StringToDate(String string){
		if(string == null){
			return null;
		}
		Date date =null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static void main(String[] args){
		String str = "2013-09-11";
		Date date = StringToDate(str);
		System.out.println(date);
	}
	

}
