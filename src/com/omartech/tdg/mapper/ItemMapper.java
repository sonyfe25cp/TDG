package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Page;

public interface ItemMapper {

	public void insertItem(Item item);
	
	public void updateItem(Item item);
	
	public void deleteItem(int id);
	
	public Item getItemById(int id);
	
	public Item getItemBySku(String sku);
	
	public Item getItemByFeatureAndProductId(@Param("feature") String feature, @Param("productId") int productId);
	
	public List<Item> getItemListByPage(Page page);
	
	public void updateSku(Item item);
	
//	public List<Item> getItemsByProductId(int productId);
	//根据status取
	public List<Item> getItemsByProductIdAndStatus(@Param("productId")int productId, @Param("status") int statusId);
	//默认取未删除的
	public List<Item> getSellAbleItemsByProductId(@Param("productId")int productId, @Param("sellable") int sellable);
	
	public void updateProductLine(Item item);
	
	public void updateStock(@Param("itemId")int itemId, @Param("stock") int stock);
}
