package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonAction {
	
	@RequestMapping(value="")
	public String index(){
		return "tmp/index";
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
	
	//for customer
	@RequestMapping(value="/customerindex")  
    public String customerIndex(){  
        return "customer/index";
    }
	//for customer
		@RequestMapping(value="/sellerindex")  
	public String sellerIndex(){  
	        return "seller/index";
    }
	//for customer
	@RequestMapping(value="/adminindex")  
    public String adminIndex(){  
        return "admin/index";
    }
	//for customer
	@RequestMapping(value="/translatorindex")  
    public String translatorIndex(){  
        return "translator/index";
    }
}
