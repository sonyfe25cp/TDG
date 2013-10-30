package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Cart;

public interface CartMapper {

	public void insert(Cart cart);
	
	public void deleteByCustomerId(int customerId);
	
	public void deleteByCustomerIdAndItemId(@Param("customerId")int customerId,@Param("itemId") int itemId);
	
	public void deleteById(int id);
	
	public void update(Cart cart);
	
	public void updateNumberByCustomerIdAndItemId(@Param("customerId")int customerId,@Param("itemId") int itemId, @Param("number")int number);
	
	public List<Cart> getCartsByCustomerId(int customerId);
	
}
