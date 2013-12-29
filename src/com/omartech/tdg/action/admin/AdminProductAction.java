package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.service.EmailService;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.service.TranslatorAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.ProductStatus;
@RequestMapping("/admin/product")
@Controller
public class AdminProductAction {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private TranslatorAuthService translatorService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private SellerAuthService sellerAuthService;

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
		List<Product> products = null;
		ModelAndView mav = new ModelAndView("/admin/product/product-list");
		if(status == ProductStatus.Sellable){//sellable和unsellable是不同的接口
			products = productService.getSellableProductListByPage(page);
		}else if(status == ProductStatus.Unsellable){
			products = productService.getUnsellableProductListByPage(page);
		}else{
			products = productService.getProductListByPageAndStatus(page, status);
			if(status == 2){
				List<Translator> translators = translatorService.getTranslators();
				mav.addObject("translators", translators);
			}
		}
		mav.addObject("products", products).addObject("pageNo", pageNo).addObject("status", status);
		return mav;
	}
	@RequestMapping("/changestatus")
	public String changeProductStatus(@RequestParam int productId, @RequestParam int status){
		productService.updateProductStatus(productId, status);
		if(status == ProductStatus.ChinaListingCreated){
			Product product = productService.getSimpleProductById(productId);
			int sellerId = product.getSellerId();
			Seller seller = sellerAuthService.getSellerById(sellerId);
			emailService.sendEmailWhenReadyToSell(seller.getEmail());
		}
		return "redirect:/admin/product/listbystatus?status="+status;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
