package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductAction {

	private ProductService productService;
	
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable long id){
		
		Product product = productService.getProductById(id);
		
		return new ModelAndView("/customer/product/show").addObject("product", product);
	}
	
	@ResponseBody
	@RequestMapping(value="/{id}.json",method=RequestMethod.GET)
	public Product showProducttoJson(@PathVariable long id){
		
		Product product = productService.getProductById(id);
		
		return product;
	}
	
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
