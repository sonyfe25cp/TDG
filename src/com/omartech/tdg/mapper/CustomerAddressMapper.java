package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.CustomerAddress;
import com.omartech.tdg.model.Page;

public interface CustomerAddressMapper {

	public void insertCustomerAddress(CustomerAddress customerAddress);
	
	public void updateCustomerAddress(CustomerAddress customerAddress);
	
	public void deleteCustomerAddress(int id);
	
	public CustomerAddress getCustomerAddressById(int id);
	
	public List<CustomerAddress> getCustomerAddressByCustomerIdAndPage(@Param("customerId")int customerId, @Param("page")Page page);
	
	public List<CustomerAddress> getCustomerAddressByCustomerId(int customerId);
	
}
