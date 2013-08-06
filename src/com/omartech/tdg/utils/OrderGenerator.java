package com.omartech.tdg.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.model.CustomerAddress;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.OrderService;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Trade;
import com.taobao.api.request.TradesSoldGetRequest;
import com.taobao.api.response.TradesSoldGetResponse;

public class OrderGenerator {
	private String sessionKey = "62027013bdffe81f0ca42e27aba53db18cd3e75fc984f851583847481";
	@Autowired
	private ItemService itemService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	
	
	public CustomerAddressMapper getCustomerAddressMapper() {
		return customerAddressMapper;
	}

	public void setCustomerAddressMapper(CustomerAddressMapper customerAddressMapper) {
		this.customerAddressMapper = customerAddressMapper;
	}

	
	public void generateOrder(long startTime, int customerId){
		TaobaoClient client=new DefaultTaobaoClient(TaobaoSettings.requestUrl, TaobaoSettings.appKey, TaobaoSettings.appSecret);
		TradesSoldGetRequest req=new TradesSoldGetRequest();
		String fields="orders.outer_iid,orders.num";
		req.setFields(fields);
		Date dateTime=null;
		String time=timeFormat(startTime);
		try {
			dateTime = SimpleDateFormat.getDateTimeInstance().parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.setStartCreated(dateTime);
		req.setStatus("TRADE_FINISHED");
		TradesSoldGetResponse response=null;
		try {
			response= client.execute(req , sessionKey);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Trade> trades = new ArrayList<Trade>();
		trades=response.getTrades();
		if(trades==null||trades.size()==0){
			System.out.println("暂无交易！");
			return;
		}
		
		List<Order> orders = new ArrayList<Order>();
		for(Trade trade: trades)
		{
			//order是指本系统(tdg)中的order，对应淘宝系统中的trade
			Order order = new Order();
			//tbOrders是淘宝系统中的order，对应本系统中的orderItem
			List<com.taobao.api.domain.Order> tbOrders = new ArrayList<com.taobao.api.domain.Order>();
			List<OrderItem> orderItems = new ArrayList<OrderItem>();
			tbOrders = trade.getOrders();
			for(com.taobao.api.domain.Order tbOrder: tbOrders)
			{
				//先人工添加outerid，到时候删掉即可
				tbOrder.setOuterIid("1004");
				int sku =  Integer.parseInt(tbOrder.getOuterIid());
				int num = tbOrder.getNum().intValue();
				OrderItem orderItem = new OrderItem();
				Item item = itemService.getItemBySku(sku);
				orderItem.setItemId(item.getId());
				orderItem.setSkuId(sku);
				orderItem.setProductId(item.getProductId());
				orderItem.setName(item.getName());
				orderItem.setCoinage(item.getCoinage());
				orderItem.setSellerId(item.getSellerId());
				orderItem.setNum(num);
				//orderItem.setPrice(orderService.countOrderItemPrice(orderItem));
				orderItems.add(orderItem);
			}
			order.setOrderItems(orderItems);
			order.setCreateAt(new Date());
//			order.setName(name);
//			order.setAddress(address);
//			order.setCity(city);
//			order.setPostCode(postCode);
			List<CustomerAddress> addressList = customerAddressMapper.getCustomerAddressByCustomerId(customerId);
			if(addressList!=null)
			{
				CustomerAddress address = addressList.get(0);
				order.setAddress(address.getAddress());
				order.setCity(address.getCity());
				order.setCountry(address.getCountry());
				order.setPostCode(address.getPostCode());
			}
			orders.add(order);
		}//for trades
		for(Order order : orders){
			System.out.println(order.getName());
			List<OrderItem> orderItems = order.getOrderItems();
			for(OrderItem orderItem : orderItems){
				System.out.println("sku: " +orderItem.getSkuId() + "name: " + orderItem.getName() + "num: " + orderItem.getNum());
			}
		}
	}
	
	public String timeFormat(long startTime){
		Date date=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long currentTime=date.getTime();
		System.out.println("currentTime:"+currentTime+"  format:"+dateFormat.format(date));
		long time=currentTime-startTime*60*1000;
		System.out.println(dateFormat.format(time));
		return dateFormat.format(time);
		
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public static void main(String[] args){
		OrderGenerator og = new OrderGenerator();
		og.generateOrder(60*24*105, 1);
	}
	
}
