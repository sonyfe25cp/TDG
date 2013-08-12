package com.omartech.tdg.action.seller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.ShopSetting;

@Controller
@RequestMapping("/seller/shopsetting/")
public class SellerShopsettingAction {
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	
	@RequestMapping("show")
	public ModelAndView showShopSetting(HttpSession session){
		Seller seller = (Seller) session.getAttribute("seller");
		int id = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(id);
		return new ModelAndView("/seller/shopsetting/show").addObject("shopsetting", shopSetting);
	}
	@RequestMapping("new")
	public ModelAndView newShopSetting(HttpSession session){
		return new ModelAndView("/seller/shopsetting/new").addObject("coinage",new Coinage() );
	}
	@RequestMapping("create")
	public ModelAndView updateShopSetting(
			@RequestParam String shippingCountry,
			@RequestParam int shippingPromiseDays,
			@RequestParam String title,
			@RequestParam String description,
			@RequestParam int defaultCoinage,
			HttpSession session
			){
		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		ShopSetting shopSetting = new ShopSetting();
		shopSetting.setSellerId(sellerId);
		shopSetting.setDefaultCoinage(defaultCoinage);
		shopSetting.setTitle(title);
		shopSetting.setDescription(description);
		shopSetting.setShippingCountry(shippingCountry);
		shopSetting.setShippingPromiseDays(shippingPromiseDays);
		shopSettingMapper.insertShopSetting(shopSetting);
		return new ModelAndView("/seller/shopsetting/show").addObject("shopsetting", shopSetting);
	}
	@RequestMapping("edit")
	public ModelAndView editShopSetting(HttpSession session){
		Seller seller = (Seller) session.getAttribute("seller");
		int id = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(id);
		if(shopSetting==null){
			shopSetting = new ShopSetting();
		}
		return new ModelAndView("/seller/shopsetting/edit").addObject("shopsetting", shopSetting);
	}
	@RequestMapping("update")
	public ModelAndView updateShopSetting(
			@RequestParam int id,
			@RequestParam String shippingCountry,
			@RequestParam int shippingPromiseDays,
			@RequestParam String title,
			@RequestParam String description,
			@RequestParam int defaultCoinage
			){
		ShopSetting shopSetting = shopSettingMapper.getShopSettingById(id);
		shopSetting.setDefaultCoinage(defaultCoinage);
		shopSetting.setDescription(description);
		shopSetting.setShippingCountry(shippingCountry);
		shopSetting.setTitle(title);
		shopSetting.setShippingPromiseDays(shippingPromiseDays);
		return new ModelAndView("/seller/shopsetting/show").addObject("shopsetting", shopSetting);
	}
	
	public ShopSettingMapper getShopSettingMapper() {
		return shopSettingMapper;
	}

	public void setShopSettingMapper(ShopSettingMapper shopSettingMapper) {
		this.shopSettingMapper = shopSettingMapper;
	}
	

}
