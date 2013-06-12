package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductAction {

	private ProductService productService;
	
	@RequestMapping(value="/show",method=RequestMethod.GET)
	public ModelAndView login(@RequestParam(value="id",required=false) long id){
		
		Product product = productService.getProductById(id);
		
		return new ModelAndView("product/show").addObject("product", product);
	}
	
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
