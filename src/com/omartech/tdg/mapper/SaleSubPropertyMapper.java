package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.SaleSubProperty;

public interface SaleSubPropertyMapper {

	public List<SaleSubProperty> getSaleSubPropertyListByCategoryId(int cid);


}
