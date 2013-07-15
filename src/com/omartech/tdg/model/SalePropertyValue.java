package com.omartech.tdg.model;

/**
 * 销售属性键值对
 * @author Sonyfe25cp
 * 2013-7-14
 */
public class SalePropertyValue {

	
	private int vid;
	private String name;
	private String english;
	private int isChinese;
	
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
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
	public int getIsChinese() {
		return isChinese;
	}
	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}
}
