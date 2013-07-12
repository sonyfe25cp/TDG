package com.omartech.tdg.model;

/*
 * 基本特征，itempropertyvalue 如： 红色  1000212
 * 对应表：itempropertyvalue 
 */
public class BaseFeature {
	
	private int id;
	private String name;
	private String english;
	private int featureId;
	private int isChinese;
	
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
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public int getFeatureId() {
		return featureId;
	}
	public void setFeatureId(int featureId) {
		this.featureId = featureId;
	}
	public int getIsChinese() {
		return isChinese;
	}
	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}
}
