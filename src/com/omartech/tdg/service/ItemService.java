package com.omartech.tdg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.ItemMapper;
import com.omartech.tdg.model.Item;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;

	@Transactional
	public void insertItem(Item item) {
		itemMapper.insertItem(item);
		int sku = item.getSku();
		if (sku == 0) {
			itemMapper.updateDefaultSku(item.getId());
		}
	}

	public Item getItemBySku(int id) {
		Item item = itemMapper.getItemBySku(id);
		transferParams(item);
		return item;
	}

	public List<Item> getItemsByProductId(int productId) {
		List<Item> items = itemMapper.getItemListByProductId(productId);

		for (Item item : items) {
			transferParams(item);
		}
		return items;
	}

	private void transferParams(Item item) {
		int cid = item.getCategoryId();
		String json = item.getFeatureJson();
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String> paramsInEnglish = new HashMap<String, String>();
		if (json != null && json.length() > 1) {
			String tmps[] = json.split(";");
			for (String tmp : tmps) {
				String mapString[] = tmp.split(":");
				String pid = mapString[0];
				String vid = mapString[1];
				SaleSubProperty subProperty = saleSubPropertyMapper
						.getSaleSubPropertyByPid(Integer.parseInt(pid), cid);
				String name = subProperty.getPname();
				String nameInEnglish = subProperty.getEnglish();
				SalePropertyValue valueProperty = salePropertyValueMapper
						.getSalePropertyValueById(Integer.parseInt(vid));
				String value = valueProperty.getName();
				String valueInEnglish = valueProperty.getEnglish();
				params.put(name, value);
				paramsInEnglish.put(nameInEnglish, valueInEnglish);
			}
			item.setParams(params);
			item.setParamsInEnglish(paramsInEnglish);
		}
	}

	public ItemMapper getItemMapper() {
		return itemMapper;
	}

	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}

}
