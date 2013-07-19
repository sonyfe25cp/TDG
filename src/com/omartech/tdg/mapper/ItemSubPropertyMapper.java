package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.ItemSubProperty;

public interface ItemSubPropertyMapper {
	
	public List<ItemSubProperty> getItemSubPropertyListByCategoryId(int cid);
	
	public ItemSubProperty getItemSubPropertyByPid(@Param("pid") int pid, @Param("cid") int cid);

}
