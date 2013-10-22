package com.omartech.tdg.service.seller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SellerMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.utils.AccountStatus;
import com.omartech.tdg.utils.ProductStatus;
@Service
public class SellerAuthService {
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private ProductService productService;
	
	public Seller getSellerById(int id){
		return sellerMapper.getSellerById(id);
	}
	
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
		seller.setCreatedAt(new Date());
		sellerMapper.insertSeller(seller);
	}
	
	public void updateSeller(Seller seller){
		sellerMapper.updateSeller(seller);
	}
	
	public List<Seller> getSellerListByPage(Page page){
		return sellerMapper.getSellerListByPage(page);
	}
	
	public void changeAccountStatus(int id, int accountStatus){
		Seller seller = sellerMapper.getSellerById(id);
		seller.setAccountStatus(accountStatus);
		sellerMapper.updateSeller(seller);
		if(accountStatus == AccountStatus.SUSPEND){//冻结账号，停售所有产品
			productService.changeProductsOfSeller(id, ProductStatus.Unsellable);
		}else if(accountStatus == AccountStatus.OK){
			productService.changeProductsOfSeller(id, ProductStatus.Sellable);
		}
	}
	
	public SellerMapper getSellerMapper() {
		return sellerMapper;
	}

	public void setSellerMapper(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
	}

	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
