package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Page;

public interface ClaimItemMapper {

	public int insert(ClaimItem claimItem);
	
	public void update(ClaimItem claimItem);
	
	public ClaimItem getClaimItemById(int id);
	
	public ClaimItem getClaimItemByClaimTypeAndItemId(@Param("claimType") String claimType, @Param("claimItemId") int claimItemId);
	
	public List<ClaimItem> getClaimItemsByClaimTypeByPage(@Param("claimType") String claimType, @Param("page")Page page);

	
	
	public List<ClaimItem> getClaimItemsBySellerIdAndStatus(@Param("sellerId")int sellerId, @Param("status")int status);
	
	public List<ClaimItem> getClaimItemsBySellerIdAndClaimTypeByPage(@Param("sellerId")int sellerId, @Param("claimType") String claimType, @Param("page")Page page);
	public List<ClaimItem> getClaimItemsByCustomerIdAndClaimTypeByPage(@Param("customerId")int customerId, @Param("claimType") String claimType, @Param("page")Page page);
}
