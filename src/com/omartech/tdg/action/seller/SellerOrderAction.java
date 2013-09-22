package com.omartech.tdg.action.seller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.TimeFormat;

@Controller
public class SellerOrderAction {

	private OrderService orderService;
	
	
	@RequestMapping("/seller/order/send/{orderId}")
	public ModelAndView send(@PathVariable int orderId){
		Order order = orderService.getOrderById(orderId);
		return new ModelAndView("/seller/order/order-send").addObject("order",order);
	}
	
	@RequestMapping("/seller/order/send")
	public String sendPackage(@RequestParam int orderId,
			@RequestParam String sendAt, 
			@RequestParam String carrier, 
			@RequestParam String trackingWeb, 
			@RequestParam String trackingId, 
			HttpSession session){
		Order order = orderService.getOrderById(orderId);
		order.setSendAt(TimeFormat.StringToDate(sendAt));
		order.setCarrier(carrier);
		order.setTrackingWeb(trackingWeb);
		order.setTrackingId(trackingId);
		orderService.updateOrderBySeller(order);
		orderService.updateOrderStatus(OrderStatus.SEND, orderId);
		return "redirect:/seller/order/show/"+orderId;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
}
