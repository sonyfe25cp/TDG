package com.omartech.tdg.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;

@Service
public class CustomerAuthService {

	@Autowired
	private CustomerMapper customerMapper;
	
	public boolean isEmailExist(String email){
		Customer customer = customerMapper.getCustomerByEmail(email);
		if(customer == null){
			return false;
		}else{
			return true;
		}
		
	}
	@Transactional
	public void add(Customer customer){
		customerMapper.insertCustomer(customer);
	}
	@Transactional
	public void updatePassword(Customer customer){
		customerMapper.updateCustomer(customer);
	}
	
	public Customer isLegalUser(String email, String password){
		Customer customer = customerMapper.getCustomerByEmailAndPassword(email,password);
		if(customer == null){
			return null;
		}else{
			return customer;
		}
	}
	
	public List<Customer> getCustomerListByPage(Page page){
		return customerMapper.getCustomerListByPage(page);
	}
	
	public void active(int id){
		customerMapper.active(id);
	}
	public void disActive(int id){
		customerMapper.disActive(id);
	}
	
	public CustomerMapper getCustomerMapper() {
		return customerMapper;
	}
	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}
	
}
