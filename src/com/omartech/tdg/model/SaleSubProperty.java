package com.omartech.tdg.model;

import java.util.List;

/**
 * 用于标示 具体某个特征的值
 * pid: 1
 * pname: 颜色
 * english： color
 * vid: 101,102,103
 * list: <101:红色>，<102:绿色>,<103:黑色>
 * isChinese: true
 * mustproperty: true, 颜色是否为增加产品时的必选属性
 * @author Sonyfe25cp
 * 2013-8-2
 */
public class SaleSubProperty {

	private int pid;
	
	private String pname;
	
	private String english;
	
	private List<SalePropertyValue> salePropertyValues;
	
	private String vid;
	
	private int isChinese;
	
	private String mustproperty;

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public List<SalePropertyValue> getSalePropertyValues() {
		return salePropertyValues;
	}
	public void setSalePropertyValues(List<SalePropertyValue> salePropertyValues) {
		this.salePropertyValues = salePropertyValues;
	}
	public int getIsChinese() {
		return isChinese;
	}
	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}
	public String getMustproperty() {
		return mustproperty;
	}
	public void setMustproperty(String mustproperty) {
		this.mustproperty = mustproperty;
	}
}
