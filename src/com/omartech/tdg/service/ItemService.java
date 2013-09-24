package com.omartech.tdg.service;

import java.util.Date;
import java.util.List;

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
		if(item.getAvailableQuantity() < item.getSafeStock()){
			item.setActive(0);
		}else{
			item.setActive(1);
		}
		itemMapper.insertItem(item);
	}
	public float getPriceByItemId(int id, int count){
		Item item = getItemById(id);
		Date now = new Date(System.currentTimeMillis());
		Date begin = item.getPromotionTime();
		Date end = item.getPromotionEnd();
		int min = item.getMinimumQuantity();
		int max = item.getMaximumAcceptQuantity();
		if(count < max && count > min){//优先批发价
			float pifa = item.getWholePrice();
			if(pifa - 0.0 < 0.01)
				return item.getRetailPrice();
			else
				return item.getWholePrice();
		}
		if(begin != null && end !=null){//如果在优惠期就用优惠价
			if(now.after(begin) && end.after(now)){
				float pro = item.getPromotionPrice();
				if(pro - 0.0 < 0.1)
					return item.getRetailPrice();
				else
					return item.getPromotionPrice();
			}else{
				return item.getRetailPrice();
			}
		}else{
			return item.getRetailPrice();
		}
	}
	public Item getItemBySku(String sku) {//for 卖家
		Item item = itemMapper.getItemBySku(sku);
		transferParams(item);
		return item;
	}
	
	public Item getItemById(int id){//for 系统
		Item item = itemMapper.getItemById(id);
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
		
	}

	public ItemMapper getItemMapper() {
		return itemMapper;
	}

	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}

}
