package com.omartech.tdg.action;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.BrandMapper;
import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.ProductParameter;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.ProductParameterService;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductAction {
	@Autowired
	private ProductService productService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private BrandMapper brandMapper;
	@Autowired
	private ProductParameterService productParameterService;
	
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable int id, Locale locale){
		System.out.println("locale:"+locale);
		Product product = productService.getProductById(id);
		int brandId = product.getBrandId();
		Brand brand = brandMapper.getBrandById(brandId);

		ProductParameter color = productParameterService.getProductParameterByEnglish("color");
		List<ProductParameter> colors = productParameterService.getProductParametersByParentId(color.getId());
		
		ProductParameter size = productParameterService.getProductParameterByEnglish("size");
		List<ProductParameter> sizes = productParameterService.getProductParametersByParentId(size.getId());
		
		List<Item> items = itemService.getItemsByProductId(id); 
		return new ModelAndView("/customer/product/show")
		.addObject("product", product)
		.addObject("items", items)
		.addObject("brand", brand)
		.addObject("colors", colors)
		.addObject("sizes", sizes)
		.addObject("locale", locale);
	}
	
	@ResponseBody
	@RequestMapping(value="/{id}.json",method=RequestMethod.GET)
	public Product showProducttoJson(@PathVariable int id){
		
		Product product = productService.getProductById(id);
		
		return product;
	}
	
	@ResponseBody
	@RequestMapping(value="/item/{id}.json",method=RequestMethod.GET)
	public List<Item> showProductItemtoJson(@PathVariable int id){
		
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

	public BrandMapper getBrandMapper() {
		return brandMapper;
	}

	public void setBrandMapper(BrandMapper brandMapper) {
		this.brandMapper = brandMapper;
	}

	public ProductParameterService getProductParameterService() {
		return productParameterService;
	}

	public void setProductParameterService(
			ProductParameterService productParameterService) {
		this.productParameterService = productParameterService;
	}
}
