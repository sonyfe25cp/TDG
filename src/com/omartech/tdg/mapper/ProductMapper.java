package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Product;

public interface ProductMapper {
	
	Product getProductById(long id);
	
	List<Product> getProductListByPage(int pageNo, int pageSize);
	
	void addProduct(Product product);
	
}
