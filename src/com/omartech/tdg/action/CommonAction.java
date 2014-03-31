package com.omartech.tdg.action;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	
	@ResponseBody
	@RequestMapping(value = "/changelanguage", method = RequestMethod.POST)
	public String changeLanguage(@RequestParam String new_lang, HttpServletRequest request, HttpServletResponse response)
	{
	    String msg = "";
	    
	    try
	    {
	        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);  
	        if (localeResolver == null) {  
	            throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");  
	        } 
	        LocaleEditor localeEditor = new LocaleEditor();  
	        localeEditor.setAsText(new_lang);
	        localeResolver.setLocale(request, response, (Locale)localeEditor.getValue());  
	        msg = "Change Language Success!";
	    }
	    catch(Exception ex)
	    {
	        msg = "error";
	    }
	    return msg;
	}
	
	
	@RequestMapping("/freezeout")
	public String freezeout(){
		return "/common/freezeout";
	}
	
	@RequestMapping("/jsp")
	public String jsp(){
		return "/jsp/testjsp";
	}
	
	@RequestMapping(value="/tmp")
	public String index(){
		return "tmp/index";
	}

	@RequestMapping(value="/about")
	public ModelAndView aboutUs(){
		return new ModelAndView("common/aboutUs");
	}
	
	//for customer
	@RequestMapping(value="")  
    public String customerIndex(){  
        return "redirect:/index";
    }
	@RequestMapping(value="/customerindex")
    public String customerIndex2(){  
        return "redirect:/index";
    }
	//for customer
	@RequestMapping(value="/sellerindex")  
	public ModelAndView sellerIndex(HttpServletRequest request, HttpServletResponse response){
		
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);  
		LocaleEditor localeEditor = new LocaleEditor();  
        localeEditor.setAsText("en_US");
        localeResolver.setLocale(request, response, (Locale)localeEditor.getValue());
		
		String[] picturePath = sellerIndexService.getPicPath();
		String textContent = sellerIndexService.getTextContent();
		return new ModelAndView("/seller/index").addObject("textContent", textContent).addObject("picturePath", picturePath);
    }
	//for customer
	@RequestMapping(value="/adminindex")  
    public String adminIndex(HttpServletRequest request, HttpServletResponse response){  
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);  
		LocaleEditor localeEditor = new LocaleEditor();  
        localeEditor.setAsText("zh_CN");
        localeResolver.setLocale(request, response, (Locale)localeEditor.getValue());
		
        return "admin/index";
    }
	@RequestMapping(value="/translatorindex")  
    public String translatorIndex(){  
        return "translator/index";
    }
}
