package com.omartech.tdg.action.customer;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.service.customer.ICustomerAuthService;

@Controller
public class CustomerAuthAction {
	
	private ICustomerAuthService customerAuthService;

	Logger logger = Logger.getLogger(CustomerAuthAction.class);
	
	@RequestMapping(value="/loginascustomer")
	public String loginAsCustomer(){
		return "customer/auth/login";
	}
	@RequestMapping(value="/customerlogin")
	public String customerLogin(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "password", required = true) String password){
		
		Customer customer = customerAuthService.isLegalUser(email, password);
		if(customer !=null ){
			//add session
			return "customer/index";
		}else{
			logger.info("customer input a wrong email || password");
			return "customer/auth/login";
		}
	}
	
	@RequestMapping(value="/customerforgetpwd")
	public String customerForgetPwd(){
		return "customer/auth/forget";
	}
	
	@RequestMapping(value="/registascustomer")
	public String registAsCustomer(){
		return "customer/auth/register";
	}
	
	
	@RequestMapping(value="/customerregister")
	public String customerRegister(
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

	@Autowired
	public void setCustomerAuthService(ICustomerAuthService customerAuthService) {
		this.customerAuthService = customerAuthService;
	}

}
