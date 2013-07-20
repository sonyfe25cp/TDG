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
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String shoppingProcess = helpService.getShoppingProcess();
		//String shoppingProcess = "1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态";
		return new ModelAndView("/customer/help/shopping-process").addObject("shoppingProcess", shoppingProcess);
	}
	
	@RequestMapping(value="/afterSalePolicy")
	public ModelAndView afterSaleServiceHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String afterSalePolicy = helpService.getAfterSalePolicy();
		return new ModelAndView("/customer/help/after-sale-policy").addObject("afterSalePolicy", afterSalePolicy);
	}
	
	@RequestMapping(value="/cashAfterDelivery")
	public ModelAndView cashOnDeliveryHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String cashAfterDelivery = helpService.getCashAfterDelivery();
		return new ModelAndView("/customer/help/cash-after-delivery").addObject("cashAfterDelivery", cashAfterDelivery);
	}
	
	@RequestMapping(value="/contactCustomService")
	public ModelAndView contactServiceHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String contactCustomService = helpService.getContactCustomService();
		return new ModelAndView("/customer/help/contact-custom-service").addObject("contactCustomService", contactCustomService);
	}
	
	@RequestMapping(value="/FAQ")
	public ModelAndView FAQHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String FAQ = helpService.getFAQ();
		return new ModelAndView("/customer/help/FAQ").addObject("FAQ", FAQ);
	}
	
	@RequestMapping(value="/orderStatus")
	public ModelAndView orderStatusHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String orderStatus = helpService.getOrderStatus();
		return new ModelAndView("/customer/help/order-status").addObject("orderStatus", orderStatus);
	}
	
	@RequestMapping(value="/payOnline")
	public ModelAndView payOnlineHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String payOnline = helpService.getPayOnline();
		return new ModelAndView("/customer/help/pay-online").addObject("payOnline", payOnline);
	}
	
	@RequestMapping(value="/priceProtect")
	public ModelAndView priceProtectHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String priceProtect = helpService.getPriceProtect();
		return new ModelAndView("/customer/help/price-protect").addObject("priceProtect", priceProtect);
	}
	
	@RequestMapping(value="/refundInstruction")
	public ModelAndView refundInstructionHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String refundInstruction = helpService.getRefundInstruction();
		return new ModelAndView("/customer/help/refund-instruction").addObject("refundInstruction", refundInstruction);
	}
	
	@RequestMapping(value="/thirdPartyExpress")
	public ModelAndView thirdPartyExpressHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String thirdPartyExpress = helpService.getThirdPartyExpress();
		return new ModelAndView("/customer/help/third-party-express").addObject("thirdPartyExpress", thirdPartyExpress);
	}
	
	@RequestMapping(value="/tradeRules")
	public ModelAndView tradeRulesHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String tradeRules = helpService.getTradeRules();
		return new ModelAndView("/customer/help/trade-rules").addObject("tradeRules", tradeRules);
	}
	
	@RequestMapping(value="/vipIntroduction")
	public ModelAndView vipIntroductionHelp(){
		List<HelpService> helpServiceList = helpServiceService.getHelpService();
		HelpService helpService = new HelpService();
		if(helpServiceList != null){
			System.out.println("not null");
			helpService = helpServiceList.get(0);
		}
		else{
			System.out.println("null");
		}
		String shoppingProcess = helpService.getShoppingProcess();
		return new ModelAndView("/customer/help/vip-introduction").addObject("vipIntroduction", shoppingProcess);
	}
	

}