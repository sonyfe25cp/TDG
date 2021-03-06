package com.omartech.tdg.model;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Seller;
/**
 * 投诉项/退货项
 * @author Sonyfe25cp
 * 2013-10-3
 */
public class ClaimItem {
	private int id;
	private String claimType; //claim：投诉；return：退货
	private int claimTypeId;//投诉类型，1234567
	private int sellerId;
	private int claimItemId;//投诉对象的id
	private int customerId;
	private int status;//投诉的状态，用于标志投诉的对象状态
	private int previousStatus; //被投诉的对象之前的状态
	private String comment; //投诉的补充说明--customer
	private String commentByAdmin; //投诉的记录--admin
	private Customer customer;
	private Seller seller;
	private int flag;//是否已有管理员介入；默认为0，若管理员介入，则为1；
	
	public ClaimItem(String claimType) {
		super();
		this.claimType = claimType;
	}
	public ClaimItem() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClaimType() {
		return claimType;
	}
	public void setClaimType(String claimType) {
		this.claimType = claimType;
	}
	public int getClaimTypeId() {
		return claimTypeId;
	}
	public void setClaimTypeId(int claimTypeId) {
		this.claimTypeId = claimTypeId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getClaimItemId() {
		return claimItemId;
	}
	public void setClaimItemId(int claimItemId) {
		this.claimItemId = claimItemId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPreviousStatus() {
		return previousStatus;
	}
	public void setPreviousStatus(int previousStatus) {
		this.previousStatus = previousStatus;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentByAdmin() {
		return commentByAdmin;
	}
	public void setCommentByAdmin(String commentByAdmin) {
		this.commentByAdmin = commentByAdmin;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
}
