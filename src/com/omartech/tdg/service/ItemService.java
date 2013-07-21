package com.omartech.tdg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.ItemMapper;
import com.omartech.tdg.mapper.SalePropertyValueMapper;
import com.omartech.tdg.mapper.SaleSubPropertyMapper;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.SalePropertyValue;
import com.omartech.tdg.model.SaleSubProperty;
@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private SalePropertyValueMapper salePropertyValueMapper;
	@Autowired
	private SaleSubPropertyMapper saleSubPropertyMapper;
	@Transactional
	public void insertItem(Item item){
		
		long id = itemMapper.insertItem(item);
		long sku = item.getSku();
		if(sku == 0){
			itemMapper.updateDefaultSku(id);
		}
	}
	
	public Item getItemBySku(int id){
		Item item = itemMapper.getItemBySku(id);
		int cid = item.getCategoryId();
		String json = item.getFeatureJson();
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String> paramsInEnglish = new HashMap<String, String>();
		if(json!=null && json.length() > 1){
			String tmps[] = json.split(",");
			for(String tmp: tmps){
				String mapString[] = tmp.split(":");
				String pid = mapString[0];
				String vid = mapString[1];
				SaleSubProperty subProperty = saleSubPropertyMapper.getSaleSubPropertyByPid(Integer.parseInt(pid),cid);
				String name = subProperty.getPname();
				String nameInEnglish = subProperty.getEnglish();
				SalePropertyValue valueProperty = salePropertyValueMapper.getSalePropertyValueById(Integer.parseInt(vid));
				String value = valueProperty.getName();
				String valueInEnglish = valueProperty.getEnglish();
				params.put(name, value);
				paramsInEnglish.put(nameInEnglish, valueInEnglish);
			}
			item.setParams(params);
			item.setParamsInEnglish(paramsInEnglish);
		}
		return item;
	}
	
	public List<Item> getItemsByProductId(int productId){
		List<Item> items = itemMapper.getItemListByProductId(productId);
		
		return items;
	}

	public ItemMapper getItemMapper() {
		return itemMapper;
	}
	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}

	public SalePropertyValueMapper getSalePropertyValueMapper() {
		return salePropertyValueMapper;
	}

	public void setSalePropertyValueMapper(
			SalePropertyValueMapper salePropertyValueMapper) {
		this.salePropertyValueMapper = salePropertyValueMapper;
	}

	public SaleSubPropertyMapper getSaleSubPropertyMapper() {
		return saleSubPropertyMapper;
	}

	public void setSaleSubPropertyMapper(SaleSubPropertyMapper saleSubPropertyMapper) {
		this.saleSubPropertyMapper = saleSubPropertyMapper;
	}
}
