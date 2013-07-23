package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.HelpService;

public interface HelpServiceMapper {
	
	public HelpService getHelpService();
	
	public void insertHelpService(HelpService helpService);
	
	public void updateHelpService(HelpService helpService);
	
	public void updateTradeRules(String tradeRules);
	
	public void updateShoppingProcess(String shoppingProcess);
	
	public void updateOrderStatus(String orderStatus);
	
	public void updateFAQ(String FAQ);
	
	public void updateContactCustomService(String contactCustomService);
	
	public void updateAfterSalePolicy(String afterSalePolicy);
	
	public void updateCashAfterDelivery(String cashAfterDelivery);
	
	public void updatePayOnline(String payOnline);
	
	public void updatePriceProtect(String priceProtect);
	
	public void updateRefundInstruction(String refundInstruction);
	
	public void updateThirdPartyExpress(String thirdPartyExpress);
	
	public void updateVipIntroduction(String tradeRules);
	
	
}
