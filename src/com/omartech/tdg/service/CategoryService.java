package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.ProductCategoryMapper;
import com.omartech.tdg.model.ProductCategory;

@Service
public class CategoryService {

	@Autowired
	private ProductCategoryMapper productCategoryMapper;
	
	public List<ProductCategory> getProductCategories(){
		return productCategoryMapper.getProductCategories(0);
	}
	
	public List<ProductCategory> getSubProductCategories(int parentId){
		return productCategoryMapper.getProductCategories(parentId);
	}

	public ProductCategory  findRootCategory(int nodeId){
		return productCategoryMapper.getProductCategoryById(nodeId);
	}

	
	
	public ProductCategoryMapper getProductCategoryMapper() {
		return productCategoryMapper;
	}

	public void setProductCategoryMapper(ProductCategoryMapper productCategoryMapper) {
		this.productCategoryMapper = productCategoryMapper;
	}
	
}
