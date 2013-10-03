package com.omartech.tdg.action.seller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.BrandService;

@Controller
@RequestMapping("/seller/")
public class SellerBrandAction {
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping("brandadd")
	public String brandadd(){
		return "seller/product/brandadd";
	}
	
	@RequestMapping("addbrand")
	public String addBrand(@RequestParam String name, @RequestParam String description, HttpSession session){
		
		Seller seller = (Seller)session.getAttribute("seller");
		int sellerId = seller.getId();
		Brand brand = new Brand();
		brand.setName(name);
		brand.setDescription(description);
		brand.setSellerId(sellerId);
		brandService.insertBrand(brand);
		System.out.println("brand.getId: "+brand.getId());
		return "redirect:/seller/listbrand";
	}
	
	@RequestMapping("brandedit")
	public ModelAndView brandedit(@RequestParam int id){
		Brand brand = brandService.getBrandById(id);
		return new ModelAndView("seller/product/brandedit").addObject("brand", brand);
	}
	@RequestMapping("editbrand")
	public String editBrand(@RequestParam int id, @RequestParam String name, @RequestParam String description, HttpSession session){
		
		Seller seller = (Seller)session.getAttribute("seller");
		int sellerId = seller.getId();
		Brand brand = brandService.getBrandById(id);
		brand.setName(name);
		brand.setDescription(description);
		brand.setSellerId(sellerId);
		brandService.updateBrand(brand);
		
		return "redirect:/seller/listbrand";
	}
	
	@RequestMapping("listbrand")
	public ModelAndView listBrand(@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize, HttpSession session){
		Seller seller = (Seller)session.getAttribute("seller");
		int sellerId = seller.getId();
		Page page = new Page(pageNo, pageSize);
		List<Brand> brands =  brandService.getBrandListByPageAndSellerId(sellerId, page);
		return new ModelAndView("seller/product/brandlist").addObject("brands", brands).addObject("pageNo", pageNo);
	}
	@RequestMapping("branddelete")
	public String deleteBrand(@RequestParam int id){
		brandService.deleteBrand(id);
		return "redirect:/seller/listbrand";
	}
	@RequestMapping("/changestatus")
	public String changeProductStatus(@RequestParam int brandId, @RequestParam int status){
		brandService.updateBrandStatus(brandId, status);
		return "redirect:/seller/listbrand";
	}

}
