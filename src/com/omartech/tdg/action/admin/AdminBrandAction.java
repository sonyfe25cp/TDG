package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.service.BrandService;
import com.omartech.tdg.service.TranslatorAuthService;
@RequestMapping("/admin/brand")
@Controller
public class AdminBrandAction {

	@Autowired
	private BrandService brandService;
	@Autowired
	private TranslatorAuthService translatorService;

	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable int id){
		Brand brand = brandService.getBrandById(id);
		return new ModelAndView("/admin/brand/brand-show").addObject("brand", brand);
	}
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, @RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page = new Page(pageNo,pageSize);
		
		List<Brand> brands = brandService.getBrandListByPage(page);
		
		return new ModelAndView("/admin/brand/brand-list").addObject("brands", brands).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/listbystatus")
	public ModelAndView listbystatus(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam int status){
		Page page = new Page(pageNo,pageSize);
		
		List<Brand> brands = brandService.getBrandListByPageAndStatus(page, status);
		ModelAndView mav = new ModelAndView("/admin/brand/brand-list").addObject("brands", brands).addObject("pageNo", pageNo).addObject("status", status);
		if(status == 2){
			List<Translator> translators = translatorService.getTranslators();
			mav.addObject("translators", translators);
		}
		return mav;
	}
	@RequestMapping("/changestatus")
	public String changeProductStatus(@RequestParam int brandId, @RequestParam int status){
		brandService.updateBrandStatus(brandId, status);
		return "redirect:/admin/brand/listbystatus?status="+status;
	}
	public BrandService getBrandService() {
		return brandService;
	}

	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	public TranslatorAuthService getTranslatorService() {
		return translatorService;
	}

	public void setTranslatorService(TranslatorAuthService translatorService) {
		this.translatorService = translatorService;
	}


}
