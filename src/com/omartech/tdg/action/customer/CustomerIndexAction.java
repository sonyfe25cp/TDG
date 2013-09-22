package com.omartech.tdg.action.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.utils.ProductStatus;

@Controller
public class CustomerIndexAction {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize){
		List<Product> products = productService.getProductListByPageAndStatus(new Page(pageNo,pageSize), ProductStatus.Sellable);
		return new ModelAndView("customer/index")
					.addObject("products", products)
					.addObject("pageNo",pageNo);
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
