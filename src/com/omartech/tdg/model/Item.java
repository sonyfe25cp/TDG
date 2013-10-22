package com.omartech.tdg.model;


import java.util.Date;

import com.omartech.tdg.utils.CommonVerify;

public class Item {
	
	private int id;//字增id
	private String name;
	private String nameInChinese;
	private String sku;//sku只给卖家用的
	private String featureJson;//{11001:12312;11002:1232,212312;}
	
	private String image;//单品图
	private int productId;//商品号
	private int categoryId;//类别号
	private int coinage;
	private int sellerId;
	
	private int internationalShippingService;// 0:no, 1:yes
	private float internationalShippingFee;//国际运输费
	private float internationalPromiseDays;//承诺日期
	
	private int countryCode;
	private String shippingCountry;
	
	/**
	 * price
	 */
	private float retailPrice;
	private float promotionPrice;
	private Date promotionTime;
	private Date promotionEnd;
	private float wholePrice;
	private int minimumQuantity;
	private int maximumAcceptQuantity;
	
	private int availableQuantity;//现库存
	private int safeStock;//安全库存
	private int active;
	
	private int status;
	
	public Item() {
	}

	public Item(Product product){
		this.setSku(product.getSku());
		this.setName(product.getName());
		this.setNameInChinese(product.getNameInChinese());
		this.setRetailPrice(product.getRetailPrice());
		this.setPromotionPrice(product.getPromotionPrice());
		this.setPromotionTime(product.getPromotionTime());
		this.setPromotionEnd(product.getPromotionEnd());
		this.setWholePrice(product.getWholePrice());
		this.setMaximumAcceptQuantity(product.getMaximumAcceptQuantity());
		this.setMinimumQuantity(product.getMinimumQuantity());
		this.setAvailableQuantity(product.getAvailableQuantity());
		this.setSafeStock(product.getSafeStock());
		this.setImage(product.getMainImage());
		this.setFeatureJson("");
		this.setCoinage(product.getCoinage());
		this.setCategoryId(product.getProductTypeId());
		this.setSellerId(product.getSellerId());
		this.setProductId(product.getId());
		this.setInternationalShippingService(product.getInternationalShippingService());
		if(product.getInternationalShippingService() == 1){
			this.setInternationalPromiseDays(product.getInternationalPromiseDays());
			this.setInternationalShippingFee(product.getInternationalShippingFee());
		}
		this.setCountryCode(product.getCountryCode());
		/*
		 * 自动验证
		 */
		selfVerify();
	}
	
	public Item(int id, String name, String sku, String featureJson,
			String image, int productId, float retailPrice,
			float promotionPrice, Date promotionTime, Date promotionEnd,
			float wholePrice, int minimumQuantity, int maximumAcceptQuantity,
			int availableQuantity, int safeStock) {
		super();
		this.id = id;
		this.name = name;
		this.sku = sku;
		this.featureJson = featureJson;
		this.image = image;
		this.productId = productId;
		this.retailPrice = retailPrice;
		this.promotionPrice = promotionPrice;
		this.promotionTime = promotionTime;
		this.promotionEnd = promotionEnd;
		this.wholePrice = wholePrice;
		this.minimumQuantity = minimumQuantity;
		this.maximumAcceptQuantity = maximumAcceptQuantity;
		this.availableQuantity = availableQuantity;
		this.safeStock = safeStock;
		/*
		 * 自动验证
		 */
		selfVerify();
	}


	public Item(int id, String name, String nameInChinese, String sku,
			String featureJson, String image, int productId,
			int categoryId, int coinage, int sellerId, float retailPrice,
			float promotionPrice, Date promotionTime, Date promotionEnd,
			float wholePrice, int minimumQuantity, int maximumAcceptQuantity,
			int availableQuantity, int safeStock) {
		super();
		this.id = id;
		this.name = name;
		this.nameInChinese = nameInChinese;
		this.sku = sku;
		this.featureJson = featureJson;
		this.image = image;
		this.productId = productId;
		this.categoryId = categoryId;
		this.coinage = coinage;
		this.sellerId = sellerId;
		this.retailPrice = retailPrice;
		this.promotionPrice = promotionPrice;
		this.promotionTime = promotionTime;
		this.promotionEnd = promotionEnd;
		this.wholePrice = wholePrice;
		this.minimumQuantity = minimumQuantity;
		this.maximumAcceptQuantity = maximumAcceptQuantity;
		this.availableQuantity = availableQuantity;
		this.safeStock = safeStock;
		/*
		 * 自动验证
		 */
		selfVerify();
	}


	private void selfVerify(){
		/*
		 * 验证图片
		 */
		CommonVerify.verifyImage(this.image);
		/*
		 * 验证库存
		 */
		if(this.getAvailableQuantity() >= this.getSafeStock()){
			this.active = 1;
		}else{
			this.active = 0;
		}
	}

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
	public String getFeatureJson() {
		return featureJson;
	}
	public void setFeatureJson(String featureJson) {
		this.featureJson = featureJson;
	}
//	public Map<String, String> getParams() {
//		return params;
//	}
//	public void setParams(Map<String, String> params) {
//		this.params = params;
//	}
//	public Map<String, String> getParamsInEnglish() {
//		return paramsInEnglish;
//	}
//	public void setParamsInEnglish(Map<String, String> paramsInEnglish) {
//		this.paramsInEnglish = paramsInEnglish;
//	}
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
	public Date getPromotionEnd() {
		return promotionEnd;
	}
	public void setPromotionEnd(Date promotionEnd) {
		this.promotionEnd = promotionEnd;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getInternationalShippingService() {
		return internationalShippingService;
	}

	public void setInternationalShippingService(int internationalShippingService) {
		this.internationalShippingService = internationalShippingService;
	}

	public float getInternationalShippingFee() {
		return internationalShippingFee;
	}

	public void setInternationalShippingFee(float internationalShippingFee) {
		this.internationalShippingFee = internationalShippingFee;
	}

	public float getInternationalPromiseDays() {
		return internationalPromiseDays;
	}

	public void setInternationalPromiseDays(float internationalPromiseDays) {
		this.internationalPromiseDays = internationalPromiseDays;
	}


	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public String getShippingCountry() {
		return shippingCountry;
	}

	public void setShippingCountry(String shippingCountry) {
		this.shippingCountry = shippingCountry;
	}
	
}
