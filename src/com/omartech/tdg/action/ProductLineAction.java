package com.omartech.tdg.action;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.model.ProductLine;
import com.omartech.tdg.service.ProductLineService;

@RequestMapping("/productLine/")
@Controller
public class ProductLineAction {
	
	private ProductLineService productLineService;

	@RequestMapping("list")
	@ResponseBody
	public List<ProductLine> listProductLines(@RequestParam int parentId){
		List<ProductLine> productLines = productLineService.getProductLinesByParentId(parentId);
		return productLines;
	}

	public ProductLineService getProductLineService() {
		return productLineService;
	}

	public void setProductLineService(ProductLineService productLineService) {
		this.productLineService = productLineService;
	}
	
}
