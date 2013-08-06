package com.omartech.tdg.exception;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;

public class OrderItemsException extends RuntimeException{
	
	public OrderItemsException(Order order){
		
	}
	
    public OrderItemsException(OrderItem orderItem){
		
	}

}
