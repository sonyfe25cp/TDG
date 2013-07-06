package com.omartech.tdg.service;

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
	public void insertItem(Item item){
		itemMapper.insertItem(item);
	}

	public ItemMapper getItemMapper() {
		return itemMapper;
	}
	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}
}
