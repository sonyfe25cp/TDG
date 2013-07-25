package com.omartech.tdg.model;

public class SellerIndex {
	private int id = 0;
	private String picturePath;
	private String textContent;
	private int isChinese = 1;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	public int getIsChinese() {
		return isChinese;
	}
	public void setIsChinese(int isChinese) {
		this.isChinese = isChinese;
	}

}
