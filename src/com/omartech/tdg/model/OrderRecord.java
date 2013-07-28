package com.omartech.tdg.model;

import java.util.Date;


/*
 * 用于记录订单的轨迹
 */
public class OrderRecord {

	private long id;
	private long orderId;
	private String comment;
	private String commentInEnglish;
	private String username;
	private int userId;
	private Date createAt;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
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
	public String getCommentInEnglish() {
		return commentInEnglish;
	}
	public void setCommentInEnglish(String commentInEnglish) {
		this.commentInEnglish = commentInEnglish;
	}
	
}
