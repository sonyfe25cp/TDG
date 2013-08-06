package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;

public interface CustomerMapper {
	
	Customer getCustomerByEmail(String mail);
	
	Customer getCustomerByEmailAndPassword(String email, String password);
	
	Customer getCustomerById(int id);
	
	void insertCustomer(Customer customer);
	
	void updateCustomer(Customer customer);
	
	public List<Customer> getCustomerListByPage(Page page);
	
	public void active(int id);
	
	public void disActive(int id);
}
