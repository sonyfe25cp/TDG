package com.omartech.tdg.model;

import java.util.Date;

import com.omartech.tdg.utils.FinanceType;
import com.omartech.tdg.utils.UserType;
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
	private Date createAt;//最后更新时间
	private String relatedType;//Order;TranslationTask
	private int relatedId;//order.getId; translationTask.getId
	private int status; //默认为0; 状态见下面
	private String comment;//管理员备注
	private int over;//是否已经结算，默认为0；若已经结算掉，则为1
	private int coinage;//币种
	private int financeType;//账单的类型{FinanceType}；order；translatortask；store；service等
	private int financeDetailsType;//在financeType下面的类别
	
	public static String OrderRelated = "order";
	public static String TranslationRelated = "translationTask";
	public static String OtherRelated = "other";
	
	public static String ReceiveUnitType = "receive";
	public static String SendUnitType = "send";
	
	/**
	 * status
	 */
	public final static int NOPAY = 0; //未付款-未被结算入对帐单-可修改
	public final static int NEEDCHECK = 1;//需要管理员确认
	public final static int ONGOING = 2;//处理中-进入对帐单-不可修改
	public final static int OVER = 3;//处理结束-结算结束-不可修改
	public final static int LOCK = 4;//锁定，用于被投诉or退货的订单-不可修改
	
	
	public FinanceUnit(String relatedType, String unitType){
		this.financeType = FinanceType.Other;
		this.createAt = new Date();
		if(relatedType.equals(OrderRelated)){
			this.relatedType = OrderRelated;
		}else if(relatedType.equals(TranslationRelated)){
			this.relatedType = TranslationRelated;
		}else if(relatedType.equals(OtherRelated)){
			this.relatedType = OtherRelated;
		}else{
			System.err.println("construct error in financeUnit");
		}
		if(unitType.equals(ReceiveUnitType)){
			this.setReceiver(UserType.ADMIN);
		}else if(unitType.equals(SendUnitType)){
			this.setSender(UserType.ADMIN);
		}else{
			System.err.println("construct error in financeUnit");
		}
	}
	
	public FinanceUnit(Order order){
		this.financeType = FinanceType.Order;
		this.relatedId = order.getId();
		this.createAt = new Date();
		this.coinage = order.getCoinage();
		this.relatedType = OrderRelated;
	}
	public FinanceUnit(TranslationTask translatorTask){
		this.financeType = FinanceType.Translation;
		this.relatedId = translatorTask.getId();
		this.createAt = new Date();
		this.relatedType = TranslationRelated;
	}
	/**
	 * return new financeUnit
	 * @param oldUnit
	 * @param percent, the percent of origin money
	 */
	public FinanceUnit(FinanceUnit oldUnit, float percent){
		this.receiver = oldUnit.receiver;
		this.sender = oldUnit.sender;
		float p = percent / 100.0f;
		this.money = oldUnit.money * p;
		this.createAt = new Date();
		this.relatedId = oldUnit.relatedId;
		this.comment = oldUnit.comment;
		this.over = oldUnit.over;
		this.coinage = oldUnit.coinage;
		this.financeType = oldUnit.financeType;
		this.financeDetailsType = oldUnit.financeDetailsType;
		this.relatedType = oldUnit.getRelatedType();
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
	public int getFinanceDetailsType() {
		return financeDetailsType;
	}
	public void setFinanceDetailsType(int financeDetailsType) {
		this.financeDetailsType = financeDetailsType;
	}
	public String getRelatedType() {
		return relatedType;
	}
	public void setRelatedType(String relatedType) {
		this.relatedType = relatedType;
	}

	
	
	
}
