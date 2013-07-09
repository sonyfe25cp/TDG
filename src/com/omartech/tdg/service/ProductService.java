package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.ProductMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;

	public Product getProductById(long id){
		return productMapper.getProductById(id);
	}
	
	public List<Product> getProductListByPage(Page page){
		return productMapper.getProductListByPage(page);
	}
	@Transactional
	public void insertProduct(Product product){
		productMapper.insertProduct(product);
	}
	
	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	void updateProduct(Product product){
		
	}
	
}
