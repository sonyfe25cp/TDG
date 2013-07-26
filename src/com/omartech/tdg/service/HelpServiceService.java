package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.HelpServiceMapper;
import com.omartech.tdg.model.HelpService;

@Service
public class HelpServiceService {
	@Autowired
	private HelpServiceMapper helpServiceMapper;
	
	public HelpService getHelpService(){
		return helpServiceMapper.getHelpService();
	}
	
	public void insertHelpService(HelpService helpService){
		helpServiceMapper.insertHelpService(helpService);
	}
	
	public void updateHelpService(HelpService helpService){
		helpServiceMapper.updateHelpService(helpService);
	}
	
	public void updateTradeRules(String tradeRules){
		HelpService helpService = getHelpService();
		helpService.setTradeRules(tradeRules);
		updateHelpService(helpService);
	}
	
	public void updateShoppingProcess(String shoppingProcess){
		HelpService helpService = getHelpService();
		helpService.setShoppingProcess(shoppingProcess);
		updateHelpService(helpService);
	}
	
	public void updateOrderStatus(String orderStatus){
		HelpService helpService = getHelpService();
		helpService.setOrderStatus(orderStatus);
		updateHelpService(helpService);
	}
	
	public void updateFAQ(String FAQ){
		HelpService helpService = getHelpService();
		helpService.setFAQ(FAQ);
		updateHelpService(helpService);
	}
	
	public void updateContactCustomService(String contactCustomService){
		HelpService helpService = getHelpService();
		helpService.setContactCustomService(contactCustomService);
		updateHelpService(helpService);
	}
	
	public void updateAfterSalePolicy(String afterSalePolicy){
		HelpService helpService = getHelpService();
		helpService.setAfterSalePolicy(afterSalePolicy);
		updateHelpService(helpService);
	}
	
	public void updateCashAfterDelivery(String cashAfterDelivery){
		HelpService helpService = getHelpService();
		helpService.setCashAfterDelivery(cashAfterDelivery);
		updateHelpService(helpService);
	}
	
	public void updatePayOnline(String payOnline){
		HelpService helpService = getHelpService();
		helpService.setPayOnline(payOnline);
		updateHelpService(helpService);
	}
	
	public void updatePriceProtect(String priceProtect){
		HelpService helpService = getHelpService();
		helpService.setPriceProtect(priceProtect);
		updateHelpService(helpService);
	}
	
	public void updateRefundInstruction(String refundInstruction){
		HelpService helpService = getHelpService();
		helpService.setRefundInstruction(refundInstruction);
		updateHelpService(helpService);
	}
	
	public void updateThirdPartyExpress(String thirdPartyExpress){
		HelpService helpService = getHelpService();
		helpService.setThirdPartyExpress(thirdPartyExpress);
		updateHelpService(helpService);
	}
	
	public void updateVipIntroduction(String vipIntroduction){
		HelpService helpService = getHelpService();
		helpService.setVipIntroduction(vipIntroduction);
		updateHelpService(helpService);
	}

	public HelpServiceMapper getHelpServiceMapper() {
		return helpServiceMapper;
	}

	public void setHelpServiceMapper(HelpServiceMapper helpServiceMapper) {
		this.helpServiceMapper = helpServiceMapper;
	}
	
	
	

}
