package com.omartech.tdg.model;

public class ProductType {
	
	private int id;
	private int parentId;//root is 0
	private String name;
	private boolean available;//是否可见
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
}
