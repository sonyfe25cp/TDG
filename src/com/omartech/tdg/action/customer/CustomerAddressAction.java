package com.omartech.tdg.action.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.CustomerAddress;

@Controller
@RequestMapping("/address")
public class CustomerAddressAction {
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<CustomerAddress> listAddress(
			HttpSession session
			){
		Customer customer = (Customer) session.getAttribute("customer");
		int customerId = customer.getId();
		List<CustomerAddress> addresses = customerAddressMapper.getCustomerAddressByCustomerId(customerId);
		
		return addresses;
	}
	@RequestMapping("/add")
	@ResponseBody
	public String addAddress(
			@RequestParam String name,
			@RequestParam String address,
			@RequestParam String city,
			@RequestParam String country,
			@RequestParam String postCode,
			HttpSession session
			){
		Customer customer = (Customer) session.getAttribute("customer");
		int customerId = customer.getId();
		CustomerAddress customerAddress = new CustomerAddress();
		customerAddress.setAddress(address);
		customerAddress.setCity(city);
		customerAddress.setCountry(country);
		customerAddress.setName(name);
		customerAddress.setPostCode(postCode);
		customerAddress.setCustomerId(customerId);
		customerAddressMapper.insertCustomerAddress(customerAddress);
		return "success";
	}
	@RequestMapping("/update")
	@ResponseBody
	public String updateAddress(
			@RequestParam int id,
			@RequestParam String name,
			@RequestParam String address,
			@RequestParam String city,
			@RequestParam String country,
			@RequestParam String postCode,
			HttpSession session
			){
		CustomerAddress customerAddress = customerAddressMapper.getCustomerAddressById(id);
		customerAddress.setAddress(address);
		customerAddress.setCity(city);
		customerAddress.setCountry(country);
		customerAddress.setName(name);
		customerAddress.setPostCode(postCode);
		customerAddressMapper.insertCustomerAddress(customerAddress);
		return "success";
	}
	

	public CustomerAddressMapper getCustomerAddressMapper() {
		return customerAddressMapper;
	}
	public void setCustomerAddressMapper(CustomerAddressMapper customerAddressMapper) {
		this.customerAddressMapper = customerAddressMapper;
	}
}
