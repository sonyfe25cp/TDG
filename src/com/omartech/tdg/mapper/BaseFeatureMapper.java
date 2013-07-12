package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.Page;

public interface BaseFeatureMapper {

	public BaseFeature getBaseFeatureById(int id);
	
	public List<BaseFeature> getBaseFeatureListByPage(Page page);
	
	public void insertBaseFeature(BaseFeature baseFeature);
	
	public void updateBaseFeature(BaseFeature baseFeature);
	
	public void deleteBaseFeatureById(int id);
}
