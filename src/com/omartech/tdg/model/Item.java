package com.omartech.tdg.model;


import java.util.Date;
import java.util.Map;

public class Item {
	
	private int id;//字增id
	private String name;
	private String nameInChinese;
	private int sku;//sku，默认与id相同，也可自己修改
	private String featureJson;//{11001:12312;11002:1232,212312;}
	private Map<String,String> params;
	private Map<String,String> paramsInEnglish;
	
	private String image;//单品图
	private int productId;//商品号
	private int categoryId;//类别号
	private int coinage;
	private int sellerId;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameInChinese() {
		return nameInChinese;
	}
	public void setNameInChinese(String nameInChinese) {
		this.nameInChinese = nameInChinese;
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
	public Map<String, String> getParams() {
		return params;
	}
	public void setParams(Map<String, String> params) {
		this.params = params;
	}
	public Map<String, String> getParamsInEnglish() {
		return paramsInEnglish;
	}
	public void setParamsInEnglish(Map<String, String> paramsInEnglish) {
		this.paramsInEnglish = paramsInEnglish;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getCoinage() {
		return coinage;
	}
	public void setCoinage(int coinage) {
		this.coinage = coinage;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
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
