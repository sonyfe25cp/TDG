package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.ProductCategory;

public interface ProductCategoryMapper {

	List<ProductCategory> getProductCategories(int parentId);
}
