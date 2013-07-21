package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Page;

public interface ItemMapper {

	public long insertItem(Item item);
	
	public void updateItem(Item item);
	
	public void deleteItem(long id);
	
	public Item getItemById(long id);
	
	public Item getItemBySku(long sku);
	
	public List<Item> getItemListByPage(Page page);
	
	public void updateSku(Item item);
	
	public void updateDefaultSku(long id);
	
	public List<Item> getItemListByProductId(int productId);
	
}
