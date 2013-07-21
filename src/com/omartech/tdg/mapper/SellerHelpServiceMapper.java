package com.omartech.tdg.mapper;


import com.omartech.tdg.model.SellerHelpService;


public interface SellerHelpServiceMapper {
	
	public SellerHelpService getSellerHelpService();
	
	public void insertSellerHelpService(SellerHelpService sellerHelpService);
	
	public void updateSellerHelpService(SellerHelpService sellerHelpService);
	
	public void updateAboutUs(String aboutUs);
	
	public void updateBussinessProcess(String businessProcess);
	
	public void updateCompanyService(String companyService);
	
	public void updateContactUs(String contactUs);
	
	public void updateJoinUs(String joinUs);

}
