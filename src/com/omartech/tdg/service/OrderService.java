package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.exception.OrderItemsException;
import com.omartech.tdg.mapper.OrderMapper;
import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.TransferFeeCounter;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	public Order getOrderById(int id){
		Order order = orderMapper.getOrderById(id);
		return order;
	}
	
	public void updateOrderBySeller(Order order){
		orderMapper.updateOrder(order);
	}
	
	public void updateOrderStatus(int status, int orderId){
		Order order = getOrderById(orderId);
		order.setOrderStatus(status);
		orderMapper.updateOrder(order);
	}
	
	public int insertOrder(Order order){
		boolean needSplit = checkNeedSplit(order);
		int orderId = orderMapper.insertOrder(order);
		if(needSplit){
			List<Order> orders = splitOrder(order,orderId);
			for(Order subOrder : orders){
				orderMapper.insertOrder(subOrder);
			}
			order.setOrderStatus(OrderStatus.CUT);
		}
		return orderId;
	}
	
	private boolean checkNeedSplit(Order order) throws OrderItemsException{
		List<OrderItem> orderItems = order.getOrderItems();
		if(orderItems!=null){
			int sellerId = orderItems.get(0).getSellerId();
			for(OrderItem item : orderItems){
				int tmpId = item.getSellerId();
				if(tmpId != sellerId){
					return true;
				}
			}
			return false;
		}else{
			throw new OrderItemsException(order);
		}
	}
	
	private List<Order> splitOrder(Order order, int orderId){
		List<OrderItem> orderItems = order.getOrderItems();
		Map<Integer, List<OrderItem>> sellerMap = new HashMap<Integer, List<OrderItem>>();
		
		for(OrderItem item : orderItems){
			int tmpId = item.getSellerId();
			List<OrderItem> orderItemsTmp = null;
			if(sellerMap.containsKey(tmpId)){
				orderItemsTmp = sellerMap.get(tmpId);
			}else{
				orderItemsTmp = new ArrayList<OrderItem>();
			}
			orderItemsTmp.add(item);
			sellerMap.put(tmpId, orderItemsTmp);
		}
		List<Order> orders = new ArrayList<Order>();
		for(Entry<Integer, List<OrderItem>> entry :  sellerMap.entrySet()){
			List<OrderItem> subOrderItems = entry.getValue();
			int sellerId = entry.getKey();
			
			Order subOrder = new Order();
			subOrder.setAddress(order.getAddress());
			subOrder.setCity(order.getCity());
			subOrder.setCountry(order.getCountry());
			subOrder.setPostCode(order.getPostCode());
			subOrder.setCustomerId(order.getCustomerId());
			subOrder.setName(order.getName());
			subOrder.setOrderItems(subOrderItems);
			float orderPrice = countPrice(subOrderItems);
			float transferFee = TransferFeeCounter.compute(subOrder);
			float price = orderPrice + transferFee;
			subOrder.setOrderPrice(orderPrice);
			subOrder.setPrice(price);
			subOrder.setSellerId(sellerId);
			subOrder.setTransferPrice(transferFee);
			subOrder.setOrderStatus(OrderStatus.NOPAY);
			subOrder.setParentId(orderId);
			
			orders.add(subOrder);
		}
		return orders;
	}
	
	private float countPrice(List<OrderItem> orderItems){
		float price = 0f;
		for(OrderItem orderItem : orderItems){
			int coinage = orderItem.getCoinage();
			float origin = orderItem.getPrice();
			float rmb = 0.0f;
			switch (coinage) {
			case Coinage.Dollar:
				rmb = Coinage.DollarToRMB(origin);
				break;
			case Coinage.Pound:
				rmb = Coinage.PoundToRMB(origin);
				break;
			case Coinage.EURO:
				rmb = Coinage.EuroToRMB(origin);
				break;
			case Coinage.JPY:
				rmb = Coinage.JPYtoRMB(origin);
			default:
				rmb = origin;
			}
			price += rmb;
		}
		return price;
	}

}
