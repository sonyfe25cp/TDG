package com.omartech.tdg.mapper;

import com.omartech.tdg.model.ShopSetting;

public interface ShopSettingMapper {
	
	public void insertShopSetting(ShopSetting shop);
	
	public void updateShopSetting(ShopSetting shop);
	
	public void translateShopSetting(ShopSetting shop);
	
	public ShopSetting getShopSettingById(int id);
	
	public ShopSetting getShopSettingBySellerId(int sellerId);

}
