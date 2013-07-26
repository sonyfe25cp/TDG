package com.omartech.tdg.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;

@Controller
public class OrderAction {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/{userType}/orders/{status}")
	public ModelAndView getOrdersList(
			@PathVariable String userType,
			@PathVariable String status,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session
			){
		int userId = 0;
		List<Order> orders = null;
		Page page = new Page(pageNo, pageSize);
		int statusCode = OrderStatus.statusToInt(status);
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
			orders = orderService.getSellerOrdersByStatusAndPage(userId, statusCode, page);
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
			orders = orderService.getCustomerOrdersByStatusAndPage(userId, statusCode, page);
		}else{
			orders = orderService.getOrdersByStatusAndPage(statusCode, page);
		}
		
		
//		switch(statusCode){
//		case OrderStatus.NOPAY:
//			
//			break;
//		case OrderStatus.PAID:
//			break;
//		case OrderStatus.SEND:
//			break;
//		case OrderStatus.RECEIVE:
//			break;
//		case OrderStatus.CUT:
//			break;
//		case OrderStatus.RETURN:
//			break;
//		case OrderStatus.ERROR:
//			break;
//		}
//		
		
		return new ModelAndView("/"+userType+"/order/order-list").addObject("orders", orders).addObject("pageNo", pageNo);
	}
	
	
	
	
	

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
