package com.omartech.tdg.model;

import java.util.List;

/*
 * 不对应数据库的表，只是用于关联关系
 * saleproperty
 */
public class SaleProperty {

	
	private int id;
	private List<SaleSubProperty> subProperties;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<SaleSubProperty> getSubProperties() {
		return subProperties;
	}
	public void setSubProperties(List<SaleSubProperty> subProperties) {
		this.subProperties = subProperties;
	}
	
}
