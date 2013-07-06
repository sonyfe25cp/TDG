package com.omartech.tdg.action.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/seller/item/")
public class SellerItemAction {

	@RequestMapping("/add")
	public ModelAndView addItem(@RequestParam int sku){
		
		return new ModelAndView();
	}
}
