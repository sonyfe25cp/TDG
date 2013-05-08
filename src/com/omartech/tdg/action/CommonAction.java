package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonAction {
	
	@RequestMapping(value="")
	public String index(){
		return "index";
	}

	@RequestMapping(value="/about")
	public ModelAndView aboutUs(){
		return new ModelAndView("common/aboutUs");
	}
}
