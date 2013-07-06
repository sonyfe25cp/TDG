package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;

public interface ProductMapper {
	
	public Product getProductById(long id);
	
	public List<Product> getProductListByPage(Page page);
	
	public void insertProduct(Product product);
	
	public void deleteProduct(int id);
	
	public void updateProductByTranslate(Product product);
}
