package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.CountryMapper;
import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.OrderItem;
@Service
public class CartService {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CountryMapper countryMapper;
	
	public OrderItem createOrderItemFromItem(Item item, int count){
		OrderItem orderItem = new OrderItem(item);
		orderItem.setNum(count);
		
		float price = itemService.getPriceByItemId(item.getId(), count);
		orderItem.setPrice(price);
		
		float priceRMB = Coinage.compute(orderItem.getCoinage(), price);
		orderItem.setPriceRMB(priceRMB);
		
		float ifee = item.getInternationalShippingFee();
		float ifeeRMB = Coinage.compute(orderItem.getCoinage(), ifee);
		orderItem.setIfeeRMB(ifeeRMB);
		
		int countryCode = item.getCountryCode();
		Country country = countryMapper.getCountryById(countryCode);
		String countryName = country.getNameInChinese();
		orderItem.setShippingCountry(countryName);
		
		return orderItem;
	}

	
	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
	
}
