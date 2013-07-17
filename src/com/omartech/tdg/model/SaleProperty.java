package com.omartech.tdg.model;

import java.util.List;

/*
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
