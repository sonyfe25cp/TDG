package com.omartech.tdg.action.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerAuthAction {

	@RequestMapping(value="/loginasseller")
	public String loginAsSeller(){
		return "seller/auth/login";
	}
	
	@RequestMapping(value="/sellerforgetpwd")
	public String sellerForgetPwd(){
		return "seller/auth/forget";
	}
	
	@RequestMapping(value="/sellerregister")
	public String sellerRegister(){
		return "seller/auth/register";
	}
}
