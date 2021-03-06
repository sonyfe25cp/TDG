package com.omartech.tdg.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping(value="/admin")
public class AdminCommonAction {
	
	@RequestMapping(value="")
	public String index(){
		return "index";
	}

	@RequestMapping(value="/about")
	public ModelAndView aboutUs(){
		return new ModelAndView("common/aboutUs");
	}
	
	@RequestMapping(value="hello")  
    public String hello(ModelAndView model){  
        model.addObject("username","张三");
        return "hello";
    }   
}
