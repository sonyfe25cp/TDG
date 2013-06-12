package com.omartech.tdg.service.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SellerMapper;
import com.omartech.tdg.model.Seller;
@Service
public class SellerAuthService {
	@Autowired
	private SellerMapper sellerMapper;
	
	public Seller getSellerByEmail(String email){
		return sellerMapper.getSellerByEmail(email);
	}

	public Seller getSellerByEmailAndPassword(String email, String password){
		return sellerMapper.getSellerByEmailAndPassword(email, password);
	}
	
	public Seller isLegalSeller(String email, String password){
		return getSellerByEmailAndPassword(email, password);
	}
	
	public void insertSeller(Seller seller){
		sellerMapper.insertSeller(seller);
	}
	

	public SellerMapper getSellerMapper() {
		return sellerMapper;
	}

	public void setSellerMapper(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
	}
}
