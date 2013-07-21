package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;

public interface ProductMapper {
	
	public Product getProductById(long id);
	
	public List<Product> getProductListByPage(Page page);
	
	public long insertProduct(Product product);
	
	public void deleteProduct(int id);
	
	public void updateProductByTranslate(Product product);
	
	public List<Product> getProductsInCategoryByPage(@Param("categoryId") int categoryId, @Param("page")Page page);
}
