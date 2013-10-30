package com.omartech.tdg.model;

import com.omartech.tdg.utils.AccountStatus;

public class Customer {

	private int id;
	private String email;
	private String password;
	private int accountStatus;
	
	private String phoneNum;
	
	private String refreshToken;
	private String accessToken;
	
	public Customer() {

	}
	public Customer(String email, String password) {
		super();
		this.email = email;
		this.password = password;
		this.accountStatus = AccountStatus.APPLY;
	}
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
	public int getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
}
