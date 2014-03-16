package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.PasswordKey;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.customer.CustomerAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.ClaimRelation;
import com.omartech.tdg.utils.EmailSender;
import com.omartech.tdg.utils.EmailTemplate;
@Service
public class EmailService {

	private EmailSender sender = new EmailSender();
	@Autowired
	private CustomerAuthService customerAuthService;
	@Autowired
	private SellerAuthService sellerAuthService;
	
	/**
	 * 商户收到产品翻译完成可以销售的情况
	 * @param email
	 */
	public void sendEmailWhenReadyToSell(String email){
		sender.sendEmail(email, "Ready to sell", EmailTemplate.whenAfterTranslationToSell());
	}
	/**
	 * 商户， 买家收到管理员对其账户进行关闭等状态的改变
	 * @param email
	 */
	public void sendEmailWhenAdminChangeAccountStatus(String email){
		sender.sendEmail(email, "Account status changed", EmailTemplate.createAccountStatusChanged());
	}
	/**
	 * 买家注册成功
	 * @param customer
	 */
	public void sendEmailWhenCustomerRegister(Customer customer){
		sender.sendEmail(customer.getEmail(), "Register success", EmailTemplate.createCustomerSuccessRegister(customer));
	}
	/**
	 * 卖家注册成功
	 * @param seller
	 */
	public void sendEmailWhenSellerRegisterSuccess(Seller seller){
		sender.sendEmail(seller.getEmail(), "Register success", EmailTemplate.createSellerSuccessRegister(seller));
	}
	
	public void sendEmailWhenSuccessedModifyPersonalInformation(String email){
		sender.sendEmail(email, "Modify success", "You have successfully modified your information");
	}
	
	public void sendEmailWhenSellerForgetPassword(String email, PasswordKey key){
		sender.sendEmail(email, "Pass word Assistance", EmailTemplate.createSellerForgetPassword(key));
	}

	public void sendEmailWhenCustomerClaimOrder(String customerEmail, String sellerEmail,  int orderId, String claimType, int claimId, int status){
		if(claimType.equals(ClaimRelation.Claim)){
			sender.sendEmail(customerEmail, "Claim Order Notice From China World Town", EmailTemplate.claimLettertoCustomer(claimId, status));
			sender.sendEmail(sellerEmail, "Claim Order Notice From China World Town", EmailTemplate.claimLetterToSeller(claimId, status));
		}else if(claimType.equals(ClaimRelation.Return)){
			sender.sendEmail(customerEmail, "Buyer Return Order Notice From China World Town", EmailTemplate.returnLettertoCustomer(claimId, status));
			sender.sendEmail(sellerEmail, "Buyer Return Order Notice From China World Town", EmailTemplate.returnLetterToSeller(claimId, status));
		}
	}
	
	//下单成功
	public void sendEmailWhenMakeOrderOk(Order order){
		
		int sellerId = order.getSellerId();
		if(sellerId != 0){
			int customerId = order.getCustomerId();
			Customer customer = customerAuthService.getCustomerById(customerId);
			Seller seller = sellerAuthService.getSellerById(sellerId);
			
			String customerEmail = customer.getEmail();
			String sellerEmail = seller.getEmail();
			
			sender.sendEmail(customerEmail, "order received From China World Town", EmailTemplate.makeDealToCustomer());
			sender.sendEmail(sellerEmail, "order received From China World Town", EmailTemplate.makeDealToSeller() + order.getId());
		}
	}
	/**
	 * 卖家更新发货信息
	 * @param order
	 */
	public void sendEmailWhenSellerUpdateCarrierInformation(Order order){
		int customerId = order.getCustomerId();
		Customer customer = customerAuthService.getCustomerById(customerId);
		String customerEmail = customer.getEmail();
		sender.sendEmail(customerEmail, "Order shipping information changed", EmailTemplate.carrierInformationChanged(order.getId()));
	}
	/**
	 * 库存低于系统安全库存，被系统叫停
	 */
	public void sendEmailWhenNearlyOutofStock(int sellerId, int productId){
		Seller seller = sellerAuthService.getSellerById(sellerId);
		String sellerEmail = seller.getEmail();
		sender.sendEmail(sellerEmail,"Product stock warning", EmailTemplate.unsafeProductStock(productId));
	}
	/**
	 * 低于卖家自己设定的安全库存
	 * @param productId
	 * @param seller
	 */
	public void sendEmailWhenProductWillSoldOut(int productId, Seller seller){
		sender.sendEmail(seller.getEmail(), "Product stock warning", EmailTemplate.unsafeProductStock(productId));
	}
	/**
	 * 卖家取消订单
	 */
	public void sendEmailWhenSellerCancelOrder(Order order){
		int customerId = order.getCustomerId();
		Customer customer = customerAuthService.getCustomerById(customerId);
		String customerEmail = customer.getEmail();
		sender.sendEmail(customerEmail, "Order cancelled by seller", EmailTemplate.orderCancelledBySeller(order.getId()));
	}
	
	public void sendEmailWhenSellerSendPackage(Order order){
		int customerId = order.getCustomerId();
		Customer customer = customerAuthService.getCustomerById(customerId);
		String customerEmail = customer.getEmail();
		sender.sendEmail(customerEmail, "卖家已发货", "请注意，刚刚您购买的订单: "+ order.getId() +", 卖家已提供发货信息，您现在可根据发货信息查询物流状态了");
	}
	
	/**
	 * 卖家退钱
	 */
	public void sendEmailWhenSellerReturnMoney(Order order){
		int customerId = order.getCustomerId();
		int sellerId = order.getSellerId();
		Customer customer = customerAuthService.getCustomerById(customerId);
		Seller seller = sellerAuthService.getSellerById(sellerId);
		
		String customerEmail = customer.getEmail();
		String sellerEmail = seller.getEmail();
		sender.sendEmail(customerEmail, "Money back", EmailTemplate.sellerReturnMoneyBack(order.getId()));
	}
}
