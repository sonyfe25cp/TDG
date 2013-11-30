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

/**
 * 用于检测已经收货的订单，自动结束
 * @author Sonyfe25cp
 * 2013-11-24
 */
@Configuration
@EnableScheduling
public class AutoCompleteOrderTask{

	@Autowired
	private OrderService orderService;
	/**
	 *  *　　*　　*　　*　　*　　command
        分　 时　 日　 月　周　 命令
	 * @throws JobExecutionException
	 */
	@Scheduled(cron="30 * * * * ?")
	protected void run()
			throws JobExecutionException {
		List<Order> orders = orderService.getOrdersByStatusAndPage(OrderStatus.SEND, null);
		for(Order order : orders){
			Date beginDate = order.getSendAt();
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, Calendar.DATE - SystemDefaultSettings.AUTOCLOSEAFTERSELLERSEND);
			Date old = cal.getTime();
			if(old.after(beginDate)){//卖家发货后的30天后，自动结束
				System.out.println("this order is old enough to close");
				orderService.updateOrderStatus(OrderStatus.CLOSE, order.getId());
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
