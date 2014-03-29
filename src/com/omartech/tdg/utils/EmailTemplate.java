package com.omartech.tdg.utils;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.PasswordKey;
import com.omartech.tdg.model.Seller;

public class EmailTemplate {

	public static final String whenAfterTranslationToSell(){
		return wapperForSeller("Congratulations that translation work on some of your products have been completed, you can click 'Start to sell' button to start sell on marketplace now");
	}
	
	public static final String createAccountStatusChanged(){
		return "Admin change your account status";
	}
	
	public static final String createCustomerSuccessRegister(Customer customer){
		return "Congratulations, you have successfully registered at our marketplace";
	}
	
	public static final String createSellerForgetPassword(PasswordKey passwordKey){
		StringBuilder sb = new StringBuilder();
		sb.append("Verify code is "+ passwordKey.getSecret());
		sb.append("\n");
		sb.append("Click this url to change password, "+SystemDefaultSettings.systemURL+"/verifysellerpasswordkey?email="+ passwordKey.getEmail());
		return wapperForSeller(sb.toString());
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
	
	public static final String unsafeProductStock(int productId){
		StringBuilder sb = new StringBuilder();
		sb.append("stock warning letter:");
		sb.append("\n");
		sb.append("Alert: Please note your inventory of the product(ID:"+productId+") has been lower than the safety stock point.");
		return wapperForSeller(sb.toString());
	}
	
	public static final String outOfStock(int productId){
		StringBuilder sb = new StringBuilder();
		sb.append("stock warning letter:");
		sb.append("\n");
		sb.append("Alert: Please note your inventory of the product(ID:"+productId+") has been out of stock.");
		return wapperForSeller(sb.toString());
	}
	
	public static final String claimLettertoCustomer(int claimId, int status){
		StringBuilder sb = new StringBuilder();
		sb.append("Dear Customer,");
		sb.append("\n");
		if(status == ClaimRelation.ongoing)
			sb.append("您的投诉已收到,您的该笔投诉编码是:"+claimId+" , 我们 将在 2 个工作日内为您处理,若有任何举证资料,请以邮件方式发到客服邮箱");
		else if(status == ClaimRelation.discard)
			sb.append("您的投诉已经撤销");
		else
			sb.append("您的投诉已经处理完毕");
		return sb.toString();
	}
	public static final String returnLettertoCustomer(int claimId, int status){
		StringBuilder sb = new StringBuilder();
		sb.append("Return notice letter:");
		sb.append("\n");
		if(status == ClaimRelation.ongoing)
			sb.append("您的退货申请已收到,您的该申请编码是:"+claimId+" , 我们 将在 2 个工作日内为您处理");
		else if(status == ClaimRelation.discard)
			sb.append("您的退货已经撤销");
		else
			sb.append("您的退货已经处理完毕");
		return sb.toString();
	}
	public static final String claimLetterToSeller(int claimId, int status){
		StringBuilder sb = new StringBuilder();
		if(status == ClaimRelation.ongoing){
			sb.append("Buyer filed a claim to you, please check it and fix it as soon as possible to avoid un-necessary losses. If you have any problem, please contact seller support!");
			sb.append("claim id : "+claimId);
		}
		else if(status == ClaimRelation.discard)
			sb.append("the claim has been cancelled");
		else
			sb.append("the claim is over.");
		return wapperForSeller(sb.toString());
	}
	public static final String returnLetterToSeller(int claimId, int status){
		StringBuilder sb = new StringBuilder();
		if(status == ClaimRelation.ongoing){
			sb.append("Please note that you just received a product return request.");
			sb.append("\n");
			sb.append("Product Return ID : "+claimId);
		}
		else if(status == ClaimRelation.discard)
			sb.append("the return apply has been cancelled");
		else
			sb.append("the return is over.");
		return wapperForSeller(sb.toString());
	}
	
	public static final String makeDealToCustomer(){
		return "您的订单已收到，我们会尽快发货。";
	}
	
	public static final String makeDealToSeller(){
		return "Congratulations! You have a new order, Order ID : ";
	}
	
	public static final String carrierInformationChanged(int id){
		return "The shipping information has changed, please check. The orderId is :"+ id;
	}
	public static final String orderCancelledBySeller(int id){
		return "请注意，您的订单由于某种原因被商户取消了，请及时修改您的订单, 订单号："+ id;
	}
	
	public static final String sellerReturnMoneyBack(int orderId){
		return "订单号为："+orderId+" 的钱已经被退回。";
	}
	
	
	private static String wapperForSeller(String content){
		StringBuilder sb = new StringBuilder();
		sb.append("Dear Seller,");
		sb.append("\n");
		sb.append("\n");
		sb.append(content);
		sb.append("\n");
		sb.append("\n");
		sb.append("Best,");
		sb.append("\n");
		sb.append("China World Town");
		sb.append("\n");
		sb.append("(Please don't reply this email)");
		return sb.toString();
	}
}
