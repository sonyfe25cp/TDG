package com.omartech.tdg.model;

import java.sql.Date;

public class Item {
	
	private int id;//字增id
	
	private int sku;//sku，默认与id相同，也可自己修改
	private String featureJson;//{11001:12312;11002:1232,212312;}
	private String image;//单品图
	private int productId;//商品号
	
	/**
	 * price
	 */
	private float retailPrice;
	private float promotionPrice;
	private Date promotionTime;
	private float wholePrice;
	private int minimumQuantity;
	private int maximumAcceptQuantity;
	
	private int availableQuantity;//现库存
	private int safeStock;//安全库存
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSku() {
		return sku;
	}
	public void setSku(int sku) {
		this.sku = sku;
	}
	public String getFeatureJson() {
		return featureJson;
	}
	public void setFeatureJson(String featureJson) {
		this.featureJson = featureJson;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public float getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(float retailPrice) {
		this.retailPrice = retailPrice;
	}
	public float getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(float promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public Date getPromotionTime() {
		return promotionTime;
	}
	public void setPromotionTime(Date promotionTime) {
		this.promotionTime = promotionTime;
	}
	public float getWholePrice() {
		return wholePrice;
	}
	public void setWholePrice(float wholePrice) {
		this.wholePrice = wholePrice;
	}
	public int getMinimumQuantity() {
		return minimumQuantity;
	}
	public void setMinimumQuantity(int minimumQuantity) {
		this.minimumQuantity = minimumQuantity;
	}
	public int getMaximumAcceptQuantity() {
		return maximumAcceptQuantity;
	}
	public void setMaximumAcceptQuantity(int maximumAcceptQuantity) {
		this.maximumAcceptQuantity = maximumAcceptQuantity;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getAvailableQuantity() {
		return availableQuantity;
	}
	public void setAvailableQuantity(int availableQuantity) {
		this.availableQuantity = availableQuantity;
	}
	public int getSafeStock() {
		return safeStock;
	}
	public void setSafeStock(int safeStock) {
		this.safeStock = safeStock;
	}
}
