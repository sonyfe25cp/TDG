package com.omartech.tdg.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.HelpService;
import com.omartech.tdg.model.SellerHelpService;
import com.omartech.tdg.service.HelpServiceService;
import com.omartech.tdg.service.SellerHelpServiceService;

@Controller
@RequestMapping(value="/admin/manageHelp")
public class AdminManageHelpAction {
	
	@Autowired
	private HelpServiceService helpServiceService;
	
	@Autowired
	private SellerHelpServiceService sellerHelp;
	
	//管理买家帮助页面的跳转
//	@RequestMapping(value="/{helpManagePage}")
//	public ModelAndView helpManage(@PathVariable("helpManagePage") String helpManagePage){
//		return new ModelAndView("/admin/help-manage/" + helpManagePage).addObject("updateResult", " ");
//	}
	
	@RequestMapping(value="/tradeRulesManage")
	public ModelAndView tradeRulesManage(){
		String  tradeRulesManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			tradeRulesManage = helpService.getTradeRules();
		}
		return new ModelAndView("/admin/help-manage/tradeRulesManage").addObject("updateResult", " ").addObject("tradeRulesManage", tradeRulesManage);
	}
	
	@RequestMapping(value="/shoppingProcessManage")
	public ModelAndView shoppingProcessManage(){
		String  shoppingProcessManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			shoppingProcessManage = helpService.getShoppingProcess();
		}
		return new ModelAndView("/admin/help-manage/shoppingProcessManage").addObject("updateResult", " ").addObject("shoppingProcessManage", shoppingProcessManage);
	}
	
	@RequestMapping(value="/orderStatusManage")
	public ModelAndView orderStatusManage(){
		String  orderStatusManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			orderStatusManage = helpService.getOrderStatus();
		}
		return new ModelAndView("/admin/help-manage/orderStatusManage").addObject("updateResult", " ").addObject("orderStatusManage", orderStatusManage);
	}
	
	@RequestMapping(value="/FAQManage")
	public ModelAndView FAQManage(){
		String  FAQManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			FAQManage = helpService.getFAQ();
		}
		return new ModelAndView("/admin/help-manage/FAQManage").addObject("updateResult", " ").addObject("FAQManage", FAQManage);
	}
	
	@RequestMapping(value="/contactCustomServiceManage")
	public ModelAndView contactCustomServiceManage(){
		String  contactCustomServiceManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			contactCustomServiceManage = helpService.getContactCustomService();
		}
		return new ModelAndView("/admin/help-manage/contactCustomServiceManage").addObject("updateResult", " ").addObject("contactCustomServiceManage", contactCustomServiceManage);
	}
	
	@RequestMapping(value="/afterSalePolicyManage")
	public ModelAndView afterSalePolicyManage(){
		String  afterSalePolicyManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			afterSalePolicyManage = helpService.getAfterSalePolicy();
		}
		return new ModelAndView("/admin/help-manage/afterSalePolicyManage").addObject("updateResult", " ").addObject("afterSalePolicyManage", afterSalePolicyManage);
	}
	
	@RequestMapping(value="/cashAfterDeliveryManage")
	public ModelAndView cashAfterDeliveryManage(){
		String  cashAfterDeliveryManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			cashAfterDeliveryManage = helpService.getCashAfterDelivery();
		}
		return new ModelAndView("/admin/help-manage/cashAfterDeliveryManage").addObject("updateResult", " ").addObject("cashAfterDeliveryManage", cashAfterDeliveryManage);
	}
	
	@RequestMapping(value="/payOnlineManage")
	public ModelAndView payOnlineManage(){
		String  payOnlineManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			payOnlineManage = helpService.getPayOnline();
		}
		return new ModelAndView("/admin/help-manage/payOnlineManage").addObject("updateResult", " ").addObject("payOnlineManage", payOnlineManage);
	}
	
	@RequestMapping(value="/priceProtectManage")
	public ModelAndView priceProtectManage(){
		String  priceProtectManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			priceProtectManage = helpService.getPriceProtect();
		}
		return new ModelAndView("/admin/help-manage/priceProtectManage").addObject("updateResult", " ").addObject("priceProtectManage", priceProtectManage);
	}
	
	@RequestMapping(value="/refundInstructionManage")
	public ModelAndView refundInstructionManage(){
		String  refundInstructionManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			refundInstructionManage = helpService.getRefundInstruction();
		}
		return new ModelAndView("/admin/help-manage/refundInstructionManage").addObject("updateResult", " ").addObject("refundInstructionManage", refundInstructionManage);
	}
	
	@RequestMapping(value="/thirdPartyExpressManage")
	public ModelAndView thirdPartyExpressManage(){
		String  thirdPartyExpressManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			thirdPartyExpressManage = helpService.getThirdPartyExpress();
		}
		return new ModelAndView("/admin/help-manage/thirdPartyExpressManage").addObject("updateResult", " ").addObject("thirdPartyExpressManage", thirdPartyExpressManage);
	}
	
	@RequestMapping(value="/vipIntroductionManage")
	public ModelAndView vipIntroductionManage(){
		String  vipIntroductionManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			vipIntroductionManage = helpService.getVipIntroduction();
		}
		return new ModelAndView("/admin/help-manage/vipIntroductionManage").addObject("updateResult", " ").addObject("vipIntroductionManage", vipIntroductionManage);
	}
	
	
	//管理买家帮助页面的更新操作实现
	@RequestMapping(value="/updateTradeRules")
	public ModelAndView updateTradeRules(@RequestParam("tradeRules") String tradeRules){
		String updateResult = "更新成功！";
		helpServiceService.updateTradeRules(tradeRules);
		String  tradeRulesManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			tradeRulesManage = helpService.getTradeRules();
		}
		return new ModelAndView("/admin/help-manage/tradeRulesManage").addObject("updateResult", updateResult).addObject("tradeRulesManage", tradeRulesManage);
	}
	
	@RequestMapping(value="/updateShoppingProcess")
	public ModelAndView updateShoppingProcess(@RequestParam("shoppingProcess") String shoppingProcess){
		String updateResult = "更新成功！";
		helpServiceService.updateShoppingProcess(shoppingProcess);
		String  shoppingProcessManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			shoppingProcessManage = helpService.getShoppingProcess();
		}
		return new ModelAndView("/admin/help-manage/shoppingProcessManage").addObject("updateResult", updateResult).addObject("shoppingProcessManage", shoppingProcessManage);
	}
	
	@RequestMapping(value="/updateOrderStatus")
	public ModelAndView updateOrderStatus(@RequestParam("orderStatus") String orderStatus){
		String updateResult = "更新成功！";
		helpServiceService.updateOrderStatus(orderStatus);
		String  orderStatusManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			orderStatusManage = helpService.getOrderStatus();
		}
		return new ModelAndView("/admin/help-manage/orderStatusManage").addObject("updateResult", updateResult).addObject("orderStatusManage", orderStatusManage);
	}
	
	@RequestMapping(value="/updateFAQ")
	public ModelAndView updateFAQ(@RequestParam("FAQ") String FAQ){
		String updateResult = "更新成功！";
		helpServiceService.updateFAQ(FAQ);
		String  FAQManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			FAQManage = helpService.getFAQ();
		}
		return new ModelAndView("/admin/help-manage/FAQManage").addObject("updateResult", updateResult).addObject("FAQManage", FAQManage);
	}
	@RequestMapping(value="/updateContactCustomService")
	public ModelAndView updateContactCustomService(@RequestParam("contactCustomService") String contactCustomService){
		String updateResult = "更新成功！";
		helpServiceService.updateContactCustomService(contactCustomService);
		String  contactCustomServiceManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			contactCustomServiceManage = helpService.getContactCustomService();
		}
		return new ModelAndView("/admin/help-manage/contactCustomServiceManage").addObject("updateResult", updateResult).addObject("contactCustomServiceManage", contactCustomServiceManage);
	}
	
	@RequestMapping(value="/updateAfterSalePolicy")
	public ModelAndView updateAfterSalePolicy(@RequestParam("afterSalePolicy") String afterSalePolicy){
		String updateResult = "更新成功！";
		helpServiceService.updateAfterSalePolicy(afterSalePolicy);
		String  afterSalePolicyManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			afterSalePolicyManage = helpService.getAfterSalePolicy();
		}
		return new ModelAndView("/admin/help-manage/afterSalePolicyManage").addObject("updateResult", updateResult).addObject("afterSalePolicyManage", afterSalePolicyManage);
	}
	
	@RequestMapping(value="/updateCashAfterDelivery")
	public ModelAndView updateCashAfterDelivery(@RequestParam("cashAfterDelivery") String cashAfterDelivery){
		String updateResult = "更新成功！";
		helpServiceService.updateCashAfterDelivery(cashAfterDelivery);
		String  cashAfterDeliveryManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			cashAfterDeliveryManage = helpService.getCashAfterDelivery();
		}
		return new ModelAndView("/admin/help-manage/cashAfterDeliveryManage").addObject("updateResult", updateResult).addObject("cashAfterDeliveryManage", cashAfterDeliveryManage);
	}
	@RequestMapping(value="/updatePayOnline")
	public ModelAndView updatePayOnline(@RequestParam("payOnline") String payOnline){
		String updateResult = "更新成功！";
		helpServiceService.updatePayOnline(payOnline);
		String  payOnlineManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			payOnlineManage = helpService.getPayOnline();
		}
		return new ModelAndView("/admin/help-manage/payOnlineManage").addObject("updateResult", updateResult).addObject("payOnlineManage", payOnlineManage);
	}
	
	@RequestMapping(value="/updatePriceProtect")
	public ModelAndView updatePriceProtect(@RequestParam("priceProtect") String priceProtect){
		String updateResult = "更新成功！";
		helpServiceService.updatePriceProtect(priceProtect);
		String  priceProtectManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			priceProtectManage = helpService.getPriceProtect();
		}
		return new ModelAndView("/admin/help-manage/priceProtectManage").addObject("updateResult", updateResult).addObject("priceProtectManage", priceProtectManage);
	}
	
	@RequestMapping(value="/updateRefundInstruction")
	public ModelAndView updateRefundInstruction(@RequestParam("refundInstruction") String refundInstruction){
		String updateResult = "更新成功！";
		helpServiceService.updateRefundInstruction(refundInstruction);
		String  refundInstructionManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			refundInstructionManage = helpService.getRefundInstruction();
		}
		return new ModelAndView("/admin/help-manage/refundInstructionManage").addObject("updateResult", updateResult).addObject("refundInstructionManage", refundInstructionManage);
	}
	
	@RequestMapping(value="/updateThirdPartyExpress")
	public ModelAndView updateThirdPartyExpress(@RequestParam("thirdPartyExpress") String thirdPartyExpress){
		String updateResult = "更新成功！";
		helpServiceService.updateThirdPartyExpress(thirdPartyExpress);
		String  thirdPartyExpressManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			thirdPartyExpressManage = helpService.getThirdPartyExpress();
		}
		return new ModelAndView("/admin/help-manage/thirdPartyExpressManage").addObject("updateResult", updateResult).addObject("thirdPartyExpressManage", thirdPartyExpressManage);
	}
	
	@RequestMapping(value="/updateVipIntroduction")
	public ModelAndView updateVipIntroduction(@RequestParam("vipIntroduction") String vipIntroduction){
		System.out.println(vipIntroduction);
		String updateResult = "更新成功！";
		helpServiceService.updateVipIntroduction(vipIntroduction);
		String  vipIntroductionManage = "";
		HelpService helpService = helpServiceService.getHelpService();
		if(helpService!= null){
			vipIntroductionManage = helpService.getVipIntroduction();
		}
		return new ModelAndView("/admin/help-manage/vipIntroductionManage").addObject("updateResult", updateResult).addObject("vipIntroductionManage", vipIntroductionManage);
	}
	
	//管理卖家帮助页面的跳转
//	@RequestMapping(value="/seller/{helpManagePage}")
//	public ModelAndView sellerHelpManage(@PathVariable("helpManagePage") String helpManagePage){
//		return new ModelAndView("/admin/help-manage/" + helpManagePage).addObject("updateResult", " ");
//	}
	
	@RequestMapping(value="/seller/indexManage")
	public ModelAndView sellerIndexManage(){
		return new ModelAndView("/admin/help-manage/sellerIndexManage");
	}
	
	@RequestMapping(value="/seller/aboutUsManage")
	public ModelAndView sellerAboutUsManage(){
		String aboutUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			aboutUsManage = sellerHelpService.getAboutUs();
		}
		return new ModelAndView("/admin/help-manage/sellerAboutUsManage").addObject("updateResult", " ").addObject("aboutUsManage", aboutUsManage);
	}
	
	@RequestMapping(value="/seller/businessProcessManage")
	public ModelAndView sellerBussinessProcessManage(){
		String businessProcessManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			businessProcessManage = sellerHelpService.getBusinessProcess();
		}
		return new ModelAndView("/admin/help-manage/sellerBusinessProcessManage").addObject("updateResult", " ").addObject("businessProcessManage", businessProcessManage);
	}
	
	@RequestMapping(value="/seller/companyServiceManage")
	public ModelAndView sellerCompanyServiceManage(){
		String companyServiceManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			companyServiceManage = sellerHelpService.getCompanyService();
		}
		return new ModelAndView("/admin/help-manage/sellerCompanyServiceManage").addObject("updateResult", " ").addObject("companyServiceManage", companyServiceManage);
	}
	
	@RequestMapping(value="/seller/contactUsManage")
	public ModelAndView sellerContactUsManage(){
		String contactUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			contactUsManage = sellerHelpService.getContactUs();
		}
		return new ModelAndView("/admin/help-manage/sellerContactUsManage").addObject("updateResult", " ").addObject("contactUsManage", contactUsManage);
	}
	
	@RequestMapping(value="/seller/joinUsManage")
	public ModelAndView sellerjoinUsManage(){
		String joinUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			joinUsManage = sellerHelpService.getJoinUs();
		}
		return new ModelAndView("/admin/help-manage/sellerJoinUsManage").addObject("updateResult", " ").addObject("joinUsManage", joinUsManage);
	}
	

	//管理卖家帮助页面更新操作的实现
	
	@RequestMapping(value = "/seller/updateAboutUs")
	public ModelAndView updateAboutUs(@RequestParam("aboutUs") String aboutUs){
		String updateResult = "更新成功！";
		sellerHelp.updateAboutUs(aboutUs);
		String aboutUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			aboutUsManage = sellerHelpService.getAboutUs();
		}
		return new ModelAndView("/admin/help-manage/sellerAboutUsManage").addObject("updateResult", updateResult).addObject("aboutUsManage", aboutUsManage);
	}
	
	@RequestMapping(value = "/seller/updateBusinessProcess")
	public ModelAndView updateBussinessProcess(@RequestParam("businessProcess") String businessProcess){
		String updateResult = "更新成功！";
		sellerHelp.updateBussinessProcess(businessProcess);
		String businessProcessManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			businessProcessManage = sellerHelpService.getBusinessProcess();
		}
		return new ModelAndView("/admin/help-manage/sellerBusinessProcessManage").addObject("updateResult", updateResult).addObject("businessProcessManage", businessProcessManage);
	}
	
	@RequestMapping(value = "/seller/updateCompanyService")
	public ModelAndView updateCompanyService(@RequestParam("companyService") String companyService){
		String updateResult = "更新成功！";
		sellerHelp.updateCompanyService(companyService);
		String companyServiceManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			companyServiceManage = sellerHelpService.getCompanyService();
		}
		return new ModelAndView("/admin/help-manage/sellerCompanyServiceManage").addObject("updateResult", updateResult).addObject("companyServiceManage", companyServiceManage);
	}
	
	@RequestMapping(value = "/seller/updateContactUs")
	public ModelAndView updateContactUs(@RequestParam("contactUs") String contactUs){
		String updateResult = "更新成功！";
		sellerHelp.updateContactUs(contactUs);
		String contactUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			contactUsManage = sellerHelpService.getContactUs();
		}
		return new ModelAndView("/admin/help-manage/sellerContactUsManage").addObject("updateResult", updateResult).addObject("contactUsManage", contactUsManage);
	}
	
	@RequestMapping(value = "/seller/updateJoinUs")
	public ModelAndView updateJoinUs(@RequestParam("joinUs") String joinUs){
		String updateResult = "更新成功！";
		sellerHelp.updateJoinUs(joinUs);
		String joinUsManage = "";
		SellerHelpService sellerHelpService = sellerHelp.getSellerHelpService();
		if(sellerHelpService!= null){
			joinUsManage = sellerHelpService.getJoinUs();
		}
		return new ModelAndView("/admin/help-manage/sellerJoinUsManage").addObject("updateResult", updateResult).addObject("joinUsManage", joinUsManage);
	}
	
	@RequestMapping(value = "/seller/indexUploadPic")
	@ResponseBody
	public String indexUploadPicture(HttpServletRequest request, HttpServletResponse response){
//		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/uploads/images/");
//		String responseStr="";  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        File file = new File("/home/yulong/tdg/img/sellerIndex");
        if(!file.exists()){
        	file.mkdir();
        }
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) { 
        	 MultipartFile mf = entity.getValue();
        	 String fileName = mf.getOriginalFilename();
        	 String name = mf.getName();
        	 System.out.println("origin name: "+ fileName + "    name: " +name);
        	 String newFile = "/home/yulong/tdg/img/sellerIndex/" + fileName;
        	 //String newFile = realPath + fileName;
        	 File uploadFile = new File(newFile);
        	 if(uploadFile.exists()){
        		 uploadFile.delete();
        	 }
        	 try {
				FileCopyUtils.copy(mf.getBytes(), uploadFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		System.out.println("start upload");
		return "success";
	}

	public HelpServiceService getHelpServiceService() {
		return helpServiceService;
	}

	public void setHelpServiceService(HelpServiceService helpServiceService) {
		this.helpServiceService = helpServiceService;
	}

	public SellerHelpServiceService getSellerHelp() {
		return sellerHelp;
	}

	public void setSellerHelp(SellerHelpServiceService sellerHelp) {
		this.sellerHelp = sellerHelp;
	}
	
	
	
	
}
