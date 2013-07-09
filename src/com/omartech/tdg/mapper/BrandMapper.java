package com.omartech.tdg.mapper;


import java.util.List;

import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;

public interface BrandMapper {
	public List<Brand> getBrandListByPage(Page page);
	
	public List<Brand> getBrandList();
	
	public Brand getBrandById(int id);
	
	public void insertBrand(Brand brand);
	
	public void deleteBrand(int id);
	
	public void updateBrand(Brand brand);
}
