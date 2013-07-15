package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SalePropertyMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.SaleProperty;
@Service
public class SalePropertyService {
	
	@Autowired
	private SalePropertyMapper salePropertyMapper;
	
	public SaleProperty getSalePropertyByCategoryId(int id){
		return null;
	}
	
	public SaleProperty getSalePropertyById(int id){
		return salePropertyMapper.getSalePropertyById(id);
	}
	
	public List<SaleProperty> getSalePropertyListByPage(Page page){
		return salePropertyMapper.getSalePropertyListByPage(page);
	}
	
	public void updateSaleProperty(SaleProperty saleProperty){
		salePropertyMapper.updateSaleProperty(saleProperty);
	}
	
	public void deleteSalePropertyById(int id){
		salePropertyMapper.deleteSalePropertyById(id);
	}
	
	public void updateSalePropertyByTranslator(SaleProperty saleProperty){
		salePropertyMapper.updateSaleProperty(saleProperty);
	}

	
	
	
	public SalePropertyMapper getSalePropertyMapper() {
		return salePropertyMapper;
	}

	public void setSalePropertyMapper(SalePropertyMapper salePropertyMapper) {
		this.salePropertyMapper = salePropertyMapper;
	}
	
	
}
