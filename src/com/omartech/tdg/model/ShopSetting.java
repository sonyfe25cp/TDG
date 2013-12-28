package com.omartech.tdg.model;

public class ShopSetting {
	
	private int id;
	private int sellerId;
	private String title;
	private String titleInChinese;
	private int shippingCountry;
	private int shippingPromiseDays;
	private String description;
	private String descriptionInChinese;
	private String backAddress; //退货地址
	private int useSystemStoreAddress;//0:不使用；1：使用
	
	private int defaultCoinage;//默认币制
	
	private String bankName;
	private String swiftCode;
	private String bankCity;
	private String bankAddress;
	private String accountName;
	private String accountNumber;
	
	public boolean useSystemStore(){
		if(useSystemStoreAddress == 1){
			return true;
		}else{
			return false;
		}
	}
	
//	public ShopSetting(int sellerId, String title, String titleInChinese,
//			int shippingPromiseDays, String description,
//			String descriptionInChinese, String bankName, String swiftCode,
//			String bankCity, String bankAddress, String accountName,
//			String accountNumber) {
//		super();
//		this.sellerId = sellerId;
//		this.title = title;
//		this.titleInChinese = titleInChinese;
//		this.shippingPromiseDays = shippingPromiseDays;
//		this.description = description;
//		this.descriptionInChinese = descriptionInChinese;
//		this.bankName = bankName;
//		this.swiftCode = swiftCode;
//		this.bankCity = bankCity;
//		this.bankAddress = bankAddress;
//		this.accountName = accountName;
//		this.accountNumber = accountNumber;
//	}
	public ShopSetting(int sellerId, String title, int shippingCountry, String backAddress, int useSystemStoreAddress,
			int shippingPromiseDays, String description, int defaultCoinage,
			String bankName, String swiftCode, String bankCity,
			String bankAddress, String accountName, String accountNumber) {
		super();
		this.sellerId = sellerId;
		this.title = title;
		this.shippingCountry = shippingCountry;
		this.backAddress = backAddress;
		this.useSystemStoreAddress = useSystemStoreAddress;
		this.shippingPromiseDays = shippingPromiseDays;
		this.description = description;
		this.defaultCoinage = defaultCoinage;
		this.bankName = bankName;
		this.swiftCode = swiftCode;
		this.bankCity = bankCity;
		this.bankAddress = bankAddress;
		this.accountName = accountName;
		this.accountNumber = accountNumber;
	}
	public ShopSetting() {
		super();
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleInChinese() {
		return titleInChinese;
	}
	public void setTitleInChinese(String titleInChinese) {
		this.titleInChinese = titleInChinese;
	}
	public int getShippingCountry() {
		return shippingCountry;
	}
	public void setShippingCountry(int shippingCountry) {
		this.shippingCountry = shippingCountry;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getSwiftCode() {
		return swiftCode;
	}
	public void setSwiftCode(String swiftCode) {
		this.swiftCode = swiftCode;
	}
	public String getBankCity() {
		return bankCity;
	}
	public void setBankCity(String bankCity) {
		this.bankCity = bankCity;
	}
	public String getBankAddress() {
		return bankAddress;
	}
	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBackAddress() {
		return backAddress;
	}
	public void setBackAddress(String backAddress) {
		this.backAddress = backAddress;
	}
	public int getUseSystemStoreAddress() {
		return useSystemStoreAddress;
	}
	public void setUseSystemStoreAddress(int useSystemStoreAddress) {
		this.useSystemStoreAddress = useSystemStoreAddress;
	}
}
