package com.omartech.tdg.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/finance")
public class AdminFinanceAction {
	@RequestMapping("/thismonth")
	public ModelAndView listThisMonth(){
		return new ModelAndView("/admin/finance/this");
	}

	@RequestMapping("/lastmonth")
	public ModelAndView listLastMonth(){
		return new ModelAndView("/admin/finance/last");
	}
	@RequestMapping("/history")
	public ModelAndView listHistory(){
		return new ModelAndView("/admin/finance/history");
	}
}
