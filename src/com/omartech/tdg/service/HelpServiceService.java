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
	
	public List<HelpService> getHelpService(){
		return helpServiceMapper.getHelpService();
	}
	
	public void insertHelpService(HelpService helpService){
		helpServiceMapper.insertHelpService(helpService);
	}
	
	public void updateHelpService(HelpService helpService){
		helpServiceMapper.updateHelpService(helpService);
	}
	
	public void updateTradeRules(String tradeRules){
		helpServiceMapper.updateTradeRules(tradeRules);
	}
	
	public void updateShoppingProcess(String shoppingProcess){
		helpServiceMapper.updateShoppingProcess(shoppingProcess);
	}
	
	public void updateOrderStatus(String orderStatus){
		helpServiceMapper.updateOrderStatus(orderStatus);
	}
	
	public void updateFAQ(String FAQ){
		helpServiceMapper.updateFAQ(FAQ);
	}
	
	public void updateContactCustomService(String contactCustomService){
		helpServiceMapper.updateContactCustomService(contactCustomService);
	}
	
	public void updateAfterSalePolicy(String afterSalePolicy){
		helpServiceMapper.updateAfterSalePolicy(afterSalePolicy);
	}
	
	public void updateCashAfterDelivery(String cashAfterDelivery){
		helpServiceMapper.updateCashAfterDelivery(cashAfterDelivery);
	}
	
	public void updatePayOnline(String payOnline){
		helpServiceMapper.updatePayOnline(payOnline);
	}
	
	public void updatePriceProtect(String priceProtect){
		helpServiceMapper.updatePriceProtect(priceProtect);
	}
	
	public void updateRefundInstruction(String refundInstruction){
		helpServiceMapper.updateRefundInstruction(refundInstruction);
	}
	
	public void updateThirdPartyExpress(String thirdPartyExpress){
		helpServiceMapper.updateThirdPartyExpress(thirdPartyExpress);
	}
	
	public void updateVipIntroduction(String vipIntroduction){
		helpServiceMapper.updateVipIntroduction(vipIntroduction);
	}
	


}
