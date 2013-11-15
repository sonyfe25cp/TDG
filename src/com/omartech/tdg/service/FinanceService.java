package com.omartech.tdg.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.FinanceUnitMapper;
import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.TranslationTask;
import com.omartech.tdg.utils.FinanceType;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.TaskStatus;
import com.omartech.tdg.utils.UserType;
@Service
public class FinanceService {
	
	@Autowired
	private FinanceUnitMapper financeUnitMapper;
	@Autowired
	private FinanceRecordService financeRecordService;
	
	public void computeForSeller(Date begin, Date end, int userId){
		String user = contructID(userId, UserType.SELLER);
		FinanceRecord record = new FinanceRecord();
		//收入
		List<FinanceUnit> unitsReceiveThisRun = financeUnitMapper.getFinanceByReceiverAndMonthByPage(user, begin, end, null);
		float receive = 0f;//从平台收的钱
		/**
		 * 计算平台需要支付给卖家的钱
		 * 1. 正常买卖
		 */
		for(FinanceUnit unit : unitsReceiveThisRun){
			int financeType = unit.getFinanceType();
			float money = unit.getMoney();
			switch(financeType){
			case FinanceType.Normal://正常订单的要收钱
				receive += money;
				record.addId(unit.getId());
				break;
			case FinanceType.Other:
				receive += money;
				record.addId(unit.getId());
				break;
			}
			
		}
		//支出
		List<FinanceUnit> unitsSendThisRun = financeUnitMapper.getFinanceBySenderAndMonthByPage(user, begin, end, null);
		float translationFee = 0f;//付给平台的翻译钱
		float returnFee = 0f; //返款给平台的钱
		float storeFee = 0f;//使用仓库的钱
		float serviceFee = 0f;//付给平台的服务钱
		float otherFee = 0f;
		/**
		 * 计算需要付给平台的钱
		 * 1. 翻译
		 * 2. 退款
		 */
		for(FinanceUnit unit : unitsSendThisRun){
			int financeType = unit.getFinanceType();
			float money = unit.getMoney();
			switch(financeType){
			case FinanceType.Translation://翻译的钱
				translationFee += money;
				record.addId(unit.getId());
				break;
			case FinanceType.Return://给平台的返款，如退款
				returnFee += money;
				record.addId(unit.getId());
				break;
			case FinanceType.Other:
				otherFee += money;
				record.addId(unit.getId());
				break;
			case FinanceType.Store:
				storeFee += money;
				record.addId(unit.getId());
				break;
			case FinanceType.Service:
				serviceFee += money;
				record.addId(unit.getId());
				break;
			}
		}
		
		float totalGetFromAdmin = receive;
		float payAdmin = translationFee + returnFee + storeFee + serviceFee + otherFee;
		float total = totalGetFromAdmin - payAdmin;
		
		record.setOrderMoney(totalGetFromAdmin);
		record.setOtherMoney(otherFee);
		record.setSellerId(userId);
		record.setServiceMoney(serviceFee);
		record.setStoreMoney(storeFee);
		record.setTotalGetFromAdmin(totalGetFromAdmin);
		record.setTotalPayAdmin(payAdmin);
		record.setTotal(total);
		
		financeRecordService.insert(record);
		
	}
	/**
	 * 批量更新财务单元状态
	 * @param ids
	 * @param status
	 */
	public void batchUpdate(Set<Integer> idset, int status){
		
	}
	
	
	
	
	
	/**
	 * 某类用户的收入情况
	 * @param userId
	 * @param userType
	 * @param begin
	 * @param end
	 * @param page
	 * @return
	 */
	public List<FinanceUnit> getFinanceByReceiverAndMonthByPage(int userId, String userType, Date begin, Date end, Page page){
		String receiver = contructID(userId, userType);
		
		if(begin !=null && end !=null){
			return financeUnitMapper.getFinanceByReceiverAndMonthByPage(receiver, begin, end, page);
		}else{
			return financeUnitMapper.getFinanceByReceiverByPage(receiver, page);
		}
	}
	/**
	 * 某类用户的支出情况
	 * @param userId
	 * @param userType
	 * @param begin
	 * @param end
	 * @param page
	 * @return
	 */
	public List<FinanceUnit> getFinanceBySenderAndMonthByPage(int userId, String userType, Date begin, Date end, Page page){
		String sender = contructID(userId, userType);
		
		if(begin !=null && end !=null){
			return financeUnitMapper.getFinanceBySenderAndMonthByPage(sender, begin, end, page);
		}else{
			return financeUnitMapper.getFinanceBySenderByPage(sender, page);
		}
	}
	
	/**
	 * 插入订单相关项
	 * @param order
	 */
	public void insertOrderFinance(Order order, int newStatus){
		int originStatus = order.getOrderStatus();
		switch(newStatus){
		case OrderStatus.PAID://买家付款
			insertPaidOrder(order);
			break;
		case OrderStatus.COMPLAIN://订单被投诉
			//1.找到平台->卖家那条数据，改变状态
			//2.
			break;
		}
	}
	/**
	 * 翻译任务
	 * 插入两条记录
	 * 1.平台支付给翻译者
	 * 2.卖家支付给平台
	 * @param tt
	 */
	public void insertTranslationFinance(TranslationTask tt){
		int status = tt.getStatus();//获取该任务的之前状态
		//翻译跟重新翻译的价格不同
		switch(status){
		case TaskStatus.NEW://新任务
			break;
		case TaskStatus.REDO://重新翻译
			break;
		}
		FinanceUnit toTranslator = new FinanceUnit();
		toTranslator.setReceiver(contructID(tt.getTranslatorId(), UserType.TRANSLATOR));
		toTranslator.setSender(UserType.ADMIN);
		
		FinanceUnit toAdmin = new FinanceUnit();
		toAdmin.setReceiver(UserType.ADMIN);
		toAdmin.setSender(contructID(tt.getSellerId(), UserType.SELLER));
		
		insert(toTranslator);
		insert(toAdmin);
	}
	/**
	 * 插入两条记录，一条是 买家付给平台，一条是平台付给卖家
	 */
	private boolean insertPaidOrder(Order order){
		FinanceUnit unit = new FinanceUnit(order);//买家付给平台
		unit.setReceiver(UserType.ADMIN);
		unit.setSender(contructID(order.getCustomerId(), UserType.CUSTOMER));
		unit.setMoney(order.getPriceRMB());
		insert(unit);
		
		FinanceUnit unit2 = new FinanceUnit(order);//平台付给卖家
		unit2.setReceiver(contructID(order.getSellerId(), UserType.SELLER));
		unit2.setSender(UserType.ADMIN);
		unit2.setMoney(order.getOriginTotal());
		insert(unit2);
		return true;
	}
	
	private boolean insert(FinanceUnit unit){
		int id = unit.getRelatedId();
		if(id == 0){
			System.err.println("this unit is not have related id , please check ");
			return false;
		}
		financeUnitMapper.insert(unit);
		return true;
	}
	/**
	 * 退全款
	 * 1. 卖家退给平台
	 * 2. 平台退给买家
	 * @param order
	 */
	public void insertSellerCancelOrderFinance(Order order){//商家取消了订单，需要退钱
		FinanceUnit toAdmin = new FinanceUnit(order);
		toAdmin.setReceiver(UserType.ADMIN);
		toAdmin.setSender(contructID(order.getSellerId(), UserType.SELLER));
		toAdmin.setMoney(order.getOriginTotal());
		
		FinanceUnit toCustomer = new FinanceUnit(order);
		toCustomer.setReceiver(contructID(order.getSellerId(), UserType.CUSTOMER));
		toCustomer.setSender(UserType.ADMIN);
		
		insert(toAdmin);
		insert(toCustomer);
	}
	
	private String contructID(int id, String userType){
		if(userType.equals(UserType.ADMIN)){
			return UserType.ADMIN;
		}else{
			return userType +"-"+id;
		}
	}

}
