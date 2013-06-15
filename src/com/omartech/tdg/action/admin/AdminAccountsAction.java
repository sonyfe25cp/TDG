package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;

@Controller
@RequestMapping("/admin/accounts/")
public class AdminAccountsAction {

	@Autowired
	private SellerAuthService sellerService;
	@Autowired
	private CustomerAuthService customerService;
	
	@RequestMapping("/customers")
	public ModelAndView customersList(@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page =new Page(pageNo, pageSize);
		List<Customer> customers = customerService.getCustomerListByPage(page);
		return new ModelAndView("/admin/accounts/customers-list").addObject("customers", customers).addObject("pageNo", pageNo);
	}
	@RequestMapping("/sellers")
	public ModelAndView sellersList(@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page =new Page(pageNo, pageSize);
		List<Seller> sellers = sellerService.getSellerListByPage(page);
		return new ModelAndView("/admin/accounts/sellers-list").addObject("sellers", sellers).addObject("pageNo", pageNo);
	}
	
	@RequestMapping("/activeseller")
	public String activeSellerAccount(@RequestParam int id){
			sellerService.active(id);
		return "redirect:/admin/accounts/sellers";
	}
	@RequestMapping("/activecustomer")
	public String activeCustomerAccount(@RequestParam int id){
			customerService.active(id);
		return "redirect:/admin/accounts/customers";
	}
	@RequestMapping("/disactiveseller")
	public String disActiveSellerAccount(@RequestParam int id){
			sellerService.disActive(id);
		return "redirect:/admin/accounts/sellers";
	}
	@RequestMapping("/disactivecustomer")
	public String disActiveCustomerAccount(@RequestParam int id){
			customerService.disActive(id);
		return "redirect:/admin/accounts/customers";
	}
	
	
	public SellerAuthService getSellerService() {
		return sellerService;
	}
	public void setSellerService(SellerAuthService sellerService) {
		this.sellerService = sellerService;
	}
	public CustomerAuthService getCustomerService() {
		return customerService;
	}
	public void setCustomerService(CustomerAuthService customerService) {
		this.customerService = customerService;
	}
	
	
}
