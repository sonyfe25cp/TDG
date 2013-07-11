package com.omartech.tdg.action.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class CustomerProductAction {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/list-for-index")
	public ModelAndView productList(@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
									@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize){
		List<Product> products = productService.getProductListByPage(new Page(pageNo,pageSize));
		return new ModelAndView("/customer/product/list-for-index").addObject("products", products).addObject("pageNo",pageNo);
	}

	
	@RequestMapping("/{id}")
	public ModelAndView showProduct(@PathVariable int id){
		Product product = productService.getProductById(id);
		return new ModelAndView("/customer/product/show").addObject("product", product);
	}
	
	@RequestMapping("/category/{categoryId}")
	public ModelAndView showProductsInCategory(
			@PathVariable int categoryId,
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize){
		List<Product> products = productService.getProductsInCategoryByPage(categoryId,new Page(pageNo, pageSize));
		return new ModelAndView("/customer/product/list-for-search").addObject("products", products);
	}
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
