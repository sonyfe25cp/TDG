package com.omartech.tdg.utils;

public class SystemDefaultSettings {

	public static final String DEFAULTPRODUCTIMAGE = "/img/product_default.jpg";
	
	public static final String sytstemName = "TDG trade system";
	
	public static final String systemURL = "http://tdg.omartech.com";
	
	public static final int SystemSafeStock = 2; //系统的安全库存，低于该数字则自动停售
	
	public static final String TDGSpliter = ";";
	
	public static final int SellerObserveTime = 2; //自动关闭订单的时间间隔--商户观测期
	
	public static final int CustomerObserveTime = 1;//无条件退款时间--买家观测期
	
	public static final int MoneyPerSizeOfStore = 2;//美元
}
