package com.omartech.tdg.model;
/**
 * 基本系统设定 
 * @author Sonyfe25cp
 * 2013-12-28
 */
public class SystemSetting {

	private int id;
	
	private String storeAddress;//平台仓库地址

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
}
