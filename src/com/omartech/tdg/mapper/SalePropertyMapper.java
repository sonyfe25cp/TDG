package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.SaleProperty;
import com.omartech.tdg.model.Page;

public interface SalePropertyMapper {
	
	public SaleProperty getSalePropertyById(int id);
	
	public List<SaleProperty> getSalePropertyListByPage(Page page);
	
	public void insertSaleProperty(SaleProperty saleProperty);
	
	public void updateSaleProperty(SaleProperty saleProperty);
	
	public void deleteSalePropertyById(int id);
}
