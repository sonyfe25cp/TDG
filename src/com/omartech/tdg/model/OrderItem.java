package com.omartech.tdg.model;


public class OrderItem {
	
	private int id;
	private int itemId;
	private String sku;
	private int productId;
	private String name;//货物名
	private String nameInChinese;//中文
	private String desc;//用于描述子产品
	private int coinage;
	private int sellerId;
	private int num;
	private float price;
	private float priceRMB;
	private float ifeeRMB;//运费的rmb
	private int orderId;
	
	private int internationalShippingService;// 0:no, 1:yes
	private float internationalShippingFee;//国际运输费
	private float internationalPromiseDays;//承诺日期
	private int countryCode;
	public OrderItem(){
		
	}
	
	public OrderItem(Item item){
		this.itemId = item.getId();
		this.sku = item.getSku();
		this.productId = item.getProductId();
		this.name = item.getName();
		this.nameInChinese = item.getNameInChinese();
		this.desc = item.getFeatureJson();
		this.coinage = item.getCoinage();
		this.sellerId = item.getSellerId();
		this.setInternationalShippingService(item.getInternationalShippingService());
		if(item.getInternationalShippingService() == 1){
			this.setInternationalPromiseDays(item.getInternationalPromiseDays());
			this.setInternationalShippingFee(item.getInternationalShippingFee());
			this.ifeeRMB = Coinage.compute(coinage, item.getInternationalShippingFee());
		}
		this.countryCode = item.getCountryCode();
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getNameInChinese() {
		return nameInChinese;
	}

	public void setNameInChinese(String nameInChinese) {
		this.nameInChinese = nameInChinese;
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

	public float getPriceRMB() {
		return priceRMB;
	}

	public void setPriceRMB(float priceRMB) {
		this.priceRMB = priceRMB;
	}

	public float getIfeeRMB() {
		return ifeeRMB;
	}

	public void setIfeeRMB(float ifeeRMB) {
		this.ifeeRMB = ifeeRMB;
	}
}
