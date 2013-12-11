package com.omartech.tdg.utils;

public class ClaimRelation {
	/*
	 * ClaimItem类型
	 */
	public static final String Claim = "claim";
	public static final String Return = "return";
	
	/*
	 * 处理状态
	 */
	public static final int ongoing = 1; //投诉or 退货
	public static final int discard = 2;//撤销投诉 or 撤销退火
	public static final int ok = 3;//投诉解决 or 解决
	public static final int processing = 4;//处理中 or 处理中

}
