package com.omartech.tdg.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.exception.UnauthorizedException;
import com.omartech.tdg.mapper.CustomerAddressMapper;
import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.CustomerAddress;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;
import com.omartech.tdg.model.OrderRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.OrderRecordService;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.OrderStatus;
import com.omartech.tdg.utils.TaobaoSettings;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Trade;
import com.taobao.api.request.TradesSoldGetRequest;
import com.taobao.api.response.TradesSoldGetResponse;

@Controller
public class OrderAction {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderRecordService orderRecordService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CustomerAddressMapper customerAddressMapper;
	@Autowired
	private CustomerMapper customerMapper;
	
	
	@RequestMapping("/{userType}/orders/{status}")
	public ModelAndView getOrdersList(
			@PathVariable String userType,
			@PathVariable String status,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session
			){
		int userId = 0;
		List<Order> orders = null;
		Page page = new Page(pageNo, pageSize);
		if(status == null){
			System.out.println("status == null");
		}
		int statusCode = OrderStatus.statusToInt(status);
		System.out.println("status: " + statusCode);
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
			orders = orderService.getSellerOrdersByStatusAndPage(userId, statusCode, page);
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
			System.out.println("customerid: " +customer.getId());
			orders = orderService.getCustomerOrdersByStatusAndPage(userId, statusCode, page);
		}else{
			orders = orderService.getOrdersByStatusAndPage(statusCode, page);
		}
		
		return new ModelAndView("/"+userType+"/order/order-list")
			.addObject("orders", orders)
			.addObject("pageNo", pageNo)
			.addObject("status", status);
	}
	
	@RequestMapping("/{userType}/order/show/{id}")
	public ModelAndView showOrder(
			@PathVariable String userType,
			@PathVariable long id,
			HttpSession session
			){
		
		Order order = orderService.getOrderById(id);
		int userId = 0;
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
			if(order.getSellerId() != userId){
				throw new UnauthorizedException();
			}
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
			if(order.getCustomerId() != userId){
				throw new UnauthorizedException();
			}
		}else{
			
		}
		
		long orderId = order.getId();
		List<OrderRecord> records = orderRecordService.getOrderRecordsByOrderId(orderId);
		
		return new ModelAndView("/"+userType+"/order/order-show")
			.addObject("order", order)
			.addObject("orderRecords", records);
	}
	
	@RequestMapping("/orders/manage")
	public ModelAndView manageOrder(){
		return new ModelAndView("/customer/order/manageOrder");
	}
	
	
	@RequestMapping("/orders/generate")
	public ModelAndView generateOrders(@RequestParam(value="customerId", required = true) String customerId){
		Customer customer = customerMapper.getCustomerById(Integer.parseInt(customerId));
		String sessionKey = customer.getAccessToken();
		TaobaoClient client=new DefaultTaobaoClient(TaobaoSettings.requestUrl, TaobaoSettings.appKey, TaobaoSettings.appSecret);
		TradesSoldGetRequest req=new TradesSoldGetRequest();
		String fields="orders.outer_iid,orders.num";
		req.setFields(fields);
		Date dateTime=null;
		String time=timeFormat(24*60*105);
		try {
			dateTime = SimpleDateFormat.getDateTimeInstance().parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.setStartCreated(dateTime);
		//此处要改成已付款订单
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
			return new ModelAndView("/customer/order/manageOrder");
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
				orderItem.setPrice(orderService.countOrderItemPrice(orderItem));
				//orderItem.setPrice(item.getRetailPrice());
				orderItems.add(orderItem);
			}
			order.setOrderItems(orderItems);
			order.setCreateAt(new Date());
			List<CustomerAddress> addressList = customerAddressMapper.getCustomerAddressByCustomerId(Integer.parseInt(customerId));
			if(addressList!=null)
			{
				CustomerAddress address = addressList.get(0);
				order.setAddress(address.getAddress());
				order.setCity(address.getCity());
				order.setCountry(address.getCountry());
				order.setPostCode(address.getPostCode());
				order.setName(address.getName());
				order.setOrderStatus(OrderStatus.AUTO);
				order.setCustomerId(Integer.parseInt(customerId));
				orderService.insertOrder(order);
			}
			orders.add(order);
		}//for trades
		for(Order order : orders){
			System.out.println(order.getName());
			List<OrderItem> orderItems = order.getOrderItems();
			for(OrderItem orderItem : orderItems){
				System.out.println("sku: " +orderItem.getSkuId() + " name: " + orderItem.getName() + "num: " + orderItem.getNum());
			}
		}
		
		return new ModelAndView("/customer/order/manageOrder");
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
	
	

	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public OrderRecordService getOrderRecordService() {
		return orderRecordService;
	}
	public void setOrderRecordService(OrderRecordService orderRecordService) {
		this.orderRecordService = orderRecordService;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public CustomerAddressMapper getCustomerAddressMapper() {
		return customerAddressMapper;
	}

	public void setCustomerAddressMapper(CustomerAddressMapper customerAddressMapper) {
		this.customerAddressMapper = customerAddressMapper;
	}

	public CustomerMapper getCustomerMapper() {
		return customerMapper;
	}

	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}
	
	
	
}
