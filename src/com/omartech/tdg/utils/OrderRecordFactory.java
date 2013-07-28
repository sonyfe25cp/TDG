package com.omartech.tdg.utils;

import java.util.Date;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderRecord;

public class OrderRecordFactory {
	
	public static OrderRecord createByStatus(Order order, int status){
		long orderId = order.getId();
		OrderRecord record = new OrderRecord();
		record.setOrderId(orderId);
		record.setCreateAt(new Date());
		switch (status) {
		case OrderStatus.NOPAY:
			record.setComment("用户提交订单，等待支付");
			record.setCommentInEnglish("Customer submited the order, waiting for pay money");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.PAID:
			record.setComment("用户已经支付，等待系统确认");
			record.setCommentInEnglish("Customer pay the order, waiting for repsonse");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.SEND:
			record.setComment("卖家已发货，等待用户查收");
			record.setCommentInEnglish("Seller has send, waiting for receive");
			record.setUserId(order.getSellerId());
			record.setUsername(order.getSellerName());
			break;
		case OrderStatus.RECEIVE:
			record.setComment("买家已收货");
			record.setCommentInEnglish("Customer has received");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.CUT:
			record.setComment("订单被切分");
			record.setCommentInEnglish("Order has been splited");
			record.setUsername("Server");
			record.setUserId(0);
			break;
		case OrderStatus.RETURN:
			record.setComment("买家要求退货");
			record.setCommentInEnglish("Customer want to send back");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.ERROR:
			record.setComment("买家投诉该订单");
			record.setCommentInEnglish("Customer want sue the order");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.AUTO:
			record.setComment("系统自动留货，等待用户确认");
			record.setCommentInEnglish("System submit the order, waiting for confirm");
			record.setUsername("Server");
			record.setUserId(0);
			break;
		default:
			break;
		}
		return record;
	}

}
