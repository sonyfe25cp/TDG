package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.OrderItem;
@Service
public class CartService {

	@Autowired
	private ItemService itemService;
	
	public OrderItem createOrderItemFromItem(Item item, int count){
		OrderItem orderItem = new OrderItem(item);
		orderItem.setNum(count);
		float price = itemService.getPriceByItemId(item.getId(), count);
		orderItem.setPrice(price);
		float priceRMB = Coinage.compute(orderItem.getCoinage(), price);
		orderItem.setPriceRMB(priceRMB);
		return orderItem;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
	
}
