package com.omartech.tdg.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.model.ItemProperty;
import com.omartech.tdg.model.SaleProperty;
import com.omartech.tdg.service.ItemPropertyService;
import com.omartech.tdg.service.SalePropertyService;
/*
 * 通用属性ajax + 销售属性ajax
 */
@Controller
public class PropertyAction {

	@Autowired
	private ItemPropertyService itemPropertyService;
	@Autowired
	private SalePropertyService salePropertyService;
	
	@RequestMapping("/itemproperies/{id}")
	@ResponseBody
	public ItemProperty getItemPropertyByCategoryId(@PathVariable int id){
		ItemProperty itemProperty = itemPropertyService.getItemPropertyByCategoryId(id);
		return itemProperty;
	}
	@RequestMapping("/saleproperies/{id}")
	@ResponseBody
	public SaleProperty getSalePropertyByCategoryId(@PathVariable int id){
		SaleProperty saleProperty = salePropertyService.getSalePropertyByCategoryId(id);
		return saleProperty;
	}
	public ItemPropertyService getItemPropertyService() {
		return itemPropertyService;
	}
	public void setItemPropertyService(ItemPropertyService itemPropertyService) {
		this.itemPropertyService = itemPropertyService;
	}
	public SalePropertyService getSalePropertyService() {
		return salePropertyService;
	}
	public void setSalePropertyService(SalePropertyService salePropertyService) {
		this.salePropertyService = salePropertyService;
	}
}
