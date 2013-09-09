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
	private ProductParameterService productParameterService;
	
	@RequestMapping("/list")
	public ModelAndView listProductParameters(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<ProductParameter> productParameters = productParameterService.getProductParametersByParentId(0);
		return new ModelAndView("/admin/productParameter/list")
			.addObject("productParameters", productParameters)
			.addObject("pageNo", pageNo);
	}
	@RequestMapping("/new")
	public ModelAndView newProductParameter(@RequestParam(value="parentId", defaultValue= "0", required = false) int parentId){
		ProductParameter productParameter = productParameterService.getProductParameterById(parentId);
		return new ModelAndView("/admin/productParameter/new").addObject("parent", productParameter);
	}
	
	@RequestMapping("/create")
	public ModelAndView createProductParameter(@RequestParam String name, 
			@RequestParam String english,
			@RequestParam(value ="pvalue", required=false, defaultValue = "") String pvalue,
			@RequestParam int parentId,
			@RequestParam int level){
		ProductParameter productParameter = new ProductParameter();
		productParameter.setName(name);
		productParameter.setEnglish(english);
		productParameter.setPvalue(pvalue);
		productParameter.setLevel(level);
		productParameter.setParentId(parentId);
		productParameterService.insertProductParameter(productParameter);
		return listProductParameters(0, 10).addObject("message", "添加成功");
	}
	@RequestMapping("/edit")
	public ModelAndView editProductParameter(@RequestParam int id){
		ProductParameter productParameter = productParameterService.getProductParameterById(id);
		return new ModelAndView("/admin/productParameter/edit").addObject("productParameter", productParameter);
	}
	
	@RequestMapping("/update")
	public ModelAndView updateProductParameter(@RequestParam String name, 
			@RequestParam int id,
			@RequestParam String english,
			@RequestParam(value ="pvalue", required=false, defaultValue = "") String pvalue,
			@RequestParam int parentId, 
			@RequestParam int level){
		ProductParameter productParameter = productParameterService.getProductParameterById(id);
		productParameter.setName(name);
		productParameter.setEnglish(english);
		productParameter.setLevel(level);
		productParameter.setParentId(parentId);
		productParameterService.updateProductParameter(productParameter);
		return listProductParameters(0, 10).addObject("message", "修改类别成功");
	}

}
