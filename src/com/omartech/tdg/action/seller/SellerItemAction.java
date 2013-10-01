package com.omartech.tdg.action.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Item;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.utils.JsonMessage;
import com.omartech.tdg.utils.ProductStatus;

@Controller
@RequestMapping("/seller/item/")
public class SellerItemAction {
	@Autowired
	private ItemService itemService;

	@RequestMapping("/add")
	public ModelAndView addItem(@RequestParam int sku){
		
		return new ModelAndView();
	}
	
	@RequestMapping("/edit")
	public ModelAndView editItem(@RequestParam int itemId){
		Item item = itemService.getItemById(itemId);
		return new ModelAndView("/seller/product/item-edit").addObject("item", item);
	}
	@ResponseBody
	@RequestMapping(value =  "/update", method = RequestMethod.POST)
	public JsonMessage updateItem(@RequestParam int itemId){
		
		return null;
	}
	@ResponseBody
	@RequestMapping("/delete")
	public JsonMessage deleteItem(@RequestParam int itemId){
    itemService.deleteItem(itemId);
		return new JsonMessage(true, "delete it successful~");
	}
}
