package com.omartech.tdg.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.FinanceUnitMapper;
import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.utils.FinanceType;
@Service
public class FinanceService {
	@Autowired
	private FinanceUnitMapper financeUnitMapper;
	public List<FinanceUnit> getFinanceBySellerIdAndMonthByPage(int sellerId, Date begin, Date end, Page page){
		return financeUnitMapper.getFinanceBySellerIdAndMonthByPage(sellerId, begin, end, page);
	}
	
	public List<FinanceUnit> getFinanceByMonthByPage(Date begin, Date end, Page page){
		return financeUnitMapper.getFinanceByMonthByPage(begin, end, page);
	}
	
	public void insertNormalFinance(Order order){
		FinanceUnit fu = new FinanceUnit(order, FinanceType.Normal);
		financeUnitMapper.insert(fu);
	}
	public void insertSellerCancelOrderFinance(Order order){//商家取消了订单，需要退钱
		
	}

}
