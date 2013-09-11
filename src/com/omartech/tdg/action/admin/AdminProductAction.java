package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.service.TranslatorAuthService;
@RequestMapping("/admin/product")
@Controller
public class AdminProductAction {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private TranslatorAuthService translatorService;

	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, @RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page = new Page(pageNo,pageSize);
		
		List<Product> products = productService.getProductListByPage(page);
		
		return new ModelAndView("/admin/product/product-list").addObject("products", products).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/listbystatus")
	public ModelAndView listbystatus(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam int status){
		Page page = new Page(pageNo,pageSize);
		
		List<Product> products = productService.getProductListByPageAndStatus(page, status);
		List<Translator> translators = translatorService.getTranslators();
		ModelAndView mav = new ModelAndView("/admin/product/product-list").addObject("products", products).addObject("pageNo", pageNo).addObject("status", status);
		if(status == 2){
			mav.addObject("translators", translators);
		}
		return mav;
	}
	@RequestMapping("/changestatus")
	public String changeProductStatus(@RequestParam int productId, @RequestParam int status){
		productService.updateProductStatus(productId, status);
		return "redirect:/admin/product/listbystatus?status="+status;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
