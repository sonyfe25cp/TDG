package com.omartech.tdg.action;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.model.ProductParameter;
import com.omartech.tdg.service.ProductParameterService;

@RequestMapping("/productParameter/")
@Controller
public class ProductParameterAction {
	
	private ProductParameterService productParameterService;

	@RequestMapping("list")
	@ResponseBody
	public List<ProductParameter> listProductParameters(@RequestParam int parentId){
		List<ProductParameter> productParameters = productParameterService.getProductParametersByParentId(parentId);
		return productParameters;
	}

	public ProductParameterService getProductParameterService() {
		return productParameterService;
	}

	public void setProductParameterService(ProductParameterService productParameterService) {
		this.productParameterService = productParameterService;
	}
	
}
