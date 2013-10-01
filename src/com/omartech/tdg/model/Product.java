package com.omartech.tdg.model;

import java.util.Date;
import java.util.List;

import com.omartech.tdg.utils.CommonVerify;
import com.omartech.tdg.utils.SystemDefaultSettings;

public class Product {

	/**
	 * basic
	 */
	private int id;
	private String sku;//sku for 卖家自己
	private String name;
	private String nameInChinese;
	private String description;
	private String descriptionInChinese;
	private int hasChildren;//0:no, 1: yes
	private int status;//产品状态 #{ProductStatus}
	private int internationalShippingService;// 0:no, 1:yes
	private float internationalShippingFee;//国际运输费
	private float internationalPromiseDays;//承诺日期
	private int countryCode;//发货国家编码
	/**
	 * price
	 */
	private float retailPrice;//零售价
	private float promotionPrice;//推广价
	private Date promotionTime;//推广时间
	private Date promotionEnd;
	private float wholePrice;//批发价
	private int minimumQuantity;//最低批发数量
	private int maximumAcceptQuantity;//最大单笔数量
	private int coinage;//货币
	
	/**
	 * store
	 */
	private int availableQuantity;//现库存
	private int safeStock;//安全库存
	private int active;//0:false;1:true 活跃库存
	
	private float netWeight;//净重
	private float grossWeight;//毛重
	private String sizeWithPackage;//包装大小
	
	/**
	 * pictures
	 */
	private String mainImage;//主图
	private List<String> otherImages;//附图-用于逻辑
	private String subImages;//附图-用于存储
	
	/**
	 * forigin keys
	 */
	private int brandId;//brand
	private int sellerId;//seller
	private int productTypeId;//产品类型id
	private int categoryId;//大类别
	
	private List<Item> items;
	
	
	public Product() {
	}

	public Product(int id, String sku, String name, String nameInChinese,
			String description, String descriptionInChinese, int hasChildren,
			int status, int internationalShippingService,
			float internationalShippingFee, float internationalPromiseDays,
			float retailPrice, float promotionPrice, Date promotionTime,
			Date promotionEnd, float wholePrice, int minimumQuantity,
			int maximumAcceptQuantity, int coinage, int availableQuantity,
			int safeStock, float netWeight, float grossWeight,
			String sizeWithPackage, String mainImage, List<String> otherImages,
			String subImages, int brandId, int sellerId, int productTypeId,
			int categoryId, List<Item> items) {
		super();
		this.id = id;
		this.sku = sku;
		this.name = name;
		this.nameInChinese = nameInChinese;
		this.description = description;
		this.descriptionInChinese = descriptionInChinese;
		this.hasChildren = hasChildren;
		this.status = status;
		this.internationalShippingService = internationalShippingService;
		this.internationalShippingFee = internationalShippingFee;
		this.internationalPromiseDays = internationalPromiseDays;
		this.retailPrice = retailPrice;
		this.promotionPrice = promotionPrice;
		this.promotionTime = promotionTime;
		this.promotionEnd = promotionEnd;
		this.wholePrice = wholePrice;
		this.minimumQuantity = minimumQuantity;
		this.maximumAcceptQuantity = maximumAcceptQuantity;
		this.coinage = coinage;
		this.availableQuantity = availableQuantity;
		this.safeStock = safeStock;
		this.netWeight = netWeight;
		this.grossWeight = grossWeight;
		this.sizeWithPackage = sizeWithPackage;
		this.mainImage = mainImage;
		this.otherImages = otherImages;
		this.subImages = subImages;
		this.brandId = brandId;
		this.sellerId = sellerId;
		this.productTypeId = productTypeId;
		this.categoryId = categoryId;
		this.items = items;
		
		/*
		 * 自动验证
		 */
		selfVerify();
	}

	public Product(int id, String sku, String name, String description,
			int hasChildren, int status, int internationalShippingService,
			float internationalShippingFee, float internationalPromiseDays,
			float retailPrice, float promotionPrice, Date promotionTime,
			Date promotionEnd, float wholePrice, int minimumQuantity,
			int maximumAcceptQuantity, int coinage, int availableQuantity,
			int safeStock, float netWeight, float grossWeight,
			String sizeWithPackage, String mainImage, String subImages,
			int brandId, int sellerId, int productTypeId, int categoryId, int countryCode) {
		super();
		this.id = id;
		this.sku = sku;
		this.name = name;
		this.description = description;
		this.hasChildren = hasChildren;
		this.status = status;
		this.internationalShippingService = internationalShippingService;
		this.internationalShippingFee = internationalShippingFee;
		this.internationalPromiseDays = internationalPromiseDays;
		this.retailPrice = retailPrice;
		this.promotionPrice = promotionPrice;
		this.promotionTime = promotionTime;
		this.promotionEnd = promotionEnd;
		this.wholePrice = wholePrice;
		this.minimumQuantity = minimumQuantity;
		this.maximumAcceptQuantity = maximumAcceptQuantity;
		this.coinage = coinage;
		this.availableQuantity = availableQuantity;
		this.safeStock = safeStock;
		this.netWeight = netWeight;
		this.grossWeight = grossWeight;
		this.sizeWithPackage = sizeWithPackage;
		this.mainImage = mainImage;
		this.subImages = subImages;
		this.brandId = brandId;
		this.sellerId = sellerId;
		this.productTypeId = productTypeId;
		this.categoryId = categoryId;
		this.countryCode = countryCode;
		/*
		 * 自动验证
		 */
		selfVerify();
	}
	
	private void selfVerify(){
		/*
		 * 验证图片
		 */
		CommonVerify.verifyImage(this.mainImage);
		String tmpImageArray[] = this.subImages.split(SystemDefaultSettings.TDGSpliter);
		for(String tmpImage : tmpImageArray){
			CommonVerify.verifyImage(tmpImage);
		}
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
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getSubImages() {
		return subImages;
	}
	public void setSubImages(String subImages) {
		this.subImages = subImages;
	}
	public float getNetWeight() {
		return netWeight;
	}
	public void setNetWeight(float netWeight) {
		this.netWeight = netWeight;
	}
	public float getGrossWeight() {
		return grossWeight;
	}
	public void setGrossWeight(float grossWeight) {
		this.grossWeight = grossWeight;
	}
	public String getSizeWithPackage() {
		return sizeWithPackage;
	}
	public void setSizeWithPackage(String sizeWithPackage) {
		this.sizeWithPackage = sizeWithPackage;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public List<String> getOtherImages() {
		return otherImages;
	}
	public void setOtherImages(List<String> otherImages) {
		this.otherImages = otherImages;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(int productTypeId) {
		this.productTypeId = productTypeId;
	}
	public int getCoinage() {
		return coinage;
	}
	public void setCoinage(int coinage) {
		this.coinage = coinage;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getHasChildren() {
		return hasChildren;
	}
	public void setHasChildren(int hasChildren) {
		this.hasChildren = hasChildren;
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
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
}
