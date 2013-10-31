package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.ClaimItemMapper;
import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.ClaimRelation;

@Service
public class ClaimService {
	
	@Autowired
	private ClaimItemMapper claimMapper;
	
	@Autowired
	private SellerAuthService sellerService;
	
	@Autowired
	private CustomerAuthService customerAuthService;
	
	@Autowired
	private EmailService emailService;
	
	public List<ClaimItem> getClaimItemsBySellerId(int sellerId, Page page){
		return claimMapper.getClaimItemsBySellerIdByPage(sellerId, page);
	}
	public List<ClaimItem> getClaimItemsBySellerIdAndStatus(int sellerId, int status){
		return claimMapper.getClaimItemsBySellerIdAndStatus(sellerId, status);
	}
	
	public int insert(ClaimItem claimItem){
		ClaimItem old = getClaimItemByOrderId(claimItem.getClaimItemId());
		if(old != null){
			return old.getId();
		}
		int sellerId = claimItem.getSellerId();
		int customerId = claimItem.getCustomerId();
		Seller seller = sellerService.getSellerById(sellerId);
		Customer customer = customerAuthService.getCustomerById(customerId);
		String customerEmail = customer.getEmail();
		String sellerEmail = seller.getEmail();
		int orderId = claimItem.getClaimItemId();
		int status = ClaimRelation.complain;
		claimMapper.insert(claimItem);
		int claimId = claimItem.getId();
		emailService.sendEmailWhenCustomerClaimOrder(customerEmail, sellerEmail, orderId, claimId, status);
		return claimId;
	}
	
	public ClaimItem getClaimItemById(int id){
		ClaimItem ci =  claimMapper.getClaimItemById(id);
		int sellerId = ci.getSellerId();
		int customerId = ci.getCustomerId();
		Seller seller = sellerService.getSellerById(sellerId);
		Customer customer = customerAuthService.getCustomerById(customerId);
		ci.setSeller(seller);
		ci.setCustomer(customer);
		return ci;
	}
	
	public ClaimItem getClaimItemByOrderId(int id){
		return claimMapper.getClaimItemByClaimTypeId(ClaimRelation.Order, id);
	}
	
	public void updateStatus(int claimId, int status){
		ClaimItem claimItem = getClaimItemById(claimId);
		claimItem.setStatus(status);
		update(claimItem);
		
		switch(status){
		case ClaimRelation.complain:
			break;
		case ClaimRelation.uncomplain:
			break;
		case ClaimRelation.ok:
			break;
		}
	}
	public List<ClaimItem> getClaimItemsByPage(Page page){
		return claimMapper.getClaimItemsByPage(page);
	}

	public void update(ClaimItem claimItem){
		claimMapper.update(claimItem);
	}

}
