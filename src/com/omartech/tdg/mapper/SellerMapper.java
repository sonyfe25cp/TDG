package com.omartech.tdg.mapper;

import com.omartech.tdg.model.Seller;

public interface SellerMapper {
	
	Seller getSellerByEmail(String email);
	
	Seller getSellerByEmailAndPassword(String email,String password);

	void insertSeller(Seller seller);
	
	void updateSeller(Seller seller);
	
	
}
