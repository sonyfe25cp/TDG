package com.omartech.tdg.model;

import com.omartech.tdg.utils.AccountStatus;

public class Customer {

	private int id;
	private String email;
	private String password;
	private int accountStatus;
	
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
}
