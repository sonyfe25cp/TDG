package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;

public interface SellerMapper {
	
	Seller getSellerByEmail(String email);
	
	Seller getSellerByEmailAndPassword(String email,String password);

	void insertSeller(Seller seller);
	
	void updateSeller(Seller seller);
	
	public List<Seller> getSellerListByPage(Page page);
	
	public void active(int id);
	
	public void disActive(int id);
	
	public Seller getSellerById(int id);
}
