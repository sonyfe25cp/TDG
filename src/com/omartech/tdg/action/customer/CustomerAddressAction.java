package com.omartech.tdg.action.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.mapper.CountryMapper;
import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.CustomerAddress;

@Controller
@RequestMapping("/address")
public class CustomerAddressAction {
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	@Autowired
	private CountryMapper countryMapper;
	
	@RequestMapping("/{id}/show")
	@ResponseBody
	public CustomerAddress showAddres(@PathVariable int id){
		CustomerAddress address = customerAddressMapper.getCustomerAddressById(id);
		return address;
	}
	@ResponseBody
	@RequestMapping("/{id}/delete")
	public void deleteAddres(@PathVariable int id){
		customerAddressMapper.deleteCustomerAddress(id);
	}
	
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
	public CustomerAddress addAddress(
			@RequestParam String name,
			@RequestParam String address,
			@RequestParam String city,
			@RequestParam int countryCode,
			@RequestParam String postCode,
			HttpSession session
			){
		Customer customer = (Customer) session.getAttribute("customer");
		int customerId = customer.getId();
		Country country = countryMapper.getCountryById(countryCode);
		
		CustomerAddress customerAddress = new CustomerAddress( name,  address,  city,
				country.getName(),  countryCode,  postCode,  customerId);
		
		customerAddressMapper.insertCustomerAddress(customerAddress);
		return customerAddress;
	}
	@RequestMapping("/{id}/update")
	@ResponseBody
	public String updateAddress(
			@PathVariable int id,
			@RequestParam String name,
			@RequestParam String address,
			@RequestParam String city,
			@RequestParam int countryCode,
			@RequestParam String postCode,
			HttpSession session
			){
		CustomerAddress customerAddress = customerAddressMapper.getCustomerAddressById(id);
		Country country = countryMapper.getCountryById(countryCode);
		
		customerAddress.setAddress(address);
		customerAddress.setCity(city);
		customerAddress.setCountry(country.getName());
		customerAddress.setCountryCode(countryCode);
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
