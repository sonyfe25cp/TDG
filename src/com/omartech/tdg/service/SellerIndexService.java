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
		sellerIndexMapper.updatePicturePath(picturePath);
	}
	
	public void updateTextContent(String textContent){
		sellerIndexMapper.updateTextContent(textContent);
	}
	
	public void addPicturePath(String picturePath){
		String oldPicPath = sellerIndexMapper.getPicturePath();
		String newPicPath =oldPicPath + picturePath +";";
		updatePicturePath(newPicPath);
	}
	
	public String[] getPicPath(){
		String pic = sellerIndexMapper.getPicturePath();
		if(pic== null)
			return null;
		else
			return pic.split(";");
	}
	
	public String getTextContent(){
		String textContent = sellerIndexMapper.getTextContent();
		if(textContent== null){
			textContent = "";
		}
		return textContent;
	}

}
