package com.omartech.tdg.action.customer;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.service.customer.CustomerAuthService;

@Controller
public class CustomerAuthAction {
	
	@Autowired
	private CustomerAuthService customerAuthService;

	Logger logger = Logger.getLogger(CustomerAuthAction.class);
	
	@RequestMapping(value="/loginascustomer")
	public String loginAsCustomer(){
		return "customer/auth/login";
	}
	@RequestMapping(value="/customer/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/customerindex";
	}
	@RequestMapping(value="/customerlogin", method=RequestMethod.POST)
	public String customerLogin(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "password", required = true) String password,
			HttpSession session){
		
		Customer customer = customerAuthService.isLegalUser(email, password);
		if(customer !=null ){
			session.setAttribute("customer", customer);
			return "redirect:/customerindex";
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
	
	
	@RequestMapping(value="/customerregister", method=RequestMethod.POST)
	public ModelAndView customerRegister(
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "password", required = true) String password,
			HttpSession session
			){
		boolean flag = customerAuthService.isEmailExist(email);
		Customer customer = null;
		if(!flag){
			customer = new Customer(email,password);
			customerAuthService.add(customer);
			session.setAttribute("customer", customer);
		}
		return new ModelAndView("customer/auth/confirm").addObject("customer", customer);
	}
	@RequestMapping("/customer/auth/welcome")
	public String welcome(){
		return "customer/auth/welcome";
	}

	public CustomerAuthService getCustomerAuthService() {
		return customerAuthService;
	}

	public void setCustomerAuthService(CustomerAuthService customerAuthService) {
		this.customerAuthService = customerAuthService;
	}

}
