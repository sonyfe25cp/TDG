package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.ProductParameterMapper;
import com.omartech.tdg.model.ProductParameter;
@Service
public class ProductParameterService {
	@Autowired
	private ProductParameterMapper productParameterMapper;
	
	public int insertProductParameter(ProductParameter ProductParameter){
		if(ProductParameter.getLevel() == 0){
			ProductParameter.setLevel(1);
		}
		if(ProductParameter.getParentId() == 0){
			ProductParameter.setParentId(0);
		}
		return productParameterMapper.insertProductParameter(ProductParameter);
	}
	
	public ProductParameter getProductParameterByEnglish(String english){
		return productParameterMapper.getProductParameterByEnglish(english);
	}
	public ProductParameter getProductParameterById(int id){
		return productParameterMapper.getProductParameterById(id);
	}
	
	public ProductParameter findGrandParentById(int id){
		ProductParameter pl = getProductParameterById(id);
		if(pl.getParentId() != 0)
			return findGrandParentById(pl.getParentId());
		else
			return pl;
	}
	
	public List<ProductParameter> getProductParametersByParentId(int parentId){
		return productParameterMapper.getProductParametersByParentId(parentId);
	}
	
	public void updateProductParameter(ProductParameter ProductParameter){
		productParameterMapper.updateProductParameter(ProductParameter);
	}
	
	public void deleteProductParameter(int id){
		productParameterMapper.deleteProductParameter(id);
	}

	public ProductParameterMapper getProductParameterMapper() {
		return productParameterMapper;
	}

	public void setProductParameterMapper(
			ProductParameterMapper productParameterMapper) {
		this.productParameterMapper = productParameterMapper;
	}
}
