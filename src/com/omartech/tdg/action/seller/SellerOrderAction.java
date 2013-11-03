package com.omartech.tdg.action.seller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.exception.UnauthorizedException;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.TimeFormat;
import com.omartech.tdg.utils.UserType;

@Controller
public class SellerOrderAction {

	private OrderService orderService;
	
	@RequestMapping("/seller/order/print/{id}")
	public ModelAndView forPrint(
			@PathVariable int id,
			HttpSession session
			){
		Order order = orderService.getOrderById(id);
		Seller seller = (Seller) session.getAttribute(UserType.SELLER);
		int userId = seller.getId();
		if(order.getSellerId() != userId){
			throw new UnauthorizedException();
		}
		return new ModelAndView("/seller/order/order-print")
			.addObject("order", order);
	}
	/**
	 * 填写快递信息
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/seller/order/send/{orderId}")
	public ModelAndView send(@PathVariable int orderId){
		Order order = orderService.getOrderById(orderId);
		return new ModelAndView("/seller/order/order-send").addObject("order",order);
	}
	/**
	 * 更新快递信息
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/seller/order/updateShipping/{orderId}")
	public ModelAndView updateShipping(@PathVariable int orderId){
		Order order = orderService.getOrderById(orderId);
		return new ModelAndView("/seller/order/order-updatesend").addObject("order",order);
	}
	@RequestMapping(value="/seller/order/send",method=RequestMethod.POST)
	public String sendPackage(
			@RequestParam int orderId,
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
	
	@RequestMapping(value="/seller/order/updateShipping",method=RequestMethod.POST)
	public String updateShipping(
			@RequestParam int orderId,
			@RequestParam String sendAt, 
			@RequestParam String carrier, 
			@RequestParam String trackingWeb, 
			@RequestParam String trackingId, 
			HttpSession session
			){
		Order order = orderService.getOrderById(orderId);
		order.setCarrier(carrier);
		order.setTrackingWeb(trackingWeb);
		order.setTrackingId(trackingId);
		orderService.updateOrderBySeller(order);
		return "redirect:/seller/order/show/"+orderId;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
}
