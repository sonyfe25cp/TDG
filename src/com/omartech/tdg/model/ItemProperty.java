package com.omartech.tdg.model;

import java.util.List;

/*
 * 产品属性
 */
public class ItemProperty {

	private int cid;
	
	private List<ItemSubProperty> subProperties;

	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public List<ItemSubProperty> getSubProperties() {
		return subProperties;
	}
	public void setSubProperties(List<ItemSubProperty> subProperties) {
		this.subProperties = subProperties;
	}
}
