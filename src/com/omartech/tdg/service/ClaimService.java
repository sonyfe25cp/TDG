package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.ClaimItemMapper;
import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.ClaimRelation;
import com.omartech.tdg.utils.OrderRecordFactory;
import com.omartech.tdg.utils.OrderStatus;

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
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private FinanceService financeService;
	
	@Autowired
	private OrderRecordService orderRecordService;
	
	public List<ClaimItem> getClaimItemsBySellerId(int sellerId, Page page){
		return claimMapper.getClaimItemsBySellerIdByPage(sellerId, page);
	}
	public List<ClaimItem> getClaimItemsBySellerIdAndStatus(int sellerId, int status){
		return claimMapper.getClaimItemsBySellerIdAndStatus(sellerId, status);
	}
	/**
	 * 插入一条投诉
	 * @param claimItem
	 * @return
	 */
	public int insert(ClaimItem claimItem){
		ClaimItem old = getClaimItemByClaimTypeAndItemId(claimItem.getClaimType(), claimItem.getClaimItemId());
		if(old != null){
			if(old.getStatus() != ClaimRelation.ongoing){
				old.setStatus(ClaimRelation.ongoing);
				old.setComment(claimItem.getComment());
				old.setFlag(0);
				update(old);
			}
			return old.getId();
		}
		int sellerId = claimItem.getSellerId();
		int customerId = claimItem.getCustomerId();
		Seller seller = sellerService.getSellerById(sellerId);
		Customer customer = customerAuthService.getCustomerById(customerId);
		String customerEmail = customer.getEmail();
		String sellerEmail = seller.getEmail();
		int orderId = claimItem.getClaimItemId();
		int status = claimItem.getStatus();
		
		claimMapper.insert(claimItem);
		int claimId = claimItem.getId();
		emailService.sendEmailWhenCustomerClaimOrder(customerEmail, sellerEmail, orderId, claimItem.getClaimType(), claimId, status);
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
	
	public ClaimItem getClaimItemByClaimTypeAndItemId(String claimType, int id){
		return claimMapper.getClaimItemByClaimTypeAndItemId(claimType, id);
	}
	/**
	 * 变更投诉状态
	 * @param claimId
	 * @param status
	 */
	public void updateStatus(int claimId, int status){
		ClaimItem claimItem = getClaimItemById(claimId);
		claimItem.setStatus(status);
		update(claimItem);
	}
	/**
	 * 一定是投诉结束状态
	 * @param claimId
	 * @param status
	 * @param percent
	 */
	public void closeClaimWithMoneyByAdmin(int claimId, int percent){
		ClaimItem claimItem = getClaimItemById(claimId);
		
		/**
		 * 插入该退回的
		 */
		int orderId = claimItem.getClaimItemId();
		if(orderId != 0 && percent!=0){
			orderService.returnMoneyToUserByAdmin(orderId, claimId, percent);
		}
		//关闭claim
		orderService.closeClaim(claimItem);
		//插入记录
		Order order = orderService.getOrderById(orderId);
		OrderRecord	record = OrderRecordFactory.createByStatus(order, OrderStatus.CLOSE);
		orderRecordService.insertOrderRecord(record);
	}
	
	/**
	 * 将claim改为由管理员介入
	 * @param claimId
	 */
	public void updateFlag(int claimId){
		ClaimItem claimItem = getClaimItemById(claimId);
		claimItem.setFlag(1);
		update(claimItem);
	}
	public List<ClaimItem> getClaimItemsByClaimTypeByPage(String claimType, Page page){
		return claimMapper.getClaimItemsByClaimTypeByPage(claimType, page);
	}

	public void update(ClaimItem claimItem){
		claimMapper.update(claimItem);
	}

}
