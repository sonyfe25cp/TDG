package com.omartech.tdg.model;

public class Coinage {
	
	public static final int Dollar = 1;//美元
	public static final int Pound = 2;//英镑
	public static final int EURO = 3;//欧元
	public static final int JPY = 4;//日元
	public static final int RMB = 5;//人民币
	
	public final static float compute(int coinageId, float price){
		switch(coinageId){
		case Dollar:
			return DollarToRMB(price);
		case Pound:
			return PoundToRMB(price);
		case EURO:
			return EuroToRMB(price);
		case JPY:
			return JPYtoRMB(price);
		case RMB:
			return price;
		default:
			return price;
		}
	}
	public final static float computeToOthers(int coinageId, float priceInRMB){
		switch(coinageId){
		case Dollar:
			return RMBToDollar(priceInRMB);
		case Pound:
			return RMBToPound(priceInRMB);
		case EURO:
			return RMBToEuro(priceInRMB);
		case JPY:
			return RMBToJPY(priceInRMB);
		case RMB:
			return priceInRMB;
		default:
			return priceInRMB;
		}
	}
	
	public static float convertToAimCoinage(int aimCoinage, float money, int sourceCoinage){
		float moneyInRMB = compute(sourceCoinage, money);
		float moneyInAim = computeToOthers(aimCoinage, moneyInRMB);
		return moneyInAim;
	}
	
	
	
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
	
	public static float RMBToDollar(float rmb){
		return (float) (rmb / 6.5f);
	}
	public static float RMBToPound(float rmb){
		return (float) (rmb / 9.5f);
	}
	public static float RMBToEuro(float rmb){
		return (float) (rmb / 8.5f);
	}
	public static float RMBToJPY(float rmb){
		return (float) (rmb / 0.06f);
	}
}
