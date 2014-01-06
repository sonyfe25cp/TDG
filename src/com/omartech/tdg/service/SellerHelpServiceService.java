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
    	SellerHelpService sellerHelpService = getSellerHelpService();
    	sellerHelpService.setAboutUs(aboutUs);
//    	System.out.println(" aboutus: " +sellerHelpService.getAboutUs());
//    	System.out.println(" id: " +sellerHelpService.getId());
//    	System.out.println(" contactus: " +sellerHelpService.getContactUs());
//    	System.out.println(" joinus: " +sellerHelpService.getJoinUs());
//    	System.out.println(" busi: " +sellerHelpService.getBusinessProcess());
//    	System.out.println(" comp: " +sellerHelpService.getCompanyService());
//    	System.out.println(" ischi: " +sellerHelpService.getIsChinese());
    	updateSellerHelpService(sellerHelpService);
    }
	
	

	public void updateBussinessProcess(String businessProcess){
    	SellerHelpService sellerHelpService = getSellerHelpService();
    	sellerHelpService.setBusinessProcess(businessProcess);
    	updateSellerHelpService(sellerHelpService);
	}
	
	public void updateCompanyService(String companyService){
    	SellerHelpService sellerHelpService = getSellerHelpService();
    	sellerHelpService.setCompanyService(companyService);
    	updateSellerHelpService(sellerHelpService);
	}
	
	public void updateContactUs(String contactUs){
    	SellerHelpService sellerHelpService = getSellerHelpService();
    	sellerHelpService.setContactUs(contactUs);
    	updateSellerHelpService(sellerHelpService);
	}
	
	public void updateJoinUs(String joinUs){
    	SellerHelpService sellerHelpService = getSellerHelpService();
    	sellerHelpService.setJoinUs(joinUs);
    	updateSellerHelpService(sellerHelpService);
	}
	
	public void updatePlatformHelp(String platformHelp){
		SellerHelpService sellerHelpService = getSellerHelpService();
		sellerHelpService.setPlatformHelp(platformHelp);
		updateSellerHelpService(sellerHelpService);
	}
	
	public SellerHelpServiceMapper getSellerHelpServiceMapper() {
		return sellerHelpServiceMapper;
	}

	public void setSellerHelpServiceMapper(
			SellerHelpServiceMapper sellerHelpServiceMapper) {
		this.sellerHelpServiceMapper = sellerHelpServiceMapper;
	}

}
