package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.ProductLine;

public interface ProductLineMapper {

	public int insertProductLine(ProductLine productLine);
	
	public ProductLine getProductLineById(int id);
	
	public List<ProductLine> getProductLinesByParentId(int parentId);//取parentId的子节点
	
	public void updateProductLine(ProductLine productLine);
	
	public void deleteProductLine(int id);
	
}
