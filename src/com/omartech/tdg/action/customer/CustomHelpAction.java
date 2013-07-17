package com.omartech.tdg.action.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/help")
public class CustomHelpAction {
	@RequestMapping(value="/shoppingProcess")
	public ModelAndView shoppingProcesshelp(){
		return new ModelAndView("/customer/help/shopping-process");
	}
	
	@RequestMapping(value="/afterSalePolicy")
	public ModelAndView afterSaleServiceHelp(){
		return new ModelAndView("/customer/help/after-sale-policy");
	}
	
	@RequestMapping(value="/cashAfterDelivery")
	public ModelAndView cashOnDeliveryHelp(){
		return new ModelAndView("/customer/help/cash-after-delivery");
	}
	
	@RequestMapping(value="/contactCustomService")
	public ModelAndView contactServiceHelp(){
		return new ModelAndView("/customer/help/contact-custom-service");
	}
	
	@RequestMapping(value="/FAQ")
	public ModelAndView FAQHelp(){
		return new ModelAndView("/customer/help/FAQ");
	}
	
	@RequestMapping(value="/orderStatus")
	public ModelAndView orderStatusHelp(){
		return new ModelAndView("/customer/help/order-status");
	}
	
	@RequestMapping(value="/payOnline")
	public ModelAndView payOnlineHelp(){
		return new ModelAndView("/customer/help/pay-online");
	}
	
	@RequestMapping(value="/priceProtect")
	public ModelAndView priceProtectHelp(){
		return new ModelAndView("/customer/help/price-protect");
	}
	
	@RequestMapping(value="/refundInstruction")
	public ModelAndView refundInstructionHelp(){
		return new ModelAndView("/customer/help/refund-instruction");
	}
	
	@RequestMapping(value="/thirdPartyExpress")
	public ModelAndView thirdPartyExpressHelp(){
		return new ModelAndView("/customer/help/third-party-express");
	}
	
	@RequestMapping(value="/tradeRules")
	public ModelAndView tradeRulesHelp(){
		return new ModelAndView("/customer/help/trade-rules");
	}
	
	@RequestMapping(value="/vipIntroduction")
	public ModelAndView vipIntroductionHelp(){
		return new ModelAndView("/customer/help/vip-introduction");
	}
	

}