package com.omartech.tdg.model;

import java.sql.Date;

public class Seller {
	
	private int id;
	private String email;
	private String password;
	
	private String businessName;
	private String firstName;
	private String lastName;
	private String businessAddress;
	private String city;
	private String country;
	private String primaryPhoneNumber;
	private String productLines;
	private String secondPhoneNumber;
	private String companyWebsiteAddress;
	private Date createdAt;
	private Date lastLoginAt;
	
	private String selfPolicy;
	
	private int accountStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBusinessAddress() {
		return businessAddress;
	}

	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
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

	public String getPrimaryPhoneNumber() {
		return primaryPhoneNumber;
	}

	public void setPrimaryPhoneNumber(String primaryPhoneNumber) {
		this.primaryPhoneNumber = primaryPhoneNumber;
	}

	public String getProductLines() {
		return productLines;
	}

	public void setProductLines(String productLines) {
		this.productLines = productLines;
	}

	public String getSecondPhoneNumber() {
		return secondPhoneNumber;
	}

	public void setSecondPhoneNumber(String secondPhoneNumber) {
		this.secondPhoneNumber = secondPhoneNumber;
	}

	public String getCompanyWebsiteAddress() {
		return companyWebsiteAddress;
	}

	public void setCompanyWebsiteAddress(String companyWebsiteAddress) {
		this.companyWebsiteAddress = companyWebsiteAddress;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getLastLoginAt() {
		return lastLoginAt;
	}

	public void setLastLoginAt(Date lastLoginAt) {
		this.lastLoginAt = lastLoginAt;
	}

	public String getSelfPolicy() {
		return selfPolicy;
	}

	public void setSelfPolicy(String selfPolicy) {
		this.selfPolicy = selfPolicy;
	}

	public int getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}

	
	
	
}
