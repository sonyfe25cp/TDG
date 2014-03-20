package com.omartech.tdg.service.auto;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	static Logger logger = LoggerFactory.getLogger(AutoCompleteOrderTask.class);

	@Autowired
	private OrderService orderService;
	/**
	 * 用于检测卖家观测期，自动结束
	 * @author Sonyfe25cp
	 * 2013-11-24
	 *  *　　*　　*　　*　　*　　command
        分　 时　 日　 月　周　 命令
	 * @throws JobExecutionException
	 */
	@Scheduled(cron="0 0/5 * * * ?")
	public void autoClose()
			throws JobExecutionException {
		List<Order> orders = orderService.getOrdersInSellerObserving();
		for(Order order : orders){
			Date beginDate = order.getSendLogAt();
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, cal.get(Calendar.DATE) - SystemDefaultSettings.SellerObserveTime);
			Date old = cal.getTime();
			logger.info("计算卖家观测期用....old:"+old);
			if(old.after(beginDate)){//卖家发货后的30天后，自动结束
				System.out.println("this order is old enough to close ,id : "+ order.getId());
				orderService.updateOrderStatus(OrderStatus.AUTOCLOSE, order.getId());
			}
		}
	}
	/**
	 * 定时检测买家观测期
	 * 
	 * 每天凌晨1点
	 */
	@Scheduled(cron="0 0/5 * * * ?")
	public void autoDecreaseOneOfReturnDay(){

		List<Order> orders = orderService.getOrdersInCustomerObserving();
		for(Order order : orders){
			Date beginDate = order.getPaidAt();
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, cal.get(Calendar.DATE) - SystemDefaultSettings.CustomerObserveTime);
			Date old = cal.getTime();
			logger.info("计算买家观测期用....old: {}, beginDate: {}",old, beginDate);
			if(old.after(beginDate)){//卖家发货后的30天后，自动结束
				logger.info("买家观测期结束的订单:"+order.getId());
				order.setCustomerObserveFlag(Order.ObserveOver);
				orderService.updateForAuto(order);
			}
		}
	}
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
