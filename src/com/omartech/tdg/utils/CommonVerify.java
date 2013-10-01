package com.omartech.tdg.utils;

public class CommonVerify {
	public static void verifyImage(String imagePath){
		if(imagePath == null || imagePath.equals("") || imagePath.equals("undefined")){
			imagePath = SystemDefaultSettings.DEFAULTPRODUCTIMAGE;
		}
	}
}
