package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.SaleSubProperty;

public interface SaleSubPropertyMapper {

	public List<SaleSubProperty> getSaleSubPropertyListByCategoryId(int cid);

	public SaleSubProperty getSaleSubPropertyByPid(@Param("pid") int pid, @Param("cid") int cid);

}
