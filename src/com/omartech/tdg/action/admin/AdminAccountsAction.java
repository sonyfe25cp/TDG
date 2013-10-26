package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.CountryMapper;
import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.ShopSetting;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.service.TranslatorAuthService;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.AccountStatus;

@Controller
@RequestMapping("/admin/accounts/")
public class AdminAccountsAction {

	@Autowired
	private SellerAuthService sellerService;
	@Autowired
	private CustomerAuthService customerService;
	@Autowired
	private TranslatorAuthService translatorService;
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	@Autowired
	private CountryMapper countryMapper;
	@RequestMapping("/{userType}/{userId}")
	public ModelAndView customersList(@PathVariable String userType, @PathVariable int userId){
		if(userType.equals("sellers")){
			Seller seller = sellerService.getSellerById(userId);
			ShopSetting shopsetting = shopSettingMapper.getShopSettingBySellerId(userId);
			Country country = null;
			if(shopsetting !=null){
				int countryId = shopsetting.getShippingCountry();
				country = countryMapper.getCountryById(countryId);
			}
			return new ModelAndView("/admin/accounts/sellers-show").addObject("seller", seller).addObject("shopsetting", shopsetting).addObject("country", country); 
		}else if(userType.equals("customers")){
			Customer customer = customerService.getCustomerById(userId);
			return new ModelAndView("/admin/accounts/customers-show").addObject("customer", customer); 
		}else{
			return null;
		}
	}
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
	@RequestMapping("/translators")
	public ModelAndView translatorsList(@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page =new Page(pageNo, pageSize);
		List<Translator> translators = translatorService.getTranslatorListByPage(page);
		return new ModelAndView("/admin/accounts/translators-list").addObject("translators", translators).addObject("pageNo", pageNo);
	}
	@RequestMapping("/translator/new")
	public String newTranslator(){
		return "/admin/accounts/new-translator";
	}
	@RequestMapping("/translator/create")
	public String createTranslator(
			@RequestParam String email,
			@RequestParam String password
			){
		Translator translator = new Translator();
		translator.setEmail(email);
		translator.setPassword(password);
		translator.setAccountStatus(AccountStatus.OK);
		translatorService.insertTranslator(translator);
		return "redirect:/admin/accounts/translators";
	}
	
	@RequestMapping("/activeseller")
	public String activeSellerAccount(@RequestParam int id, @RequestParam int accountStatus){
			sellerService.changeAccountStatus(id, accountStatus);
		return "redirect:/admin/accounts/sellers";
	}
	@RequestMapping("/activecustomer")
	public String activeCustomerAccount(@RequestParam int id, @RequestParam int accountStatus){
			customerService.changeAccountStatus(id, accountStatus);
			
		return "redirect:/admin/accounts/customers";
	}
	@RequestMapping("/activetranslator")
	public String activeTranslatorAccount(@RequestParam int id, @RequestParam int accountStatus){
		translatorService.changeAccountStatus(id, accountStatus);
		return "redirect:/admin/accounts/translators";
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
	public TranslatorAuthService getTranslatorService() {
		return translatorService;
	}
	public void setTranslatorService(TranslatorAuthService translatorService) {
		this.translatorService = translatorService;
	}
	
	
}
