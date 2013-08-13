package com.omartech.tdg.action.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;

@Controller
public class CustomerOrderAction {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/customer/order/receive/{orderId}")
	public String receive(@PathVariable int orderId){
		orderService.updateOrderStatus(OrderStatus.RECEIVE, orderId);
		return "redirect:/customer/orders/all";
	}
	
	@RequestMapping("/customer/order/complain/{orderId}")
	public String complain(@PathVariable int orderId){
		orderService.updateOrderStatus(OrderStatus.COMPLAIN, orderId);
		return "redirect:/customer/orders/all";
	}
	

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
}
