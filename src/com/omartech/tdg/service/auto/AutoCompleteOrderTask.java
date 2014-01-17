package com.omartech.tdg.service.auto;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.SystemDefaultSettings;


@Configuration
@EnableScheduling
public class AutoCompleteOrderTask{

	@Autowired
	private OrderService orderService;
	/**
	 * 用于检测已经收货的订单，自动结束
	 * @author Sonyfe25cp
	 * 2013-11-24
	 *  *　　*　　*　　*　　*　　command
        分　 时　 日　 月　周　 命令
	 * @throws JobExecutionException
	 */
	@Scheduled(cron="0 50 * * * ?")
	public void autoClose()
			throws JobExecutionException {
		List<Order> orders = orderService.getOrdersByStatusAndPage(OrderStatus.SEND, null);
		for(Order order : orders){
			Date beginDate = order.getSendLogAt();
			if(beginDate == null){
				beginDate = order.getSendAt();
			}
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, Calendar.DATE - SystemDefaultSettings.AUTOCLOSEAFTERSELLERSEND);
			Date old = cal.getTime();
			if(old.after(beginDate)){//卖家发货后的30天后，自动结束
				System.out.println("this order is old enough to close");
				orderService.updateOrderStatus(OrderStatus.AUTOCLOSE, order.getId());
			}
		}
	}
	/**
	 * 每天将无条件退货日期-1
	 * 
	 * 每天凌晨1点
	 */
	@Scheduled(cron="0 0 1 * * ?")
	public void autoDecreaseOneOfReturnDay(){
		List<Order> orders = orderService.getReturnAvailableOrders();
		for(Order order : orders){
			int returnFlag = order.getReturnFlag();
			returnFlag = returnFlag - 1;
			order.setReturnFlag(returnFlag);
			orderService.updateForAuto(order);
		}
	}
	
	
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
