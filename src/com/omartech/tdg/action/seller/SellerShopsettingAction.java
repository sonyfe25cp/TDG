package com.omartech.tdg.action.seller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.CountryMapper;
import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.ShopSetting;

@Controller
@RequestMapping("/seller/shopsetting/")
public class SellerShopsettingAction {
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	@Autowired
	private CountryMapper countryMapper;
	
	@RequestMapping("show")
	public ModelAndView showShopSetting(HttpSession session){
		Seller seller = (Seller) session.getAttribute("seller");
		int id = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(id);
		Country  country = null;
		if(shopSetting !=null)
			country = countryMapper.getCountryById(shopSetting.getShippingCountry());
		return new ModelAndView("/seller/shopsetting/show").addObject("shopsetting", shopSetting).addObject("country", country);
	}
	@RequestMapping("new")
	public ModelAndView newShopSetting(HttpSession session){
		List<Country> countries = countryMapper.getCountries();
		return new ModelAndView("/seller/shopsetting/new").addObject("coinage",new Coinage()).addObject("countries",countries);
	}
	@RequestMapping("create")
	public String updateShopSetting(
			@RequestParam int shippingCountry,
			@RequestParam int shippingPromiseDays,
			@RequestParam String title,
			@RequestParam String description,
			@RequestParam int defaultCoinage,
			@RequestParam String bankName,
			@RequestParam String bankAddress,
			@RequestParam String bankCity,
			@RequestParam String swiftCode,
			@RequestParam String accountName,
			@RequestParam String accountNumber,
			HttpSession session
			){
		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		ShopSetting shopSetting = new ShopSetting( sellerId,  title,  shippingCountry,
				 shippingPromiseDays,  description,  defaultCoinage,
				 bankName,  swiftCode,  bankCity,
				 bankAddress,  accountName,  accountNumber);
		
		shopSettingMapper.insertShopSetting(shopSetting);
		return "redirect:/seller/shopsetting/show";
	}
	@RequestMapping("edit")
	public ModelAndView editShopSetting(HttpSession session){
		Seller seller = (Seller) session.getAttribute("seller");
		int id = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(id);
		if(shopSetting==null){
			shopSetting = new ShopSetting();
		}
		List<Country> countries = countryMapper.getCountries();
		return new ModelAndView("/seller/shopsetting/edit").addObject("shopsetting", shopSetting).addObject("countries",countries);
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateShopSetting(
			@RequestParam int id,
			@RequestParam int shippingPromiseDays,
			@RequestParam String title,
			@RequestParam String description,
			@RequestParam String bankName,
			@RequestParam String bankAddress,
			@RequestParam String bankCity,
			@RequestParam String swiftCode,
			@RequestParam String accountName,
			@RequestParam String accountNumber
			){
		ShopSetting shopSetting = shopSettingMapper.getShopSettingById(id);
		shopSetting.setDescription(description);
		shopSetting.setTitle(title);
		shopSetting.setShippingPromiseDays(shippingPromiseDays);
		shopSetting.setAccountName(accountName);
		shopSetting.setAccountNumber(accountNumber);
		shopSetting.setBankAddress(bankAddress);
		shopSetting.setBankCity(bankCity);
		shopSetting.setBankName(bankName);
		shopSetting.setSwiftCode(swiftCode);
		shopSettingMapper.updateShopSetting(shopSetting);
		return "redirect:/seller/shopsetting/show";
	}
	
	public ShopSettingMapper getShopSettingMapper() {
		return shopSettingMapper;
	}

	public void setShopSettingMapper(ShopSettingMapper shopSettingMapper) {
		this.shopSettingMapper = shopSettingMapper;
	}
	

}
