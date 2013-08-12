package com.omartech.tdg.model;

/**
 * 用于管理员给不同用户发通知
 * @author Sonyfe25cp
 * 2013-8-12
 */
public class Notice {

	private int id;
	private String content;
	private String userType; //{UserType}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
}
