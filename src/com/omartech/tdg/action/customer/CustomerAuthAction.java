package com.omartech.tdg.action.customer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.utils.InputChecker;

@Controller
public class CustomerAuthAction {
	
	@Autowired
	private CustomerAuthService customerAuthService;

	Logger logger = Logger.getLogger(CustomerAuthAction.class);
	
	@RequestMapping("/isCustomerEmailExist")
	@ResponseBody
	public boolean isEmailExist(@RequestParam String email){
		boolean flag = customerAuthService.isEmailExist(email);
		return flag;
	}
	
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
			HttpSession session,
			HttpServletResponse response){
		if(InputChecker.emailChecker(email) && InputChecker.passwordChecker(password)){
			Customer customer = customerAuthService.isLegalUser(email, password);
			if(customer !=null ){
				session.setAttribute("customer", customer);
				response.addCookie(new Cookie("customer", email));
				return "redirect:/customerindex";
			}else{
				logger.info("customer input a wrong email || password");
				return "customer/auth/login";
			}
		}else{
			return "redirect:/loginascustomer";
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
		if(InputChecker.emailChecker(email) && InputChecker.passwordChecker(password)){
			
			boolean flag = customerAuthService.isEmailExist(email);
			Customer customer = null;
			if(!flag){
				customer = new Customer(email,password);
				customerAuthService.add(customer);
				session.setAttribute("customer", customer);
			}
			return new ModelAndView("customer/auth/confirm").addObject("customer", customer);
		}else{
			return new ModelAndView("customer/auth/register");
		}
	}
	@RequestMapping("/customer/auth/welcome")
	public String welcome(){
		return "customer/auth/welcome";
	}

	
	@RequestMapping("/customer/auth/show")
	public ModelAndView showSelf(HttpSession session){
		Customer customer = (Customer) session.getAttribute("customer");
		return new ModelAndView("/customer/auth/show").addObject("customer", customer);
	}
	@RequestMapping("/customer/auth/edit")
	public ModelAndView editSelf(HttpSession session){
		Customer customer = (Customer) session.getAttribute("customer");
		return new ModelAndView("/customer/auth/edit").addObject("customer", customer);
	}
	
	@RequestMapping("/customer/auth/update")
	public String updateSelf(
			@RequestParam String oldPassword,
			@RequestParam String password,
			HttpSession session
			){
		Customer customer = (Customer) session.getAttribute("customer");
		if(oldPassword.equals(customer.getPassword())){
			customer.setPassword(password);
			customerAuthService.updatePassword(customer);
		}
		return "redirect:/customer/auth/show";
	}
	
	
	@RequestMapping("/customer/auth/taobao")
	public ModelAndView showTaobao(HttpSession session){
		Customer customer = (Customer) session.getAttribute("customer");
		return new ModelAndView("/customer/auth/taobao").addObject("customer", customer);
	}
	
	@RequestMapping("/customer/auth/taobao/new")
	public ModelAndView connectTaobao(){
		return new ModelAndView("/customer/auth/connect");
	}
	
	
	public CustomerAuthService getCustomerAuthService() {
		return customerAuthService;
	}

	public void setCustomerAuthService(CustomerAuthService customerAuthService) {
		this.customerAuthService = customerAuthService;
	}

}
