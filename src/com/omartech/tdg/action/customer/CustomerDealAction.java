package com.omartech.tdg.action.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.omartech.tdg.model.Cart;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.service.ItemService;

@Controller
public class CustomerDealAction {

	private ItemService itemService;
	
	@ResponseBody
	@RequestMapping("/addtocart")
	public String addtoCart(
			@RequestParam int id,
			@RequestParam int number,
			@CookieValue(value = "cart", required = false) String cart,
			HttpServletResponse response
			){
		
		Item item = itemService.getItemById(id);
		List<Cart> carts = new ArrayList<Cart>();
		Gson gson = new Gson();
		if(cart != null && cart.length() > 1){
			carts = gson.fromJson(cart, new TypeToken<List<Cart>>() {}.getType());
		}
		boolean existFlag = false;
		if(carts.size() != 0){
			for(Cart c : carts){
				if(c.getSkuID() == id){
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
