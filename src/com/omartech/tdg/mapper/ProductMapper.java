package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;

public interface ProductMapper {
	
	public Product getProductById(int id);
	
	public List<Product> getProductListByPage(Page page);
	
	public List<Product> getProductListByPageAndSeller(@Param("page") Page page, @Param("sellerId") int sellerId);
	
	public List<Product> getProductListByPageAndStatus(@Param("page") Page page, @Param("status") int status);
	
	public List<Product> getSellableProductListByPage(@Param("page") Page page, @Param("sellable") int sellable, @Param("status")int status);
	
	public int insertProduct(Product product);
	
	public void deleteProduct(int id);
	
	public void updateProduct(Product product);
	
	public List<Product> getProductsInCategoryByPage(@Param("categoryId") int categoryId, @Param("page")Page page);
	
	public List<Product> searchProductByName(@Param("name")String name, @Param("page")Page page);
	
	public void changeProductsOfSeller(@Param("sellerId")int sellerId, @Param("sellable")int sellable, @Param("status") int status);
	
	public List<Product> getProductListByCountryAndByPage( @Param("countryCode")int countryCode,  @Param("page")Page page);
	
	public List<Product> searchProductByWhat(@Param("countryCode")int countryCode, @Param("productName") String productName,@Param("sellerId") int sellerId, @Param("page")Page page);
}
