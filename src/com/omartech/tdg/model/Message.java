package com.omartech.tdg.model;

import java.util.Date;


public class Message {
	
	private int id;
	private String title;
	private String content;
	private Date createAt;
	private String userType;
	private int userId;
	private int responseId;//回复当前message的messageId
	private Date finishAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getResponseId() {
		return responseId;
	}
	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}
	public Date getFinishAt() {
		return finishAt;
	}
	public void setFinishAt(Date finishAt) {
		this.finishAt = finishAt;
	}
}
