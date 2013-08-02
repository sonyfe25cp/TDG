package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SalePropertyValueMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.SaleProperty;
import com.omartech.tdg.model.SalePropertyValue;
import com.omartech.tdg.model.SaleSubProperty;
@Service
public class SalePropertyService {
	
	
	@Autowired
	private SaleSubPorpertyService saleSubPropertyService;
	
	private SalePropertyValueMapper salePropertyValueMapper;
	
	public SaleProperty getSalePropertyByCategoryId(int cid){
		List<SaleSubProperty> subProperties = saleSubPropertyService.getSaleSubPropertyListByCategoryId(cid);
		SaleProperty SaleProperty = new SaleProperty();
		SaleProperty.setId(cid);
		SaleProperty.setSubProperties(subProperties);
		return SaleProperty;
	}
	
	public List<SalePropertyValue> getSalePropertyValuesByPage(Page page){
		return salePropertyValueMapper.getSalePropertyValueListByPage(page);
	}
	
	public SalePropertyValue getSalePropertyValueById(int id){
		return salePropertyValueMapper.getSalePropertyValueById(id);
	}
	
	public void updateSalePropertyValue(SalePropertyValue salePropertyValue){
		salePropertyValueMapper.updateSalePropertyValue(salePropertyValue);
	}
	
	public SaleSubPorpertyService getSaleSubPropertyService() {
		return saleSubPropertyService;
	}

	public void setSaleSubPropertyService(
			SaleSubPorpertyService saleSubPropertyService) {
		this.saleSubPropertyService = saleSubPropertyService;
	}

	public SalePropertyValueMapper getSalePropertyValueMapper() {
		return salePropertyValueMapper;
	}

	public void setSalePropertyValueMapper(
			SalePropertyValueMapper salePropertyValueMapper) {
		this.salePropertyValueMapper = salePropertyValueMapper;
	}
}
