package com.omartech.tdg.utils;

import com.omartech.tdg.model.PasswordKey;
import com.omartech.tdg.model.Seller;

public class EmailTemplate {

	public static final String createSellerForgetPassword(PasswordKey passwordKey){
		StringBuilder sb = new StringBuilder();
		sb.append("Verify code is "+ passwordKey.getSecret());
		sb.append("\n");
		sb.append("Click this url to change password, "+SystemDefaultSettings.systemURL+"/verifysellerpasswordkey?email="+ passwordKey.getEmail());
		return sb.toString();
	}
	
	public static final String createSellerSuccessRegister(Seller seller){
		StringBuilder sb = new StringBuilder();
		sb.append("Welcome Letter");
		sb.append("\n");
		sb.append("Dear Customer,");
		sb.append("\n");
		sb.append("Welcome to register account at "+ SystemDefaultSettings.sytstemName);
		sb.append("\n");
		sb.append("Your account information is as below: ");
		sb.append("\n");
		sb.append("Account login email: "+seller.getEmail());
		sb.append("\n");
		sb.append("Password:"+seller.getPassword());
		sb.append("\n");
		sb.append("Your Merchant Id:"+seller.getId());
		sb.append("\n");
		return sb.toString();
	}
}
