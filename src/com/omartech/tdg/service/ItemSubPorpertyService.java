package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.BaseFeatureMapper;
import com.omartech.tdg.mapper.ItemSubPropertyMapper;
import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.ItemSubProperty;
@Service
public class ItemSubPorpertyService {
	@Autowired
	private ItemSubPropertyMapper itemSubPorpertyMapper;
	@Autowired
	private BaseFeatureMapper baseFeatureMapper;
	
	public List<ItemSubProperty> getItemSubPropertyListByCategoryId(int cid){
		List<ItemSubProperty> subProperties = itemSubPorpertyMapper.getItemSubPropertyListByCategoryId(cid);
		for(ItemSubProperty subProperty : subProperties){
			String vids = subProperty.getVid();
			String[] tmps = vids.split(",");
			List<BaseFeature> propertyValues = new ArrayList<BaseFeature>();
			for(String vid : tmps){
				BaseFeature bf = baseFeatureMapper.getBaseFeatureById(Integer.parseInt(vid));
				propertyValues.add(bf);
			}
			subProperty.setBaseFeatures(propertyValues);
		}
		return subProperties;
	}

	public ItemSubPropertyMapper getItemSubPorpertyMapper() {
		return itemSubPorpertyMapper;
	}
	public void setItemSubPorpertyMapper(ItemSubPropertyMapper itemSubPorpertyMapper) {
		this.itemSubPorpertyMapper = itemSubPorpertyMapper;
	}
	public BaseFeatureMapper getBaseFeatureMapper() {
		return baseFeatureMapper;
	}
	public void setBaseFeatureMapper(BaseFeatureMapper baseFeatureMapper) {
		this.baseFeatureMapper = baseFeatureMapper;
	}
}
