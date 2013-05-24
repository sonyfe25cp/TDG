package com.omartech.tdg.action.customer;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.service.customer.ICustomerAuthService;

public class CustomerAuthAction {
	
	private ICustomerAuthService customerAuthService;
	
	@RequestMapping(value="/loginascustomer")
	public String loginAsCustomer(){
		return "customer/auth/login";
	}
	
	@RequestMapping(value="/customerforgetpwd")
	public String customerForgetPwd(){
		return "customer/auth/forget";
	}
	
	@RequestMapping(value="/customerregister")
	public String customerRegister(){
		return "customer/auth/register";
	}
	
	
	@RequestMapping(value="/registascustomer")
	public String registAsCustomer(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "password", required = true) String password
			){
		boolean flag = customerAuthService.isEmailExist(email);
		if(!flag){
			customerAuthService.add(new Customer(email,password));
		}
		
		return "customer/auth/confirm";
	}

	public ICustomerAuthService getCustomerAuthService() {
		return customerAuthService;
	}

	public void setCustomerAuthService(ICustomerAuthService customerAuthService) {
		this.customerAuthService = customerAuthService;
	}

}
