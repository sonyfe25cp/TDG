package com.omartech.tdg.model;
/*
 * 商品特征组合 :  匡威鞋： 颜色，尺码
 */
public class FeatureGroup {
	
	private int id;
	private String name;
	private String english;
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
}