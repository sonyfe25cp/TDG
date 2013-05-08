package com.omartech.tdg.service.impl;

import com.omartech.tdg.mapper.ProductMapper;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.IProductService;

public class ProductServiceImpl implements IProductService {

	private ProductMapper productMapper;

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@Override
	public Product getProductById(long id) {
		
		Product product = productMapper.getProductById(id);
		
		return product;
	}
}
