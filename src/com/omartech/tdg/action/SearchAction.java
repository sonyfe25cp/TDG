package com.omartech.tdg.action;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/search")
public class SearchAction {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/byname")
	public ModelAndView searchByName(@RequestParam String name,
			@RequestParam(value="pageNo", required = false, defaultValue = "0")int pageNo,
			@RequestParam(value="pageSize", required = false, defaultValue = "30")int pageSize,
			Locale locale
			){
		List<Product> products = productService.searchProductByName(name, new Page(pageNo,pageSize));
		
		return new ModelAndView("/customer/product/list-for-search").addObject("products", products)
				.addObject("pageNo", pageNo)
				.addObject("locale", locale)
				.addObject("searchWord", name);
	}

	@RequestMapping("/BySellerId")
	public ModelAndView searchBySeller(@RequestParam int sellerId, Locale locale){
		List<Product> products = productService.getProductListByPageAndSeller(null, sellerId);
		return new ModelAndView("/customer/product/list-for-search").addObject("products", products)
				.addObject("locale", locale);
	}
	
	@RequestMapping("/ByProductId")
	public String searchByProductId(@RequestParam int productId){
		return "redirect:/product/"+productId;
	}
	
	@RequestMapping("/adSearch")
	public String adSearchShow(){
		return "/customer/search/ad-search";
	}
	
	
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
