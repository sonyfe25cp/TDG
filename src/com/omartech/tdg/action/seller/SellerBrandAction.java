package com.omartech.tdg.action.seller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.BrandMapper;
import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;

@Controller
@RequestMapping("/seller/")
public class SellerBrandAction {
	@Autowired
	private BrandMapper brandMapper;
	
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
		brandMapper.insertBrand(brand);
		System.out.println("brand.getId: "+brand.getId());
		return "redirect:/seller/listbrand";
	}
	
	@RequestMapping("brandedit")
	public ModelAndView brandedit(@RequestParam int id){
		Brand brand = brandMapper.getBrandById(id);
		return new ModelAndView("seller/product/brandedit").addObject("brand", brand);
	}
	@RequestMapping("editbrand")
	public String editBrand(@RequestParam int id, @RequestParam String name, @RequestParam String description, HttpSession session){
		
		Seller seller = (Seller)session.getAttribute("seller");
		int sellerId = seller.getId();
		Brand brand = brandMapper.getBrandById(id);
		brand.setName(name);
		brand.setDescription(description);
		brand.setSellerId(sellerId);
		brandMapper.updateBrand(brand);
		
		return "redirect:/seller/listbrand";
	}
	
	@RequestMapping("listbrand")
	public ModelAndView listBrand(@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page = new Page(pageNo, pageSize);
		List<Brand> brands =  brandMapper.getBrandListByPage(page);
		return new ModelAndView("seller/product/brandlist").addObject("brands", brands).addObject("pageNo", pageNo);
	}
	@RequestMapping("branddelete")
	public String deleteBrand(@RequestParam int id){
		brandMapper.deleteBrand(id);
		return "redirect:/seller/listbrand";
	}

	public BrandMapper getBrandMapper() {
		return brandMapper;
	}
	public void setBrandMapper(BrandMapper brandMapper) {
		this.brandMapper = brandMapper;
	}
}
