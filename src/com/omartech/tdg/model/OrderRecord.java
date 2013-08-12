package com.omartech.tdg.model;

import java.util.Date;


/*
 * 用于记录订单的轨迹
 */
public class OrderRecord {

	private int id;
	private int orderId;
	private String comment;
	private String commentInEnglish;
	private String username;
	private int userId;
	private Date createAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentInEnglish() {
		return commentInEnglish;
	}
	public void setCommentInEnglish(String commentInEnglish) {
		this.commentInEnglish = commentInEnglish;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
}
