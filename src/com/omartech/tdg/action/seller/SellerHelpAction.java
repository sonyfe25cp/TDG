package com.omartech.tdg.action.seller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.SellerHelpService;
import com.omartech.tdg.service.SellerHelpServiceService;

@Controller
@RequestMapping(value="/help/seller")
public class SellerHelpAction {
	@Autowired
	private SellerHelpServiceService sellerHelpService; 
	
//	@RequestMapping("/{sellerHelp}")
//	public ModelAndView sellerHelp(@PathVariable ("sellerHelp") String sellerHelp){
//		if(sellerHelp.equals("home")){
//			return new ModelAndView("/seller/index");
//		}
//		else
//			return new ModelAndView("/seller/help/" + sellerHelp);
//	}
	@RequestMapping("/home")
	public ModelAndView index(){
		return new ModelAndView("/seller/index");
	}
	
	@RequestMapping("/aboutus")
	public ModelAndView aboutUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String aboutUs = "";
		if(sellerHelp!= null){
			aboutUs = sellerHelp.getAboutUs();
		}
		
	    return new ModelAndView("/seller/help/aboutus").addObject("aboutUs", aboutUs);
	}
	
	@RequestMapping("/businessProcess")
	public ModelAndView businessProcessUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String businessProcess = "";
		if(sellerHelp!= null){
			businessProcess = sellerHelp.getBusinessProcess();
		}
		
	    return new ModelAndView("/seller/help/businessProcess").addObject("businessProcess", businessProcess);
	}
	
	@RequestMapping("/companyService")
	public ModelAndView companyServiceHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String companyService = "";
		if(sellerHelp!= null){
			companyService = sellerHelp.getCompanyService();
		}
		
	    return new ModelAndView("/seller/help/companyService").addObject("companyService", companyService);
	}
	
	@RequestMapping("/contactus")
	public ModelAndView contactUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String contactUs = "";
		if(sellerHelp!= null){
			contactUs = sellerHelp.getContactUs();
		}
		
	    return new ModelAndView("/seller/help/contactus").addObject("contactUs", contactUs);
	}
	
	@RequestMapping("/joinus")
	public ModelAndView joinUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String joinUs = "";
		if(sellerHelp!= null){
			joinUs = sellerHelp.getJoinUs();
		}
		
	    return new ModelAndView("/seller/help/joinus").addObject("joinUs", joinUs);
	}
	

}
