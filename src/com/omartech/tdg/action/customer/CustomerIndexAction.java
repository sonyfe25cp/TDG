package com.omartech.tdg.action.customer;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;

@Controller
public class CustomerIndexAction {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="30") int pageSize, 
			Locale locale,
			HttpServletRequest request, 
			HttpServletResponse response
			){
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);  
		LocaleEditor localeEditor = new LocaleEditor();  
        localeEditor.setAsText("zh_CN");
        localeResolver.setLocale(request, response, (Locale)localeEditor.getValue());
		
		
		List<Product> products = productService.getSellableProductListByPage(new Page(pageNo,pageSize));
		return new ModelAndView("customer/index")
					.addObject("products", products)
					.addObject("pageNo",pageNo)
					.addObject("locale", locale);
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
