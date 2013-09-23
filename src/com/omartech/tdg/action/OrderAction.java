package com.omartech.tdg.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.exception.UnauthorizedException;
import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.OrderRecordService;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.JsonMessage;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.UserType;

@Controller
public class OrderAction {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderRecordService orderRecordService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	@Autowired
	private CustomerMapper customerMapper;
	
	@RequestMapping("/orders/complain")
	@ResponseBody
	public JsonMessage complainOrder(int orderId, int reasonId, Locale locale){
		Order order = orderService.getOrderById(orderId);
		JsonMessage message = new JsonMessage();
		Date orderDate = order.getCreateAt();
		Date now = new Date(System.currentTimeMillis());
		int distance = 0;
		switch(reasonId){
		case 1:
			distance = daysOfTwo(orderDate, now);
			if(distance < 3){
				message.setFlag(false);
				if(locale.equals("zh_CN")){
					message.setObject("我们允许卖家在收到您的订单后，有三个工作日的处理发货时间，您只有在下单3个工作日之后，卖家还没有提供发货信息时，您的投诉才能被受理。");
				}else{
					message.setObject("我们允许卖家在收到您的订单后，有三个工作日的处理发货时间，您只有在下单3个工作日之后，卖家还没有提供发货信息时，您的投诉才能被受理。in english");
				}
			}else{
				orderService.updateOrderStatus(OrderStatus.COMPLAIN, orderId);
			}
			break;
		case 2:
			
			break;
		case 3:
			distance = daysOfTwo(orderDate, now);
			if(distance < 7){
				message.setFlag(false);
				if(locale.equals("zh_CN")){
					message.setObject("我们允许卖家在收到您的订单后,有七个工作日的处理运货到您指定的转运仓库,您 只有在下订单7个工作日后,还没收到的货的,您的投诉才被接受处理。请选择别的正确投诉类型。");
				}else{
					message.setObject("我们允许卖家在收到您的订单后,有七个工作日的处理运货到您指定的转运仓库,您 只有在下订单7个工作日后,还没收到的货的,您的投诉才被接受处理。请选择别的正确投诉类型。in english");
				}
			}else{
				orderService.updateOrderStatus(OrderStatus.COMPLAIN, orderId);
			}
			break;
		default:
			orderService.updateOrderStatus(OrderStatus.COMPLAIN, orderId);
			break;
				
		}
		if(message.isFlag()){
			if(locale.equals("zh_CN"))
				message.setObject("投诉成功，请等待系统处理~");
			else
				message.setObject("投诉成功，请等待系统处理~in english");
		}
		return message;
	}
	public static int daysOfTwo(Date fDate, Date oDate) {
	       Calendar aCalendar = Calendar.getInstance();
	       aCalendar.setTime(fDate);
	       int day1 = aCalendar.get(Calendar.DAY_OF_YEAR);
	       aCalendar.setTime(oDate);
	       int day2 = aCalendar.get(Calendar.DAY_OF_YEAR);
	       return day2 - day1;
	}
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
		if(status == null){
			System.out.println("status == null");
		}
		int statusCode = OrderStatus.statusToInt(status);
		System.out.println("status: " + statusCode);
		if(userType.equals(UserType.SELLER)){
			Seller seller = (Seller) session.getAttribute(UserType.SELLER);
			userId = seller.getId();
			orders = orderService.getSellerOrdersByStatusAndPage(userId, statusCode, page);
		}else if(userType.equals(UserType.CUSTOMER)){
			Customer customer = (Customer)session.getAttribute(UserType.CUSTOMER);
			userId = customer.getId();
			System.out.println("customerid: " +customer.getId());
			orders = orderService.getCustomerOrdersByStatusAndPage(userId, statusCode, page);
		}else{
			orders = orderService.getOrdersByStatusAndPage(statusCode, page);
		}
		
		return new ModelAndView("/"+userType+"/order/order-list")
			.addObject("orders", orders)
			.addObject("pageNo", pageNo)
			.addObject("status", status);
	}
	
	@RequestMapping("/{userType}/order/cancel/{id}")
	public String cancelOrder(@PathVariable int id, @PathVariable String userType){
		orderService.updateOrderStatus(OrderStatus.CANCEL, id);
		return "redirect:/"+userType+"/orders/all";
	}
	
	@RequestMapping("/{userType}/order/show/{id}")
	public ModelAndView showOrder(
			@PathVariable String userType,
			@PathVariable int id,
			HttpSession session
			){
		
		Order order = orderService.getOrderById(id);
		int userId = 0;
		if(userType.equals(UserType.SELLER)){
			Seller seller = (Seller) session.getAttribute(UserType.SELLER);
			userId = seller.getId();
			if(order.getSellerId() != userId){
				throw new UnauthorizedException();
			}
		}else if(userType.equals(UserType.CUSTOMER)){
			Customer customer = (Customer)session.getAttribute(UserType.CUSTOMER);
			userId = customer.getId();
			if(order.getCustomerId() != userId){
				throw new UnauthorizedException();
			}
		}else{
			
		}
		
		int orderId = order.getId();
		List<OrderRecord> records = orderRecordService.getOrderRecordsByOrderId(orderId);
		
		return new ModelAndView("/"+userType+"/order/order-show")
			.addObject("order", order)
			.addObject("orderRecords", records);
	}
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public OrderRecordService getOrderRecordService() {
		return orderRecordService;
	}
	public void setOrderRecordService(OrderRecordService orderRecordService) {
		this.orderRecordService = orderRecordService;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public CustomerAddressMapper getCustomerAddressMapper() {
		return customerAddressMapper;
	}

	public void setCustomerAddressMapper(CustomerAddressMapper customerAddressMapper) {
		this.customerAddressMapper = customerAddressMapper;
	}

	public CustomerMapper getCustomerMapper() {
		return customerMapper;
	}

	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}
	
	
	
}
