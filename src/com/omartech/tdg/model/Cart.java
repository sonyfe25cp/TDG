package com.omartech.tdg.model;
/*
 * 购物车，存cookie
 */
public class Cart {
	
	private int skuID;//item id
	private int number;
	
	public int getSkuID() {
		return skuID;
	}
	public void setSkuID(int skuID) {
		this.skuID = skuID;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}

	
}
