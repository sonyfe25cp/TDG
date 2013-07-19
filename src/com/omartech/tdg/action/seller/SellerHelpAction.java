package com.omartech.tdg.action.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.service.HelpServiceService;

@Controller
@RequestMapping(value="/help/seller")
public class SellerHelpAction {
	@Autowired
	private HelpServiceService helpServiceService; 
	
	@RequestMapping("/{sellerHelp}")
	public ModelAndView aboutUsHelp(@PathVariable ("sellerHelp") String sellerHelp){
		if(sellerHelp.equals("home")){
			return new ModelAndView("/seller/index");
		}
		else
			return new ModelAndView("/seller/help/" + sellerHelp);
	}

}
