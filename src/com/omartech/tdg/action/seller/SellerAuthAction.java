package com.omartech.tdg.action.seller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.seller.SellerAuthService;

@Controller
public class SellerAuthAction {
	
	@Autowired
	private SellerAuthService sellerAuthService;

	@RequestMapping(value="/loginasseller")
	public String loginAsSeller(){
		return "seller/auth/login";
	}
	
	@RequestMapping(value="/sellerforgetpwd")
	public String sellerForgetPwd(){
		return "seller/auth/forget";
	}
	
	@RequestMapping(value="/registerasseller")
	public String registerAsSeller(){
		return "seller/auth/register";
	}
	
	@RequestMapping(value="/sellerregist")
	public String sellerRegister(
		@RequestParam(value="email", required=true) String email,
		@RequestParam(value="password", required=true) String password,
		@RequestParam String businessName,
		@RequestParam String firstName,
		@RequestParam String lastName,
		@RequestParam String businessAddress,
		@RequestParam String city,
		@RequestParam String country,
		@RequestParam String primaryPhoneNumber,
		@RequestParam String productLines,
		@RequestParam String secondPhoneNumber,
		@RequestParam String companyWebsiteAddress,
		HttpSession session){
		boolean flag = false;
		Seller checkSeller = sellerAuthService.getSellerByEmail(email);
		if(checkSeller == null){
			flag = true;
			Seller seller = new Seller();
			seller.setEmail(email);
			seller.setPassword(password);
			seller.setBusinessName(businessName);
			seller.setFirstName(firstName);
			seller.setLastName(lastName);
			seller.setBusinessAddress(businessAddress);
			seller.setCity(city);
			seller.setCountry(country);
			seller.setPrimaryPhoneNumber(primaryPhoneNumber);
			seller.setProductLines(productLines);
			seller.setSecondPhoneNumber(secondPhoneNumber);
			seller.setCompanyWebsiteAddress(companyWebsiteAddress);
			
			sellerAuthService.insertSeller(seller);
			session.setAttribute("seller", seller);
			return "/seller/index";
		}else{
			return "/seller/auth/register";
		}
	}

	public SellerAuthService getSellerAuthService() {
		return sellerAuthService;
	}

	public void setSellerAuthService(SellerAuthService sellerAuthService) {
		this.sellerAuthService = sellerAuthService;
	}
	
	
}
