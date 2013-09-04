package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.ProductParameter;
import com.omartech.tdg.service.ProductParameterService;

@RequestMapping("/admin/productParameter")
@Controller
public class AdminProductParameterAction {
	
	@Autowired
	private ProductParameterService parameterService;
	
	@RequestMapping("/list")
	public ModelAndView listProductParameters(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<ProductParameter> productParameters = parameterService.getProductParametersByParentId(0);
		return new ModelAndView("/admin/productParameter/list")
			.addObject("productParameters", productParameters)
			.addObject("pageNo", pageNo);
	}
	@RequestMapping("/new")
	public ModelAndView newProductParameter(@RequestParam(value="parentId", defaultValue= "0", required = false) int parentId){
		ProductParameter productParameter = parameterService.getProductParameterById(parentId);
		return new ModelAndView("/admin/productParameter/new").addObject("productParameter", productParameter).addObject("parentId", parentId);
	}
	
	@RequestMapping("/create")
	public ModelAndView createProductParameter(@RequestParam String name, 
			@RequestParam String english,
			@RequestParam String pvalue,
			@RequestParam int parentId,
			@RequestParam int level){
		ProductParameter productParameter = new ProductParameter();
		productParameter.setName(name);
		productParameter.setEnglish(english);
		productParameter.setPvalue(pvalue);
		productParameter.setLevel(level);
		productParameter.setParentId(parentId);
		parameterService.insertProductParameter(productParameter);
		return new ModelAndView("/admin/productParameter/list").addObject("message", "添加成功");
	}

}
