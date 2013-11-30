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
	}

}
