package com.omartech.tdg.action.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.HelpService;
import com.omartech.tdg.service.HelpServiceService;

@Controller
@RequestMapping(value="/help")
public class CustomHelpAction {
	@Autowired
	private HelpServiceService helpServiceService; 
	
	@RequestMapping(value="/shoppingProcess")
	public ModelAndView shoppingProcesshelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			helpService = helpServiceList.get(0);
		}
		String shoppingProcess = helpService.getShoppingProcess();
		//String shoppingProcess = "1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态";
		return new ModelAndView("/customer/help/shopping-process").addObject("shoppingProcess", shoppingProcess);
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