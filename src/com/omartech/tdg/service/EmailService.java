package com.omartech.tdg.service;

import org.springframework.stereotype.Service;

import com.omartech.tdg.model.PasswordKey;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.utils.EmailSender;
import com.omartech.tdg.utils.EmailTemplate;
@Service
public class EmailService {

	private EmailSender sender = new EmailSender();
	
	public void sendEmailWhenSellerRegisterSuccess(Seller seller){
		sender.sendEmail(seller.getEmail(), "Register success", EmailTemplate.createSellerSuccessRegister(seller));
	}
	
	public void sendEmailWhenSellerForgetPassword(String email, PasswordKey key){
		sender.sendEmail(email, "Pass word Assistance", EmailTemplate.createSellerForgetPassword(key));
	}

}
