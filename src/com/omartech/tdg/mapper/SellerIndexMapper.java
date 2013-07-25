package com.omartech.tdg.mapper;

import com.omartech.tdg.model.SellerIndex;

public interface SellerIndexMapper {
	
	public SellerIndex getSellerIndex();
	
	public void insertSellerIndex(SellerIndex sellerIndex);
	
	public void updateSellerIndex(SellerIndex sellerIndex);
	
	public void updatePicturePath(String picturePath);
	
	public void updateTextContent(String textContent);
	
	public String getPicturePath();
	
	public String getTextContent();
}
