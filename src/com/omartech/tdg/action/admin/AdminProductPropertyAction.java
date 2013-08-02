package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.ItemSubProperty;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.SalePropertyValue;
import com.omartech.tdg.model.SaleSubProperty;
import com.omartech.tdg.service.ItemPropertyService;
import com.omartech.tdg.service.ItemSubPorpertyService;
import com.omartech.tdg.service.SalePropertyService;
import com.omartech.tdg.service.SaleSubPorpertyService;

@Controller
@RequestMapping("/admin/property")
public class AdminProductPropertyAction {
	@Autowired
	private SalePropertyService salePropertyService;
	@Autowired
	private SaleSubPorpertyService saleSubPorpertyService;
	@Autowired	
	private ItemPropertyService itemPropertyService;
	@Autowired
	private ItemSubPorpertyService itemSubPorpertyService;
	
	@RequestMapping("/salepropertyvalue/list")
	public ModelAndView listAllSalePropertyValue(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
			){
		List<SalePropertyValue> salePropertyValues = salePropertyService.getSalePropertyValuesByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/admin/salepropertyvalue/list").addObject("salePropertyValues", salePropertyValues).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/salepropertyvalue/edit")
	public ModelAndView editSalePropertyValue(@RequestParam int id){
		SalePropertyValue saleProperty = salePropertyService.getSalePropertyValueById(id);
		return new ModelAndView("/admin/salepropertyvalue/edit").addObject("salePropertyValue", saleProperty);
	}
	
	@RequestMapping("/salepropertyvalue/update")
	public String updateSalePropertyValue(@RequestParam int id, @RequestParam String name, @RequestParam String english){
		SalePropertyValue saleProperty = salePropertyService.getSalePropertyValueById(id);
		saleProperty.setName(name);
		saleProperty.setEnglish(english);
		salePropertyService.updateSalePropertyValue(saleProperty);
		return "redirect:/admin/property/salepropertyvalue/list";
	}
	
	@RequestMapping("/saleproperty/list")
	public ModelAndView listAllSaleProperty(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
			){
		List<SaleSubProperty> saleSubProperties = saleSubPorpertyService.getSaleSubPropertyListByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/admin/saleproperty/list").addObject("saleSubProperties", saleSubProperties).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/saleproperty/edit")
	public ModelAndView editSaleProperty(@RequestParam int id){
		SaleSubProperty saleSubProperty = saleSubPorpertyService.getSaleSubPropertyById(id);
		return new ModelAndView("/admin/saleproperty/edit").addObject("saleSubProperty", saleSubProperty);
	}
	
	@RequestMapping("/saleproperty/update")
	public String updateSaleProperty(@RequestParam int id, @RequestParam String name, @RequestParam String english){
		SaleSubProperty saleSubProperty = saleSubPorpertyService.getSaleSubPropertyById(id);
		saleSubProperty.setPname(name);
		saleSubProperty.setEnglish(english);
		saleSubPorpertyService.updateSaleSubPropertyById(saleSubProperty);
		return "redirect:/admin/property/saleproperty/list";
	}
	
	@RequestMapping("/itempropertyvalue/list")
	public ModelAndView listAllItemPropertyValue(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
			){
		List<BaseFeature> baseFeatures = itemPropertyService.getBaseFeatureListByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/admin/itempropertyvalue/list").addObject("baseFeatures", baseFeatures).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/itempropertyvalue/edit")
	public ModelAndView editItemPropertyValue(@RequestParam int id){
		BaseFeature baseFeature = itemPropertyService.getBaseFeatureById(id);
		return new ModelAndView("/admin/itempropertyvalue/edit").addObject("baseFeature", baseFeature);
	}
	
	@RequestMapping("/itempropertyvalue/update")
	public String updateItemPropertyValue(@RequestParam int id, @RequestParam String name, @RequestParam String english){
		BaseFeature baseFeature = itemPropertyService.getBaseFeatureById(id);
		baseFeature.setName(name);
		baseFeature.setEnglish(english);
		itemPropertyService.updateBaseFeature(baseFeature);
		return "redirect:/admin/property/itempropertyvalue/list";
	}
	
	@RequestMapping("/itemproperty/list")
	public ModelAndView listAllItemProperty(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
			){
		List<ItemSubProperty> itemSubProperties = itemSubPorpertyService.getItemSubPropertyListByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/admin/itemproperty/list").addObject("itemSubProperties", itemSubProperties).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/itemproperty/edit")
	public ModelAndView editItemProperty(@RequestParam int id){
		ItemSubProperty itemSubProperty = itemSubPorpertyService.getItemSubPropertyById(id);
		return new ModelAndView("/admin/itemproperty/edit").addObject("itemSubProperty", itemSubProperty);
	}
	
	@RequestMapping("/itemproperty/update")
	public String updateItemProperty(@RequestParam int id, @RequestParam String name, @RequestParam String english){
		ItemSubProperty itemSubProperty = itemSubPorpertyService.getItemSubPropertyById(id);
		itemSubProperty.setPname(name);
		itemSubProperty.setEnglish(english);
		itemSubPorpertyService.updateItemSubPropertyById(itemSubProperty);
		return "redirect:/admin/property/itemproperty/list";
	}

	public SalePropertyService getSalePropertyService() {
		return salePropertyService;
	}
	public void setSalePropertyService(SalePropertyService salePropertyService) {
		this.salePropertyService = salePropertyService;
	}
	public ItemPropertyService getItemPropertyService() {
		return itemPropertyService;
	}
	public void setItemPropertyService(ItemPropertyService itemPropertyService) {
		this.itemPropertyService = itemPropertyService;
	}

	public SaleSubPorpertyService getSaleSubPorpertyService() {
		return saleSubPorpertyService;
	}

	public void setSaleSubPorpertyService(
			SaleSubPorpertyService saleSubPorpertyService) {
		this.saleSubPorpertyService = saleSubPorpertyService;
	}

	public ItemSubPorpertyService getItemSubPorpertyService() {
		return itemSubPorpertyService;
	}

	public void setItemSubPorpertyService(
			ItemSubPorpertyService itemSubPorpertyService) {
		this.itemSubPorpertyService = itemSubPorpertyService;
	}
}
