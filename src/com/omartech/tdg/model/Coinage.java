package com.omartech.tdg.model;

public class Coinage {
	
	public static final int Dollar = 1;//美元
	public static final int Pound = 2;//英镑
	public static final int EURO = 3;//欧元
	public static final int JPY = 4;//日元
	public static final int RMB = 5;//人民币
	
	public static float DollarToRMB(float dollar){
		return (float) (dollar * 6.5);
	}
	public static float PoundToRMB(float pound){
		return (float) (pound * 9.5);
	}
	public static float EuroToRMB(float euro){
		return (float) (euro * 8.5);
	}
	public static float JPYtoRMB(float jpy){
		return (float) (jpy * 0.06);
	}
}
