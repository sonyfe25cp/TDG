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
	
	public void sendEmailWhenProductWillSoldOut(int productId, Seller seller){
		sender.sendEmail(seller.getEmail(), "Product stock warning", EmailTemplate.unsafeProductStock(productId));
	}

	public void sendEmailWhenCustomerClaimOrder(String customerEmail, String sellerEmail,  int orderId, int claimId, int status){
		sender.sendEmail(customerEmail, "Claim notice letter ", EmailTemplate.claimLettertoCustomer(claimId, status));
		sender.sendEmail(sellerEmail, "Claim notice letter ", EmailTemplate.claimLetterToSeller(claimId, status));
	}
	
}
