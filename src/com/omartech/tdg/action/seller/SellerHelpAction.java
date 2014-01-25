package com.omartech.tdg.action.seller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.SellerHelpService;
import com.omartech.tdg.service.SellerHelpServiceService;
import com.omartech.tdg.service.SellerIndexService;

@Controller
public class SellerHelpAction {
	@Autowired
	private SellerHelpServiceService sellerHelpService; 
	
	@Autowired
	private SellerIndexService sellerIndexService;
	
	@Autowired
	private SellerHelpServiceService sellerHelp;
	
	@RequestMapping(value="/help/sellerlicense")
	public String registerLicense(){
		return "/seller/help/license";
	}
	
	
	@RequestMapping("/seller/help-details")
	public ModelAndView help(){
		
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		String platformHelpManage ="";
		if(sellerHelpService!= null){
			platformHelpManage = sellerHelpService.getPlatformHelp();
		}
		
		return new ModelAndView("/seller/help/help-details").addObject("platformHelpManage", platformHelpManage);
	}
	
	@RequestMapping("/public/home")
	public ModelAndView index(){
		String[] picturePath = sellerIndexService.getPicPath();
		String textContent = sellerIndexService.getTextContent();
		return new ModelAndView("/seller/index").addObject("textContent", textContent).addObject("picturePath", picturePath);
	}
	
	@RequestMapping("/public/aboutus")
	public ModelAndView aboutUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String aboutUs = "";
		if(sellerHelp!= null){
			aboutUs = sellerHelp.getAboutUs();
		}
		
	    return new ModelAndView("/seller/help/aboutus").addObject("aboutUs", aboutUs);
	}
	
	@RequestMapping("/public/businessProcess")
	public ModelAndView businessProcessUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String businessProcess = "";
		if(sellerHelp!= null){
			businessProcess = sellerHelp.getBusinessProcess();
		}
		
	    return new ModelAndView("/seller/help/businessProcess").addObject("businessProcess", businessProcess);
	}
	
	@RequestMapping("/public/companyService")
	public ModelAndView companyServiceHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String companyService = "";
		if(sellerHelp!= null){
			companyService = sellerHelp.getCompanyService();
		}
		
	    return new ModelAndView("/seller/help/companyService").addObject("companyService", companyService);
	}
	
	@RequestMapping("/public/contactus")
	public ModelAndView contactUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String contactUs = "";
		if(sellerHelp!= null){
			contactUs = sellerHelp.getContactUs();
		}
		
	    return new ModelAndView("/seller/help/contactus").addObject("contactUs", contactUs);
	}
	
	@RequestMapping("/public/joinus")
	public ModelAndView joinUsHelp(){
		SellerHelpService sellerHelp = sellerHelpService.getSellerHelpService();
		String joinUs = "";
		if(sellerHelp!= null){
			joinUs = sellerHelp.getJoinUs();
		}
		
	    return new ModelAndView("/seller/help/joinus").addObject("joinUs", joinUs);
	}

	public SellerHelpServiceService getSellerHelpService() {
		return sellerHelpService;
	}

	public void setSellerHelpService(SellerHelpServiceService sellerHelpService) {
		this.sellerHelpService = sellerHelpService;
	}

	public SellerIndexService getSellerIndexService() {
		return sellerIndexService;
	}

	public void setSellerIndexService(SellerIndexService sellerIndexService) {
		this.sellerIndexService = sellerIndexService;
	}
	
	

}
