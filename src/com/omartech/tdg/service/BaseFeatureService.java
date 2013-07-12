package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.BaseFeatureMapper;
import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.Page;
@Service
public class BaseFeatureService {
	
	@Autowired
	private BaseFeatureMapper baseFeatureMapper;
	
	public BaseFeature getBaseFeatureById(int id){
		return baseFeatureMapper.getBaseFeatureById(id);
	}
	
	public List<BaseFeature> getBaseFeatureListByPage(Page page){
		return baseFeatureMapper.getBaseFeatureListByPage(page);
	}
	
//	public void insertBaseFeature(BaseFeature baseFeature){
//		
//	}
	
	public void updateBaseFeature(BaseFeature baseFeature){
		baseFeatureMapper.updateBaseFeature(baseFeature);
	}
	
	public void deleteBaseFeatureById(int id){
		baseFeatureMapper.deleteBaseFeatureById(id);
	}
	
	public void updateBaseFeatureByTranslator(BaseFeature baseFeature){
		baseFeatureMapper.updateBaseFeature(baseFeature);
	}

	
	
	
	public BaseFeatureMapper getBaseFeatureMapper() {
		return baseFeatureMapper;
	}

	public void setBaseFeatureMapper(BaseFeatureMapper baseFeatureMapper) {
		this.baseFeatureMapper = baseFeatureMapper;
	}
	
	
}
