package com.omartech.tdg.model;

public class ShopSetting {
	
	private int id;
	private int sellerId;
	
	private String shippingCountry;
	private int shippingPromiseDays;
	private String description;
	private String descriptionInChinese;
	
	private int defaultCoinage;//默认币制

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getShippingCountry() {
		return shippingCountry;
	}
	public void setShippingCountry(String shippingCountry) {
		this.shippingCountry = shippingCountry;
	}
	public int getShippingPromiseDays() {
		return shippingPromiseDays;
	}
	public void setShippingPromiseDays(int shippingPromiseDays) {
		this.shippingPromiseDays = shippingPromiseDays;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescriptionInChinese() {
		return descriptionInChinese;
	}
	public void setDescriptionInChinese(String descriptionInChinese) {
		this.descriptionInChinese = descriptionInChinese;
	}
	public int getDefaultCoinage() {
		return defaultCoinage;
	}
	public void setDefaultCoinage(int defaultCoinage) {
		this.defaultCoinage = defaultCoinage;
	}
	
}
