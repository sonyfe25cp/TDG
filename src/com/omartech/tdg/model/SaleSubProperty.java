package com.omartech.tdg.model;

import java.util.List;

public class SaleSubProperty {

	private int pid;
	
	private String pname;
	
	private String english;
	
	private List<SalePropertyValue> salePropertyValues;
	
	private String vid;

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
}
