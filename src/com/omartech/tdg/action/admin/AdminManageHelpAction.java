package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.service.HelpServiceService;

@Controller
@RequestMapping(value="/admin/manageHelp")
public class AdminManageHelpAction {
	
	@Autowired
	private HelpServiceService helpServiceService;
	
	//管理买家帮助页面的跳转
	@RequestMapping(value="/{helpManagePage}")
	public ModelAndView helpManage(@PathVariable("helpManagePage") String helpManagePage){
		return new ModelAndView("/admin/help-manage/" + helpManagePage).addObject("updateResult", " ");
	}
	//管理买家帮助页面的更新操作实现
	@RequestMapping(value="/updateTradeRules")
	public ModelAndView updateTradeRules(@RequestParam("tradeRules") String tradeRules){
		String updateResult = "更新成功！";
		helpServiceService.updateTradeRules(tradeRules);
		return new ModelAndView("/admin/help-manage/tradeRulesManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateShoppingProcess")
	public ModelAndView updateShoppingProcess(@RequestParam("shoppingProcess") String shoppingProcess){
		String updateResult = "更新成功！";
		helpServiceService.updateShoppingProcess(shoppingProcess);
		return new ModelAndView("/admin/help-manage/shoppingProcessManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateOrderStatus")
	public ModelAndView updateOrderStatus(@RequestParam("orderStatus") String orderStatus){
		String updateResult = "更新成功！";
		helpServiceService.updateOrderStatus(orderStatus);
		return new ModelAndView("/admin/help-manage/orderStatusManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateFAQ")
	public ModelAndView updateFAQ(@RequestParam("FAQ") String FAQ){
		String updateResult = "更新成功！";
		helpServiceService.updateFAQ(FAQ);
		return new ModelAndView("/admin/help-manage/FAQManage").addObject("updateResult", updateResult);
	}
	@RequestMapping(value="/updateContactCustomService")
	public ModelAndView updateContactCustomService(@RequestParam("contactCustomService") String contactCustomService){
		String updateResult = "更新成功！";
		helpServiceService.updateContactCustomService(contactCustomService);
		return new ModelAndView("/admin/help-manage/contactCustomServiceManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateAfterSalePolicy")
	public ModelAndView updateAfterSalePolicy(@RequestParam("afterSalePolicy") String afterSalePolicy){
		String updateResult = "更新成功！";
		helpServiceService.updateAfterSalePolicy(afterSalePolicy);
		return new ModelAndView("/admin/help-manage/afterSalePolicyManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateCashAfterDelivery")
	public ModelAndView updateCashAfterDelivery(@RequestParam("cashAfterDelivery") String cashAfterDelivery){
		String updateResult = "更新成功！";
		helpServiceService.updateCashAfterDelivery(cashAfterDelivery);
		return new ModelAndView("/admin/help-manage/cashAfterDeliveryManage").addObject("updateResult", updateResult);
	}
	@RequestMapping(value="/updatePayOnline")
	public ModelAndView updatePayOnline(@RequestParam("payOnline") String payOnline){
		String updateResult = "更新成功！";
		helpServiceService.updatePayOnline(payOnline);
		return new ModelAndView("/admin/help-manage/payOnlineManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updatePriceProtect")
	public ModelAndView updatePriceProtect(@RequestParam("priceProtect") String priceProtect){
		String updateResult = "更新成功！";
		helpServiceService.updatePriceProtect(priceProtect);
		return new ModelAndView("/admin/help-manage/priceProtectManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateRefundInstruction")
	public ModelAndView updateRefundInstruction(@RequestParam("refundInstruction") String refundInstruction){
		String updateResult = "更新成功！";
		helpServiceService.updateRefundInstruction(refundInstruction);
		return new ModelAndView("/admin/help-manage/refundInstructionManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateThirdPartyExpress")
	public ModelAndView updateThirdPartyExpress(@RequestParam("thirdPartyExpress") String thirdPartyExpress){
		String updateResult = "更新成功！";
		helpServiceService.updateThirdPartyExpress(thirdPartyExpress);
		return new ModelAndView("/admin/help-manage/thirdPartyExpressManage").addObject("updateResult", updateResult);
	}
	
	@RequestMapping(value="/updateVipIntroduction")
	public ModelAndView updateVipIntroduction(@RequestParam("vipIntroduction") String vipIntroduction){
		System.out.println(vipIntroduction);
		String updateResult = "更新成功！";
		helpServiceService.updateVipIntroduction(vipIntroduction);
		return new ModelAndView("/admin/help-manage/vipIntroductionManage").addObject("updateResult", updateResult);
	}
	
	//管理卖家帮助页面的跳转
	@RequestMapping(value="/seller/{helpManagePage}")
	public ModelAndView sellerHelpManage(@PathVariable("helpManagePage") String helpManagePage){
		return new ModelAndView("/admin/help-manage/" + helpManagePage).addObject("updateResult", " ");
	}
	
}
