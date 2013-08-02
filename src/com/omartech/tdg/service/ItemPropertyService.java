package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.BaseFeatureMapper;
import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.ItemProperty;
import com.omartech.tdg.model.ItemSubProperty;
import com.omartech.tdg.model.Page;

/*
 * 所有的产品普通属性的接口
 */
@Service
public class ItemPropertyService {
	@Autowired
	private ItemSubPorpertyService itemSubPropertyService;
	@Autowired
	private BaseFeatureMapper baseFeatureMapper;
	
	public ItemProperty getItemPropertyByCategoryId(int cid){
		List<ItemSubProperty> subProperties = itemSubPropertyService.getItemSubPropertyListByCategoryId(cid);
		ItemProperty itemProperty = new ItemProperty();
		itemProperty.setCid(cid);
		itemProperty.setSubProperties(subProperties);
		return itemProperty;
	}
	
	public BaseFeature getBaseFeatureById(int id){
		return baseFeatureMapper.getBaseFeatureById(id);
	}
	
	public List<BaseFeature> getBaseFeatureListByPage(Page page){
		return baseFeatureMapper.getBaseFeatureListByPage(page);
	}
	
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
	
	
	public ItemSubPorpertyService getItemSubPropertyService() {
		return itemSubPropertyService;
	}

	public void setItemSubPropertyService(
			ItemSubPorpertyService itemSubPropertyService) {
		this.itemSubPropertyService = itemSubPropertyService;
	}
	
}
