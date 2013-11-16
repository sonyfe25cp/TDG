package com.omartech.tdg.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

/**
 * 对账单
 * 每个月15号生成 上月1-14的账目 1<<date<<14
 * 每月1号生成 上月15-月底的账目 15<<date<1
 * 
 * @author Sonyfe25cp
 * 2013-11-15
 */
public class FinanceRecord {
	
	private int id;
	
	private String receiver;//对账id，seller-12,translator-11
	private String unitIds;//该记录中的financeUnit.id
	private Date createAt;//创建时间
	private int status;//该账目的状态
	private float orderMoney;//订单收的钱
	private float translationMoney;//翻译相关的
	private float storeMoney;//仓库存储相关
	private float serviceMoney;//平台服务 相关
	private float otherMoney;//其他的款项
	private float totalGetFromAdmin;//从平台的收款
	private float totalPayAdmin;//付给平台
	private float total;//最终金额，正数表示平台要付给卖家，负数表示卖家要付给平台
	private int coinage;//币种
	private HashSet<Integer> unitIdSet;
	private List<FinanceUnit> unitsArray;
	
	public static final int Ongoing = 0;//没有支付
	public static final int Over = 1;//已经支付
	public static final int Applying = 2; //店家申请平台支付
	public static final int NextTime = 3;//凑够数再支付
	
	
	public void addFinanceUnit(FinanceUnit unit){
		if(unitsArray == null){
			unitsArray = new ArrayList<FinanceUnit>();
		}
		unitsArray.add(unit);
	}
	
	public void addId(int id){
		if(unitIdSet ==null){
			unitIdSet = new HashSet<Integer>();
		}
		unitIdSet.add(id);
		int index = 1;
		StringBuilder sb = new StringBuilder();
		for(int tmp : unitIdSet){
			sb.append(tmp);
			if(index != unitIdSet.size()){
				sb.append(",");
			}
		}
		this.unitIds = sb.toString();
	}
	
	public FinanceRecord() {
		super();
		this.createAt = new Date(System.currentTimeMillis());
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public float getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(float orderMoney) {
		this.orderMoney = orderMoney;
	}
	public float getTranslationMoney() {
		return translationMoney;
	}
	public void setTranslationMoney(float translationMoney) {
		this.translationMoney = translationMoney;
	}
	public float getStoreMoney() {
		return storeMoney;
	}
	public void setStoreMoney(float storeMoney) {
		this.storeMoney = storeMoney;
	}
	public float getServiceMoney() {
		return serviceMoney;
	}
	public void setServiceMoney(float serviceMoney) {
		this.serviceMoney = serviceMoney;
	}
	public float getOtherMoney() {
		return otherMoney;
	}
	public void setOtherMoney(float otherMoney) {
		this.otherMoney = otherMoney;
	}
	public float getTotalGetFromAdmin() {
		return totalGetFromAdmin;
	}
	public void setTotalGetFromAdmin(float totalGetFromAdmin) {
		this.totalGetFromAdmin = totalGetFromAdmin;
	}
	public float getTotalPayAdmin() {
		return totalPayAdmin;
	}
	public void setTotalPayAdmin(float totalPayAdmin) {
		this.totalPayAdmin = totalPayAdmin;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getUnitIds() {
		return unitIds;
	}
	public void setUnitIds(String unitIds) {
		this.unitIds = unitIds;
	}

	public HashSet<Integer> getUnitIdSet() {
		return unitIdSet;
	}

	public void setUnitIdSet(HashSet<Integer> unitIdSet) {
		this.unitIdSet = unitIdSet;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public List<FinanceUnit> getUnitsArray() {
		return unitsArray;
	}

	public void setUnitsArray(List<FinanceUnit> unitsArray) {
		this.unitsArray = unitsArray;
	}

	public int getCoinage() {
		return coinage;
	}

	public void setCoinage(int coinage) {
		this.coinage = coinage;
	}
	
}
