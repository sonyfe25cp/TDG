package com.omartech.tdg.action.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@RequestMapping("/seller/finance")
@Controller
public class SellFinanceAction {
	
	@RequestMapping("/thismonth")
	public ModelAndView listThisMonth(){
		return new ModelAndView("/seller/finance/this");
	}

	@RequestMapping("/lastmonth")
	public ModelAndView listLastMonth(){
		return new ModelAndView("/seller/finance/last");
	}
	@RequestMapping("/history")
	public ModelAndView listHistory(){
		return new ModelAndView("/seller/finance/history");
	}
}
