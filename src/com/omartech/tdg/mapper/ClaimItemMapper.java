package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Page;

public interface ClaimItemMapper {

	public int insert(ClaimItem claimItem);
	
	public ClaimItem getClaimItemById(int id);
	
	public ClaimItem getClaimItemByClaimTypeId(@Param("claimType") String claimObject, @Param("claimItemId") int claimItemId);
	
	public List<ClaimItem> getClaimItemsByPage(Page page);

	public void update(ClaimItem claimItem);
	
	public List<ClaimItem> getClaimItemsBySellerIdAndStatus(@Param("sellerId")int sellerId, @Param("status")int status);
	
	public List<ClaimItem> getClaimItemsBySellerIdByPage(@Param("sellerId")int sellerId, @Param("page")Page page);
}
