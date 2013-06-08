package com.omartech.tdg.service.customer;

import com.omartech.tdg.model.Customer;

public interface ICustomerAuthService {

	public boolean isEmailExist(String email);
	
	public boolean add(Customer customer);
	
	public boolean updatePassword(Customer customer, String password);
	
	public Customer isLegalUser(String email, String password);
}
