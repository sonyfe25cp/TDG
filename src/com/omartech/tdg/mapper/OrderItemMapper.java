package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.OrderItem;

public interface OrderItemMapper {

	public int insertOrderItem(OrderItem orderItem);

	public List<OrderItem> getOrderItemsByOrderId(long orderId);
}
