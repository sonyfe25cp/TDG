package com.omartech.tdg.mapper;

import com.omartech.tdg.model.Order;

public interface OrderMapper {

	
	public int insertOrder(Order order);
	
	public Order getOrderById(int id);
	
	public void updateOrder(Order order);
	
}
