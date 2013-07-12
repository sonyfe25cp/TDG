package com.omartech.tdg.model;
/**
 * 产品的分类，itemcat
 * @author yulong
 *
 */
public class ProductCategory {
	
	private int id;
	private int parentId;//root is 0
	private String name;
	private String english;
	private boolean available;//是否可见
	
	private int root;//该节点的根节点
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
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
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
}
