package com.omartech.tdg.utils;

import java.util.Date;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderRecord;

public class OrderRecordFactory {
	
	public static OrderRecord createByStatus(Order order, int status){
		int orderId = order.getId();
		OrderRecord record = new OrderRecord();
		record.setOrderId(orderId);
		record.setCreateAt(new Date(System.currentTimeMillis()));
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
			record.setComment("该订单发生错误");
			record.setCommentInEnglish("Something wrong to this order, such as out of stock , wrong address ");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.AUTO:
			record.setComment("系统自动留货，等待用户确认");
			record.setCommentInEnglish("System submit the order, waiting for confirm");
			record.setUsername("Server");
			record.setUserId(0);
			break;
		case OrderStatus.COMPLAIN:
			record.setComment("用户投诉该订单");
			record.setCommentInEnglish("Customer complain this order");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		case OrderStatus.CANCEL:
			record.setComment("用户取消该订单");
			record.setCommentInEnglish("Customer canceled this order");
			record.setUsername(order.getName());
			record.setUserId(order.getCustomerId());
			break;
		default:
			break;
		}
		return record;
	}

}
