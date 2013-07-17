package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SalePropertyValueMapper;
import com.omartech.tdg.mapper.SaleSubPropertyMapper;
import com.omartech.tdg.model.SalePropertyValue;
import com.omartech.tdg.model.SaleSubProperty;
@Service
public class SaleSubPorpertyService {
	@Autowired
	private SaleSubPropertyMapper saleSubPorpertyMapper;
	@Autowired
	private SalePropertyValueMapper salePropertyValueMapper;
	
	public List<SaleSubProperty> getSaleSubPropertyListByCategoryId(int cid){
		List<SaleSubProperty> subProperties = saleSubPorpertyMapper.getSaleSubPropertyListByCategoryId(cid);
		for(SaleSubProperty subProperty : subProperties){
			String vids = subProperty.getVid();
			if(vids.length() < 1 ){
				continue;
			}
			String[] tmps = vids.split(",");
			List<SalePropertyValue> propertyValues = new ArrayList<SalePropertyValue>();
			for(String vid : tmps){
				SalePropertyValue bf = salePropertyValueMapper.getSalePropertyValueById(Integer.parseInt(vid));
				propertyValues.add(bf);
			}
			subProperty.setSalePropertyValues(propertyValues);
		}
		return subProperties;
	}

	public SaleSubPropertyMapper getsaleSubPorpertyMapper() {
		return saleSubPorpertyMapper;
	}
	public void setsaleSubPorpertyMapper(SaleSubPropertyMapper saleSubPorpertyMapper) {
		this.saleSubPorpertyMapper = saleSubPorpertyMapper;
	}
	public SalePropertyValueMapper getSalePropertyValueMapper() {
		return salePropertyValueMapper;
	}
	public void setSalePropertyValueMapper(SalePropertyValueMapper salePropertyValueMapper) {
		this.salePropertyValueMapper = salePropertyValueMapper;
	}
}
