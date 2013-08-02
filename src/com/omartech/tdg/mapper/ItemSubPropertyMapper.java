package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.ItemSubProperty;
import com.omartech.tdg.model.Page;

public interface ItemSubPropertyMapper {
	
	public List<ItemSubProperty> getItemSubPropertyListByCategoryId(int cid);
	
	public ItemSubProperty getItemSubPropertyByPid(@Param("pid") int pid, @Param("cid") int cid);

	public List<ItemSubProperty> getItemSubPropertyListByPage(Page page);
	
	public ItemSubProperty getItemSubPropertyById(int id);
	
	public void updateItemSubPropertyById(ItemSubProperty itemSubProperty);//只能修改pname和english
	
}
