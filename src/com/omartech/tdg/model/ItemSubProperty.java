package com.omartech.tdg.model;

import java.util.List;

public class ItemSubProperty {

	private int pid;
	
	private String pname;
	
	private String english;
	
	private List<BaseFeature> baseFeatures;
	
	private String vid;
	
	private int isChinese;
	
	private String mustProperty;

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
	public List<BaseFeature> getBaseFeatures() {
		return baseFeatures;
	}
	public void setBaseFeatures(List<BaseFeature> baseFeatures) {
		this.baseFeatures = baseFeatures;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public int getIsChinese() {
		return isChinese;
	}
	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}
	public String getMustProperty() {
		return mustProperty;
	}
	public void setMustProperty(String mustProperty) {
		this.mustProperty = mustProperty;
	}
}
