package com.omartech.tdg.service.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SellerMapper;
import com.omartech.tdg.model.Page;
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
	
	public void updateSeller(Seller seller){
		sellerMapper.updateSeller(seller);
	}
	
	public List<Seller> getSellerListByPage(Page page){
		return sellerMapper.getSellerListByPage(page);
	}
	
	public void active(int id){
		sellerMapper.active(id);
	}
	public void disActive(int id){
		sellerMapper.disActive(id);
	}
	public SellerMapper getSellerMapper() {
		return sellerMapper;
	}

	public void setSellerMapper(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
	}
}
