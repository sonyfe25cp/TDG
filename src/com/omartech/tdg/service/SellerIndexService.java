package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SellerIndexMapper;
import com.omartech.tdg.model.SellerIndex;

@Service
public class SellerIndexService {
	
	@Autowired
	private SellerIndexMapper sellerIndexMapper;
	
	public SellerIndex getSellerIndex(){
		return sellerIndexMapper.getSellerIndex();
	}
	

	public void insertSellerIndex(SellerIndex sellerIndex){
    	sellerIndexMapper.insertSellerIndex(sellerIndex);
    }
	
	public void updateSellerIndex(SellerIndex sellerIndex){
		sellerIndexMapper.updateSellerIndex(sellerIndex);
	}
	
	public void updatePicturePath(String picturePath){
		SellerIndex sellerIndex = getSellerIndex();
		sellerIndex.setPicturePath(picturePath);
		updateSellerIndex(sellerIndex);
	}
	
	public void updateTextContent(String textContent){
		SellerIndex sellerIndex = getSellerIndex();
		sellerIndex.setTextContent(textContent);
		updateSellerIndex(sellerIndex);
	}
	
	public void addPicturePath(String picturePath){
		SellerIndex sellerIndex = getSellerIndex();
		String oldPicPath = sellerIndex.getPicturePath();
		String newPicPath =oldPicPath + picturePath +";";
		updatePicturePath(newPicPath);
	}
	
	public String[] getPicPath(){
		SellerIndex sellerIndex = getSellerIndex();
		String pic = sellerIndex.getPicturePath();
		if(pic== null)
			return null;
		else
			return pic.split(";");
	}
	
	public String getTextContent(){
		SellerIndex sellerIndex = getSellerIndex();
		String textContent = sellerIndex.getTextContent();
		if(textContent== null){
			textContent = "";
		}
		return textContent;
	}
	
	
	public SellerIndexMapper getSellerIndexMapper() {
			return sellerIndexMapper;
		}

	public void setSellerIndexMapper(SellerIndexMapper sellerIndexMapper) {
			this.sellerIndexMapper = sellerIndexMapper;
		}
	

}
