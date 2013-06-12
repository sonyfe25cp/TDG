package com.omartech.tdg.mapper;

import com.omartech.tdg.model.Customer;

public interface CustomerMapper {
	
	Customer getCustomerByEmail(String mail);
	
	Customer getCustomerByEmailAndPassword(String email, String password);
	
	void insertCustomer(Customer customer);
	
	void updateCustomer(Customer customer);
	
}
