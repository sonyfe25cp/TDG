package com.omartech.tdg.action.customer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.model.Cart;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.CustomerAddress;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;
import com.omartech.tdg.service.CartService;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;

@Controller
public class CustomerDealAction {
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/customer/paymoney")
	public ModelAndView pay(@RequestParam int orderId){
		Order order = orderService.getOrderById(orderId);
		return new ModelAndView("/customer/order/pay").addObject("order", order);
	}
	
	@RequestMapping("/customer/paymoney/callback")
	public String paymoneyCallback(@RequestParam int orderId){
		orderService.updateOrderStatus(OrderStatus.PAID, orderId);
		return "redirect:/customer/order/show/"+orderId;
	}
	
	
	@RequestMapping("/order/create")
	@ResponseBody
	public Order createOrder(
			@RequestParam int addressId,
			@RequestParam String orderItems,
			HttpSession session
			){
		Customer customer = (Customer)session.getAttribute("customer");
		CustomerAddress customerAddress = customerAddressMapper.getCustomerAddressById(addressId);
		Order order = new Order();
		order.setName(customerAddress.getName());
		order.setAddress(customerAddress.getAddress());
		order.setCity(customerAddress.getCity());
		order.setCountry(customerAddress.getCountry());
		order.setPostCode(customerAddress.getPostCode());
		order.setCustomerId(customer.getId());
		order.setCreateAt(new Date());
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		Gson gson = new Gson();
		if(orderItems!=null && orderItems.length()>1){
			orderItemList = gson.fromJson(orderItems, new TypeToken<List<OrderItem>>(){}.getType());
		}
		List<OrderItem> newList = new ArrayList<OrderItem>();
		for(OrderItem oi : orderItemList){
			int itemId = oi.getItemId();
			Item item = itemService.getItemById(itemId);
			OrderItem noi = cartService.createOrderItemFromItem(item, oi.getNum());
			newList.add(noi);
		}
		order.setOrderItems(newList);
		order.setOrderStatus(OrderStatus.NOPAY);
		orderService.insertOrder(order);
		return order;
	}
	
	@RequestMapping("/cart")
	public ModelAndView showCart(
			@CookieValue(value = "cart", required = false) String cart,
			HttpSession session,
			Locale locale
			){
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer == null){
			return new ModelAndView("/customer/auth/login");
		}
		int id = customer.getId();
		List<CustomerAddress> addresses = customerAddressMapper.getCustomerAddressByCustomerId(id);
		List<Cart> carts = new ArrayList<Cart>();
		Gson gson = new Gson();
		if(cart != null && cart.length() > 1){
			carts = gson.fromJson(cart, new TypeToken<List<Cart>>() {}.getType());
		}else{
			return new ModelAndView("/customer/order/cart-list");
		}
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		for(Cart tmp : carts){
			int itemId = tmp.getItemId();
			Item item = itemService.getItemById(itemId);
			OrderItem orderItem = cartService.createOrderItemFromItem(item, tmp.getNumber());
			orderItems.add(orderItem);
		}
		return new ModelAndView("/customer/order/cart-list").addObject("orderItems", orderItems).addObject("addresses", addresses).addObject("locale", locale);
	}
	@ResponseBody
	@RequestMapping("/deletefromcart")
	public String deleteFromCart(
			@RequestParam int sku,//Item.itemId
			@CookieValue(value = "cart", required = false) String cart,
			HttpServletResponse response
			){
		List<Cart> carts = new ArrayList<Cart>();
		Gson gson = new Gson();
		if(cart != null && cart.length() > 1){
			carts = gson.fromJson(cart, new TypeToken<List<Cart>>() {}.getType());
		}
		List<Cart> newCarts = new ArrayList<Cart>();
		if(carts.size() != 0){
			for(Cart c : carts){
				if(c.getItemId() != sku){
					newCarts.add(c);
				}
			}
		}
		String json = gson.toJson(newCarts);
		response.addCookie(new Cookie("cart", json));
		return "success";
	}
	@ResponseBody
	@RequestMapping("/addtocart")
	public String addtoCart(
			@RequestParam int sku,//若无单品则传productId
			@RequestParam int number,
			@RequestParam int hasChildren,
			@CookieValue(value = "cart", required = false) String cart,
			HttpServletResponse response
			){
		List<Cart> carts = new ArrayList<Cart>();
		Gson gson = new Gson();
		if(cart != null && cart.length() > 1){
			carts = gson.fromJson(cart, new TypeToken<List<Cart>>() {}.getType());
		}
		boolean existFlag = false;
		if(carts.size() != 0){
			for(Cart c : carts){
				if(c.getItemId() == sku){
					number = c.getNumber()+number;
					c.setNumber(number);
					existFlag = true;
				}
			}
		}
		if(!existFlag){
			Cart nc = new Cart();
			nc.setNumber(number);
			nc.setItemId(sku);
			carts.add(nc);
		}
		String json = gson.toJson(carts);
		response.addCookie(new Cookie("cart", json));
		return "success";
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

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
}
