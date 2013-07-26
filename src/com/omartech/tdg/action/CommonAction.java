package com.omartech.tdg.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.service.SellerIndexService;

@Controller
public class CommonAction {
	
	@Autowired
	private SellerIndexService sellerIndexService;
	
	public SellerIndexService getSellerIndexService() {
		return sellerIndexService;
	}

	public void setSellerIndexService(SellerIndexService sellerIndexService) {
		this.sellerIndexService = sellerIndexService;
	}

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
        return "redirect:/index";
    }
	//for customer
	@RequestMapping(value="/sellerindex")  
	public ModelAndView sellerIndex(){
		String[] picturePath = sellerIndexService.getPicPath();
		String textContent = sellerIndexService.getTextContent();
		return new ModelAndView("/seller/index").addObject("textContent", textContent).addObject("picturePath", picturePath);
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
