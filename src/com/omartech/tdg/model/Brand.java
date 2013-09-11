package com.omartech.tdg.model;

public class Brand {

	private int id;
	private String name;
	private String description;
	
	private String nameInChinese;
	private String descriptionInChinese;
	
	private int isChinese;//0:no,1:yes
	
	private int sellerId;
	
	private int status; //#{ProductStatus}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String getNameInChinese() {
		return nameInChinese;
	}

	public void setNameInChinese(String nameInChinese) {
		this.nameInChinese = nameInChinese;
	}

	public String getDescriptionInChinese() {
		return descriptionInChinese;
	}

	public void setDescriptionInChinese(String descriptionInChinese) {
		this.descriptionInChinese = descriptionInChinese;
	}

	public int getIsChinese() {
		return isChinese;
	}

	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
