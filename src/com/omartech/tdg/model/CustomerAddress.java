package com.omartech.tdg.model;
/*
 * 买家地址
 */
public class CustomerAddress {

	private int id;
	
	private String name;
	private String address;
	private String city;
	private String country;
	private int countryCode;
	private String postCode;
	
	private int customerId;

	public CustomerAddress() {
	}

	public CustomerAddress(String name, String address, String city,
			String country, int countryCode, String postCode, int customerId) {
		super();
		this.name = name;
		this.address = address;
		this.city = city;
		this.country = country;
		this.countryCode = countryCode;
		this.postCode = postCode;
		this.customerId = customerId;
	}

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
}
