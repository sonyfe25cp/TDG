package com.omartech.tdg.model;

/**
 * @author Sonyfe25cp
 * 2013-9-4
 * 如：红色，red，#000，0，1
 */
public class ProductParameter {
	
	private int id;
	private String name; //中文名
	private String english;//英文名
	private String pvalue;//值
	private int parentId;//父id
	private int level;//层级
	
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
	public String getPvalue() {
		return pvalue;
	}
	public void setPvalue(String pvalue) {
		this.pvalue = pvalue;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
