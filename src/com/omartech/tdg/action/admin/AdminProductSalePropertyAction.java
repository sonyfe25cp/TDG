package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.BaseFeatureMapper;

@Controller
@RequestMapping("/admin/saleproperty/")
public class AdminProductSalePropertyAction {
	@Autowired
	private BaseFeatureMapper baseFeatureMapper;
	
	@RequestMapping("list")
	public ModelAndView listAllSaleProperty(
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize
			){
		return null;
	}
	
	@RequestMapping("edit")
	public ModelAndView editSaleProperty(@RequestParam int id){
		return null;
	}
	
	@RequestMapping("update")
	public ModelAndView editSaleProperty(@RequestParam String id){
		return null;
	}

	public BaseFeatureMapper getBaseFeatureMapper() {
		return baseFeatureMapper;
	}

	public void setBaseFeatureMapper(BaseFeatureMapper baseFeatureMapper) {
		this.baseFeatureMapper = baseFeatureMapper;
	}
}
