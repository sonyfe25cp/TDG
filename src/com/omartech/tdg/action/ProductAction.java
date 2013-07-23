package com.omartech.tdg.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductAction {
	@Autowired
	private ProductService productService;
	@Autowired
	private ItemService itemService;
	
	
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable long id){
		
		Product product = productService.getProductById(id);
		
		List<Item> items = itemService.getItemsByProductId(id); 
		
		return new ModelAndView("/customer/product/show").addObject("product", product).addObject("items", items);
	}
	
	@ResponseBody
	@RequestMapping(value="/{id}.json",method=RequestMethod.GET)
	public Product showProducttoJson(@PathVariable long id){
		
		Product product = productService.getProductById(id);
		
		return product;
	}
	
	@ResponseBody
	@RequestMapping(value="/item/{id}.json",method=RequestMethod.GET)
	public List<Item> showProductItemtoJson(@PathVariable long id){
		
		List<Item> items = itemService.getItemsByProductId(id); 
		
		return items;
	}
	
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
}
