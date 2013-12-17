package com.omartech.tdg.utils;

public class FinanceType {

	public final static int Order = 1; //普通的订单
	public final static int Translation = 2;//普通翻译
	public final static int Store = 3;//支付仓库钱
	public final static int Service = 4; //支付服务钱
	public final static int LastUnPaid = 5;//上期余款
	public final static int Other = 6;//其他项，用于临时增加的；主要是手工项
	
	
	/**
	 * 订单类
	 */
	public final static int Normal = 11; //普通的订单
	public final static int Claim = 12; //投诉相关的结款
	public final static int Return = 13; //退款
	
	/**
	 * 翻译类
	 */
	public final static int FirstTranslation = 21;//重新翻译
	public final static int ReTranslation = 22;//重新翻译
	
	/**
	 * 服务钱
	 */
	public final static int ServiceNormal = 41;//正常服务费
	public final static int ServiceBack = 42;//服务费退款
}
