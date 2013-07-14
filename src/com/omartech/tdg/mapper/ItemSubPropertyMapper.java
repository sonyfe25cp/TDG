package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.ItemSubProperty;

public interface ItemSubPropertyMapper {
	
	public List<ItemSubProperty> getItemSubPropertyListByCategoryId(int cid);

}
