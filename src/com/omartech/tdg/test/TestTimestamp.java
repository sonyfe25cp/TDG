package com.omartech.tdg.test;

import java.util.Calendar;
import java.util.Date;

public class TestTimestamp {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Calendar beg = Calendar.getInstance();
		
		Date begin = beg.getTime();
		System.out.println("begin: "+ begin);
		
		int number = beg.get(Calendar.DAY_OF_WEEK);
		System.out.println(number);

		beg.set(Calendar.DATE, beg.get(Calendar.DATE) - 3);
		beg.set(Calendar.HOUR_OF_DAY, 0);
		beg.set(Calendar.MINUTE, 0);
		beg.set(Calendar.SECOND, 0);
		beg.set(Calendar.MILLISECOND, 0);
		
		
		begin = beg.getTime();
		System.out.println("begin: "+ begin);
		
		
		
		
	}

}
