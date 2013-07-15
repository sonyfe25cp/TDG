package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.model.ItemProperty;
import com.omartech.tdg.model.ItemSubProperty;

/*
 * 
 */
@Service
public class ItemPropertyService {
	@Autowired
	private ItemSubPorpertyService itemSubPropertyService;
	
	public ItemProperty getItemPropertyByCategoryId(int cid){
		List<ItemSubProperty> subProperties = itemSubPropertyService.getItemSubPropertyListByCategoryId(cid);
		ItemProperty itemProperty = new ItemProperty();
		itemProperty.setCid(cid);
		itemProperty.setSubProperties(subProperties);
		return itemProperty;
	}

	public ItemSubPorpertyService getItemSubPropertyService() {
		return itemSubPropertyService;
	}

	public void setItemSubPropertyService(
			ItemSubPorpertyService itemSubPropertyService) {
		this.itemSubPropertyService = itemSubPropertyService;
	}
	
}
