package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SellerHelpServiceMapper;
import com.omartech.tdg.model.SellerHelpService;

@Service
public class SellerHelpServiceService {
	
	@Autowired
	private SellerHelpServiceMapper sellerHelpServiceMapper;
	
	public SellerHelpService getSellerHelpService(){
		return sellerHelpServiceMapper.getSellerHelpService();
	}
	
	public void insertSellerHelpService(SellerHelpService sellerHelpService){
		sellerHelpServiceMapper.insertSellerHelpService(sellerHelpService);
	}
	
	public void updateSellerHelpService(SellerHelpService sellerHelpService){
		sellerHelpServiceMapper.updateSellerHelpService(sellerHelpService);
	}
	
    public void updateAboutUs(String aboutUs){
    	sellerHelpServiceMapper.updateAboutUs(aboutUs);
    }
	
	public void updateBussinessProcess(String businessProcess){
		sellerHelpServiceMapper.updateBussinessProcess(businessProcess);
	}
	
	public void updateCompanyService(String companyService){
		sellerHelpServiceMapper.updateCompanyService(companyService);
	}
	
	public void updateContactUs(String contactUs){
		sellerHelpServiceMapper.updateContactUs(contactUs);
	}
	
	public void updateJoinUs(String joinUs){
		sellerHelpServiceMapper.updateJoinUs(joinUs);
	}

}
