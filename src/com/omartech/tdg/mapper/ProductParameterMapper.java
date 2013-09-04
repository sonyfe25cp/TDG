package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.ProductParameter;

public interface ProductParameterMapper {
	
	public int insertProductParameter(ProductParameter productParameter);
	
	public ProductParameter getProductParameterById(int id);
	
	public List<ProductParameter> getProductParametersByParentId(int parentId);//取parentId的子节点
	
	public void updateProductParameter(ProductParameter productParameter);
	
	public void deleteProductParameter(int id);
}
