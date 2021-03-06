package com.omartech.tdg.action;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.exception.UnauthorizedException;
import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.ClaimService;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.OrderRecordService;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.ClaimRelation;
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
	@Autowired
	private ClaimService claimService;
	
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
//		System.out.println("status: " + statusCode);
		if(userType.equals(UserType.SELLER)){
			Seller seller = (Seller) session.getAttribute(UserType.SELLER);
			userId = seller.getId();
			orders = orderService.getSellerOrdersByStatusAndPage(userId, statusCode, page);
		}else if(userType.equals(UserType.CUSTOMER)){
			Customer customer = (Customer)session.getAttribute(UserType.CUSTOMER);
			userId = customer.getId();
//			System.out.println("customerid: " +customer.getId());
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
		if(order != null){
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
			int status = order.getOrderStatus();
			ClaimItem claimItem = null;
			if(status == OrderStatus.COMPLAIN){
				claimItem = claimService.getClaimItemByClaimTypeAndItemId(ClaimRelation.Claim, orderId);
			}else if(status == OrderStatus.RETURN){
				claimItem = claimService.getClaimItemByClaimTypeAndItemId(ClaimRelation.Return, orderId);
			}
			return new ModelAndView("/"+userType+"/order/order-show")
			.addObject("order", order)
			.addObject("orderRecords", records)
			.addObject("claimItem", claimItem);
		}else{
			return new ModelAndView("/"+userType+"/error/orderNotExist");
		}
			
		
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
