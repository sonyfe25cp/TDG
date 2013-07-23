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

@Controller
public class OrderAction {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/{userType}/orders")
	public ModelAndView getOrdersList(
			@PathVariable String userType,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session
			){
		int userId = 0;
		List<Order> orders = null;
		Page page = new Page(pageNo, pageSize);
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
			orders = orderService.getSellerOrdersByPage(userId, page);
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
			orders = orderService.getCustomerOrdersByPage(userId, page);
		}else{
			orders = orderService.getOrdersByPage(page);
		}
		return new ModelAndView("/"+userType+"/order/order-list").addObject("orders", orders).addObject("pageNo", pageNo);
	}

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
