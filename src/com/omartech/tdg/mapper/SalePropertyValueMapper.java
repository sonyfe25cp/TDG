package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.SalePropertyValue;

public interface SalePropertyValueMapper {
	
	public SalePropertyValue getSalePropertyValueById(int vid);
	
	public List<SalePropertyValue> getSalePropertyValueListByPage(Page page);
	
	public void updateSalePropertyValue(SalePropertyValue salePropertyValue);
	
	public void deleteSalePropertyValue(int id);

}
