package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.ProductLineMapper;
import com.omartech.tdg.model.ProductLine;

@Service
public class ProductLineService {

	@Autowired
	private ProductLineMapper productLineMapper;
	
	public int insertProductLine(ProductLine productLine){
		if(productLine.getLevel() == 0){
			productLine.setLevel(1);
		}
		if(productLine.getParentId() == 0){
			productLine.setParentId(0);
		}
		return productLineMapper.insertProductLine(productLine);
	}
	
	public ProductLine getProductLineById(int id){
		return productLineMapper.getProductLineById(id);
	}
	
	public ProductLine findGrandParentById(int id){
		ProductLine pl = getProductLineById(id);
		if(pl.getParentId() != 0)
			return findGrandParentById(pl.getParentId());
		else
			return pl;
	}
	
	public List<ProductLine> getProductLinesByParentId(int parentId){
		return productLineMapper.getProductLinesByParentId(parentId);
	}
	
	public void updateProductLine(ProductLine productLine){
		productLineMapper.updateProductLine(productLine);
	}
	
	public void deleteProductLine(int id){
		productLineMapper.deleteProductLine(id);
	}

	public ProductLineMapper getProductLineMapper() {
		return productLineMapper;
	}

	public void setProductLineMapper(ProductLineMapper productLineMapper) {
		this.productLineMapper = productLineMapper;
	}
	
}
