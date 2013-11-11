package com.omartech.tdg.model;

import java.util.Date;
/**
 * 每付款一份订单，都要存一份financeUnit，创建createAt
 * 若客户确认已收货，则finish，并记录finishAt
 * 若订单遭到投诉，则改变status，
 * 		由管理员来确认该订单的status与该unit的结算情况
 * 若是退货等处理，则改变status
 * 		由管理员来自己处理该订单的unit情况
 * 统计财务以finishAt为基准
 * @author Sonyfe25cp
 * 2013-11-11
 */
public class FinanceUnit {
	
	private int id;
	private int sellerId;
	private int customerId;
	private int orderId;//账单号
	private float orderMoney;//订单价--原价格，不含平台的折扣
	private float platformMoney;//平台价格，卖给消费者的实际价格
	private Date createAt;
	private int financeType;//账单的类型{FinanceType}
	private int status; //默认为0，需要管理员确认的为1
	private String comment;//管理员备注
	private Date finishAt;
	
	
	public FinanceUnit(Order order, int financeType) {
		super();
		this.sellerId = order.getSellerId();
		this.customerId = order.getCustomerId();
		this.orderId = order.getId();
		this.orderMoney = order.getOriginTotal();
		this.platformMoney = order.getPrice();
		this.financeType = financeType;
		this.createAt = new Date();
	}
	public FinanceUnit() {
		super();
		this.createAt = new Date();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public float getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(float orderMoney) {
		this.orderMoney = orderMoney;
	}
	public float getPlatformMoney() {
		return platformMoney;
	}
	public void setPlatformMoney(float platformMoney) {
		this.platformMoney = platformMoney;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public int getFinanceType() {
		return financeType;
	}
	public void setFinanceType(int financeType) {
		this.financeType = financeType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getFinishAt() {
		return finishAt;
	}
	public void setFinishAt(Date finishAt) {
		this.finishAt = finishAt;
	}

	
	
	
}
