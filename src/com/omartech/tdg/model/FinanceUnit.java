package com.omartech.tdg.model;

import java.util.Date;

import com.omartech.tdg.utils.FinanceType;
/**
 * 记录项分收款人和付款人
 * 每笔订单产生了就记录
 * 	买家-》平台
 * 	平台-》卖家
 * 每笔翻译产生，同样记录
 * 	平台-》翻译
 *  卖家-》平台
 * 若被投诉，改变当前单项的状态
 * 	改变平台-》卖家的状态
 * 若投诉结束
 * 	若正常交易，则重新建立一项
 *  若退款，则建立一项退款 平台-》买家，
 *  	若不足全额，则还建立 平台-》卖家
 * 若退款，则新增一项
 * @author Sonyfe25cp
 * 2013-11-11
 */
public class FinanceUnit {
	
	private int id;
	private String receiver;//收款人；admin;seller-11;customer-12;translator-22
	private String sender;//出款人;seller-11;customer-23;translator-22
	private float money;//款项
	private Date createAt;
	private int financeType;//账单的类型{FinanceType}；order；translatortask；cancel；return；redo
	private int relatedId;//order.getId; translationTask.getId
	private int status; //默认为0; 状态见下面
	private String comment;//管理员备注
	private int over;//是否已经结算，默认为0；若已经结算掉，则为1
	private int coinage;//币种
	
	public FinanceUnit(Order order){
		this.financeType = FinanceType.Normal;
		this.relatedId = order.getId();
		this.createAt = new Date();
	}
	
	public final static int NOPAY = 0; //未付款
	public final static int NEEDCHECK = 1;//需要管理员确认
	public final static int ONGOING = 2;//处理中
	public final static int OVER = 3;//处理结束
	
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
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
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
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getRelatedId() {
		return relatedId;
	}

	public void setRelatedId(int relatedId) {
		this.relatedId = relatedId;
	}

	public int getOver() {
		return over;
	}

	public void setOver(int over) {
		this.over = over;
	}

	public int getCoinage() {
		return coinage;
	}

	public void setCoinage(int coinage) {
		this.coinage = coinage;
	}

	
	
	
}
