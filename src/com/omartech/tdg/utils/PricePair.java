package com.omartech.tdg.utils;

public class PricePair {
	
	private float price;
	private float priceRMB;
	
	public PricePair(float price, float priceRMB) {
		super();
		this.price = price;
		this.priceRMB = priceRMB;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPriceRMB() {
		return priceRMB;
	}
	public void setPriceRMB(float priceRMB) {
		this.priceRMB = priceRMB;
	}
	
	

}
