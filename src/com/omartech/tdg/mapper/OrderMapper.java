package com.omartech.tdg.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Page;

public interface OrderMapper {

	
	public void insertOrder(Order order);
	
	public Order getOrderById(long id);
	
	public void updateOrder(Order order);
	
	public List<Order> getCustomerOrdersByPage(@Param("customerId") int customerId, @Param("page") Page page);
	
	public List<Order> getSellerOrdersByPage(@Param("sellerId") int sellerId, @Param("page") Page page);
	
	public List<Order> getOrdersByPage(Page page);
	
	public List<Order> getCustomerOrdersByStatusAndPage(@Param("customerId") int customerId, @Param("status") int status, @Param("page") Page page);
	
	public List<Order> getSellerOrdersByStatusAndPage(@Param("sellerId") int sellerId, @Param("status") int status, @Param("page") Page page);
	
	public List<Order> getOrdersByStatusAndPage(@Param("status") int status, @Param("page") Page page);
	
	public List<Order> getOrdersByParentId(int parentId);
	
	public List<Order> getOrdersByDateRange(@Param("begin") Date begin, @Param("end")Date end);
	
	public List<Order> getOrdersByDateRangeAndSellerId(@Param("begin") Date begin, @Param("end")Date end, @Param("sellerId") int sellerId);
	
	public List<Order> getReturnAvailableOrders();//还可以退货的订单
	
	public List<Order> getOrdersInSellerObserving();
	
	public List<Order> getOrdersInCustomerObserving();
}
