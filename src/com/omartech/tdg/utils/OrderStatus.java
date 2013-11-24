package com.omartech.tdg.utils;

public class OrderStatus {

	public final static int AUTO = 8;//留货订单
	public final static int NOPAY = 1;//未付款新订单
	public final static int PAID = 2;//已付款
	public final static int SEND = 3;//卖家已发货
	public final static int RECEIVE = 4;//买家已签收
	public final static int CUT = 5;//订单被拆分
	public final static int RETURN = 6;//订单申请退货
	public final static int ERROR = 7;//订单异常
	public final static int CANCEL = 9;//订单被客户取消
	public final static int CANCELBYSELLER = 11;//订单被商家取消
	public final static int COMPLAIN = 10;//投诉订单
	public final static int CLOSE = 12;//订单结束
//	public final static int NEW = 0;
//	public final static int NEW = 0;
	
	
	
	public static int statusToInt(String status){
		if(status.equals("nopay")){
			return 1;
		}else if(status.equals("paid")){
			return 2;
		}else if(status.equals("send")){
			return 3;
		}else if(status.equals("receive")){
			return 4;
		}else if(status.equals("cut")){
			return 5;
		}else if(status.equals("return")){
			return 6;
		}else if(status.equals("error")){
			return 7;
		}else if(status.equals("auto")){
			return 8;
		}else if(status.equals("cancel")){
			return 9;
		}else if(status.equals("complain")){
			return 10;
		}else if(status.equals("all")){
			return 0;
		}else if(status.equals("cancelbyseller")){
			return 11;
		}else if(status.equals("close")){
			return 12;
		}else{
			return 0;
		}
	}
	
}
