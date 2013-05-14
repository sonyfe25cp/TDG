package com.omartech.tdg.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

public class Product {

	/**
	 * basic
	 */
	private long id;
	private String name;

	
	/**
	 * price
	 */
	private float retailPrice;
	private float promotionPrice;
	private Date promotionTime;
	private float wholePrice;
	private int minimumQuantity;
	private int maximumAcceptQuantity;
	
	/**
	 * store
	 */
	private int availableQuantity;
	private int safeStock;
	private boolean active;
	private String shippingCountry;
	private int shippingPromiseDays;
	private float netWeight;
	private float grossWeight;
	private String sizeWithPackage;
	
	/**
	 * pictures
	 */
	private String mainImage;
	private List<String> otherImages;
	private String features;//采用 key:value的形式
	private String description;
	
	/**
	 * forigin keys
	 */
	private int brandId;//brand
	private int sellerId;//seller
	
	private int productTypeId;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
