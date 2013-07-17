//package com.omartech.tdg.action.admin;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.omartech.tdg.model.SaleProperty;
//import com.omartech.tdg.model.Page;
//import com.omartech.tdg.service.SalePropertyService;
//
//@Controller
//@RequestMapping("/admin/saleproperty/")
//public class AdminProductSalePropertyAction {
//	@Autowired
//	private SalePropertyService salePropertyService;
//	
//	@RequestMapping("list")
//	public ModelAndView listAllSaleProperty(
//			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
//			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
//			){
//		
//		List<SaleProperty> salePropertys = salePropertyService.getSalePropertyListByPage(new Page(pageNo, pageSize));
//		
//		return new ModelAndView("/admin/saleproperty/list").addObject("salePropertys", salePropertys).addObject("pageNo", pageNo);
//	}
//	
//	@RequestMapping("edit")
//	public ModelAndView editSaleProperty(@RequestParam int id){
//		SaleProperty saleProperty = salePropertyService.getSalePropertyById(id);
//		return new ModelAndView("/admin/saleproperty/edit").addObject("saleProperty", saleProperty);
//	}
//	
//	@RequestMapping("update")
//	public String editSaleProperty(@RequestParam int id, @RequestParam String name, @RequestParam String english){
//		SaleProperty saleProperty = salePropertyService.getSalePropertyById(id);
//		saleProperty.setName(name);
//		saleProperty.setEnglish(english);
//		salePropertyService.updateSaleProperty(saleProperty);
//		return "redirect:/admin/saleproperty/list";
//	}
//
//	public SalePropertyService getSalePropertyService() {
//		return salePropertyService;
//	}
//
//	public void setSalePropertyService(SalePropertyService salePropertyService) {
//		this.salePropertyService = salePropertyService;
//	}
//
//}
