package com.omartech.tdg.action.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/help")
public class CustomHelpAction {
	@RequestMapping(value="/shoppingProcess")
	public ModelAndView goToHelp(){
		return new ModelAndView("/customer/help/help");
	}

}