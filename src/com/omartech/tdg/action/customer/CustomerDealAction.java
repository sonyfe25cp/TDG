package com.omartech.tdg.action.customer;

import java.util.ArrayList;
import java.util.List;

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
	
	
	@RequestMapping("/order/create")
	public ModelAndView createOrder(
			@RequestParam int addressId,
			@RequestParam String orderItems,
			HttpSession session
			){
		Customer customer = (Customer)session.getAttribute("customer");
		CustomerAddress customerAddress = customerAddressMapper.getCustomerAddressById(addressId);
		Order order = new Order();
		order.setAddress(customerAddress.getAddress());
		order.setCity(customerAddress.getCity());
		order.setCountry(customerAddress.getCountry());
		order.setPostCode(customerAddress.getPostCode());

		order.setCustomerId(customer.getId());
		
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();

		order.setOrderItems(orderItemList);
		order.setOrderStatus(OrderStatus.NOPAY);
		
		return null;
	}
	
	@RequestMapping("/cart")
	public ModelAndView showCart(
			@CookieValue(value = "cart", required = false) String cart
			){
		List<Cart> carts = new ArrayList<Cart>();
		Gson gson = new Gson();
		if(cart != null && cart.length() > 1){
			carts = gson.fromJson(cart, new TypeToken<List<Cart>>() {}.getType());
		}else{
			new ModelAndView("/customer/order/cart-list");
		}
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		for(Cart tmp : carts){
			int sku =  tmp.getSkuID();
			Item item = itemService.getItemBySku(sku);
			OrderItem orderItem = new OrderItem();
			orderItem.setSkuId(sku);
			orderItem.setProductId(item.getProductId());
			orderItem.setNum(tmp.getNumber());
			orderItem.setName(item.getName());
			orderItem.setPrice(item.getRetailPrice());
			orderItems.add(orderItem);
		}
		return new ModelAndView("/customer/order/cart-list").addObject("orderItems", orderItems);
	}
	
	@ResponseBody
	@RequestMapping("/addtocart")
	public String addtoCart(
			@RequestParam int id,
			@RequestParam int number,
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
				if(c.getSkuID() == id){
					number = c.getNumber()+number;
					c.setNumber(number);
					existFlag = true;
				}
			}
		}
		if(!existFlag){
			Cart nc = new Cart();
			nc.setNumber(number);
			nc.setSkuID(id);
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
}
