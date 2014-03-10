package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.exception.OrderItemsException;
import com.omartech.tdg.exception.OutOfStockException;
import com.omartech.tdg.exception.ShopException;
import com.omartech.tdg.mapper.OrderItemMapper;
import com.omartech.tdg.mapper.OrderMapper;
import com.omartech.tdg.mapper.SellerMapper;
import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.OrderItem;
import com.omartech.tdg.model.OrderRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.ShopSetting;
import com.omartech.tdg.utils.ClaimRelation;
import com.omartech.tdg.utils.OrderRecordFactory;
import com.omartech.tdg.utils.OrderStatus;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private OrderRecordService orderRecordService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private ClaimService claimService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private FinanceService financeService;
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	
	public List<Order> getOrdersInSellerObserving(){
		return orderMapper.getOrdersInSellerObserving();
	}
	public List<Order> getOrdersInCustomerObserving(){
		return orderMapper.getOrdersInCustomerObserving();
	}
	
	public List<Order> getReturnAvailableOrders(){
		return orderMapper.getReturnAvailableOrders();
	}
	/**
	 * 买家投诉某订单
	 * @param orderId
	 * @param comment
	 * @param claimType
	 */
	public void claimOrder(int orderId, String comment, String claimType){
		claimOrder(orderId, 0, comment, claimType);
	}
	/**
	 * 退钱给买家 percent%
	 * @param orderId
	 * @param claimId
	 * @param percent
	 */
	private void returnMoneyToUserFromSeller(int orderId, int claimId, float percent){
		if(percent > 100){
			System.err.println("the return money percent > 100 in returnMoneyToUserFromSeller");
			return ;
		}
		//1.退全款, 若是退全款，直接更改投诉状态为结束
		ClaimItem claim = claimService.getClaimItemById(claimId);
		if(claim.getClaimType().equals(ClaimRelation.Claim)){
			financeService.payMoneyBackCauseClaim(orderId, percent);
		}else if(claim.getClaimType().equals(ClaimRelation.Return)){
			financeService.payMoneyBackCauseReturnNoExcuse(orderId, percent);
		}
		
		if(percent == 100f){
			claimService.updateStatus(claimId, ClaimRelation.ok);
			closeClaim(claim);
		}
		//2.订单操作记录
		Order order = getOrderById(orderId);
		OrderRecord record = OrderRecordFactory.createByStatus(order, OrderStatus.ReturnMoney);
		record.setComment(record.getComment() + ", 返款比例为 : " + percent +"%.");
		record.setCommentInEnglish(record.getCommentInEnglish() + ", return percent is : " + percent +"%.");
		orderRecordService.insertOrderRecord(record);
		
		//3.发邮件
		emailService.sendEmailWhenSellerReturnMoney(order);
	}
//	private void returnMoneyToUserFromSeller2(int orderId, int claimId, float percent){
//		if(percent > 100){
//			System.err.println("the return money percent > 100 in returnMoneyToUserFromSeller");
//			return ;
//		}
//		//1.退全款, 若是退全款，直接更改投诉状态为结束
//		financeService.payMoneyBackCauseReturnNoExcuse(orderId, percent);
//		if(percent == 100f){
//			claimService.updateStatus(claimId, ClaimRelation.ok);
//			ClaimItem claim = claimService.getClaimItemById(claimId);
//			closeClaim(claim);
//		}
//		//2.订单操作记录
//		Order order = getOrderById(orderId);
//		OrderRecord record = OrderRecordFactory.createByStatus(order, OrderStatus.ReturnMoney);
//		record.setComment(record.getComment() + ", 返款比例为 : " + percent +"%.");
//		record.setCommentInEnglish(record.getCommentInEnglish() + ", return percent is : " + percent +"%.");
//		orderRecordService.insertOrderRecord(record);
//		
//		//3.发邮件
//		emailService.sendEmailWhenSellerReturnMoney(order);
//	}
	/**
	 * 关闭投诉后，需要按照原订单状态来改变订单状态
	 * 1.更改订单会原状态
	 * 2.关闭投诉
	 * @param claim
	 */
	public void closeClaim(ClaimItem claim){
		int privousStatus = claim.getPreviousStatus();
		int orderId = claim.getClaimItemId();
		//1. 还原订单状态
		simpleUpdateOrderStatus(privousStatus, orderId);
		//2. 关闭投诉
		claimService.updateStatus(claim.getId(), ClaimRelation.ok);
		//3. 解锁支出项
		financeService.unlockTheOrderById(orderId);
	}
	
	/**
	 * 卖家把某订单的全款退还买家
	 */
	public void returnWholeMoneyBySeller(int orderId, int claimId){
		//1. 退钱
		returnMoneyToUserFromSeller(orderId, claimId, 100);
		//2. 解锁原来支出项
		financeService.unlockTheOrderById(orderId);
		//3. 全款已退，直接关闭订单即可
		simpleUpdateOrderStatus(OrderStatus.CLOSE, orderId);
		//4. 插入记录
		Order order = getOrderById(orderId);
		OrderRecord	record = OrderRecordFactory.createByStatus(order, OrderStatus.CLOSE);
		orderRecordService.insertOrderRecord(record);
	}
	
	/**
	 * 管理员把钱从卖家退给买家
	 * @param orderId
	 * @param claimId
	 * @param percent
	 */
	public void returnMoneyToUserByAdmin(int orderId, int claimId, float percent){
		//1. 退钱
		returnMoneyToUserFromSeller(orderId, claimId, percent);
		//2. 解锁原来支出项
		financeService.unlockTheOrderById(orderId);
		//3. 只要退钱了，就关闭订单
		if(percent > 0){
			simpleUpdateOrderStatus(OrderStatus.CLOSE, orderId);
		}
	}
//	public void returnMoneyToUserByAdmin2(int orderId, int claimId, float percent){
//		//1. 退钱
//		returnMoneyToUserFromSeller2(orderId, claimId, percent);
//		//2. 解锁原来支出项
//		financeService.unlockTheOrderById(orderId);
//		//3. 只要退钱了，就关闭订单
//		if(percent > 0){
//			simpleUpdateOrderStatus(OrderStatus.CLOSE, orderId);
//		}
//	}
	
	/**
	 * 买家取消投诉
	 * @param orderId
	 */
	public void cancelComplainOrderByCustomer(int orderId){
		cancelComplainOrder(orderId, true);
	}
	/**
	 * 管理员取消投诉
	 * @param orderId
	 */
	public void cancelComplainOrderByAdmin(int orderId){
		cancelComplainOrder(orderId, false);
	}
	/**
	 * 取消投诉某订单
	 * @param orderId
	 * @param isCustomer
	 */
	private void cancelComplainOrder(int orderId, boolean isCustomer){
		ClaimItem claimItem = claimService.getClaimItemByClaimTypeAndItemId(ClaimRelation.Claim, orderId);
		if(claimItem == null){
			claimItem = claimService.getClaimItemByClaimTypeAndItemId(ClaimRelation.Return, orderId);
		}
		if(claimItem.getStatus() == ClaimRelation.discard || claimItem.getStatus() == ClaimRelation.ok ){
			//已经完成或者取消了还取消个蛋
			return;
		}
		/**
		 * 关闭claim，还原订单状态
		 */
		closeClaim(claimItem);
		
		/**
		 * 记录解除投诉
		 */
		Order order = getOrderById(orderId);
		OrderRecord record = null;
		if(isCustomer){
			record = OrderRecordFactory.createByStatus(order, OrderStatus.CANCELCOMPLAINBYCUSTOMER);
		}else{
			record = OrderRecordFactory.createByStatus(order, OrderStatus.CANCELCOMPLAINBYADMIN);
		}
		orderRecordService.insertOrderRecord(record);
	}
	
	/**
	 * 插入ClaimItem，同时给卖家和买家发送邮件
	 * @param orderId
	 * @param reasonId
	 * @param comment 买家的留言
	 * @param claimType 类型：claim，return
	 */
	public void claimOrder(int orderId, int reasonId, String comment, String claimType){
		/**
		 * 生成claim
		 */
		ClaimItem claimItem = new ClaimItem();
		Order order = getOrderById(orderId);
		int status = order.getOrderStatus();
		claimItem.setPreviousStatus(status);
		claimItem.setStatus(ClaimRelation.ongoing);
		claimItem.setClaimType(claimType);
		claimItem.setClaimItemId(orderId);
		claimItem.setSellerId(order.getSellerId());
		claimItem.setCustomerId(order.getCustomerId());
		claimItem.setClaimTypeId(reasonId);
		claimItem.setComment(comment);
		claimService.insert(claimItem);
		
		/**
		 * 根据不同类型处理claim
		 */
		if(claimType.equals(ClaimRelation.Claim)){
			updateOrderStatus(OrderStatus.COMPLAIN, orderId);
		}else if(claimType.equals(ClaimRelation.Return)){
			updateOrderStatus(OrderStatus.RETURN, orderId);
		}
		/**
		 * 锁定该订单的支出项
		 */
		financeService.lockTheOrderById(orderId);
	}
	/**
	 * 某个卖家在某段时间内的订单
	 * @param begin
	 * @param end
	 * @param sellerId
	 * @return
	 */
	public List<Order> getOrdersByDateRangeAndSellerId(Date begin, Date end, int sellerId){
		return orderMapper.getOrdersByDateRangeAndSellerId(begin, end, sellerId);
	}
	/**
	 * 某时间段内的所有订单
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Order> getOrdersByDateRange(Date begin, Date end){
		return orderMapper.getOrdersByDateRange(begin, end);
	}
	
	public List<Order> getCustomerOrdersByStatusAndPage(int customerId, int status, Page page){
		List<Order> orders = new ArrayList<Order>();
		if(status == 0 ){
			orders =  getCustomerOrdersByPage(customerId, page);
			
		}else{
			orders = orderMapper.getCustomerOrdersByStatusAndPage(customerId, status, page);
		}
		setOrderItemsToOrders(orders);
		return orders;
	}
	
	private void setOrderItemsToOrders(List<Order> originOrders){
		for(Order order : originOrders){
			int id = order.getId();
			List<OrderItem> items = orderItemMapper.getOrderItemsByOrderId(id);
			order.setOrderItems(items);
		}
	}
	
	public List<Order> getSellerOrdersByStatusAndPage(int sellerId, int status, Page page){
		if(status == 0 ){
			return getSellerOrdersByPage(sellerId, page);
		}
		return orderMapper.getSellerOrdersByStatusAndPage(sellerId, status, page);
	}
	public List<Order> getOrdersByStatusAndPage(int status, Page page){
		return orderMapper.getOrdersByStatusAndPage(status, page);
	}
	
	public List<Order> getCustomerOrdersByPage(int customerId, Page page){
		return orderMapper.getCustomerOrdersByPage(customerId, page);
	}
	public List<Order> getSellerOrdersByPage(int sellerId, Page page){
		return orderMapper.getSellerOrdersByPage(sellerId, page);
	}
	public List<Order> getOrdersByPage(Page page){
		return orderMapper.getOrdersByPage(page);
	}
	
	public Order getOrderById(int id){
		Order order = orderMapper.getOrderById(id);
		if(order == null){
			return null;
		}
		List<OrderItem> orderItems = orderItemMapper.getOrderItemsByOrderId(id);
		order.setOrderItems(orderItems);
		return order;
	}
	
	public List<Order> getOrderByIdArray(String[] idArray){
		List<Order> orders = new ArrayList<Order>();
		for(String id : idArray){
			if(id!=null && id.length()!=0){
				Order tmp = getOrderById(Integer.parseInt(id));
				orders.add(tmp);
			}
		}
		return orders;
	}
	
	public void updateOrderBySeller(Order order){
		update(order);
	}
	private void update(Order order){
		orderMapper.updateOrder(order);
	}
	/**
	 * 自动任务使用
	 */
	public void updateForAuto(Order order){
		orderMapper.updateOrder(order);
	}
	/**
	 * 变更到某订单状态
	 * @param status
	 * @param orderId
	 * @throws OutOfStockException
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updateOrderStatus(int status, int orderId)throws OutOfStockException{
		updateOrderStatus(status, orderId, null, null);
	}
	
	public void simpleUpdateOrderStatus(int status, int orderId){
		Order order = getOrderById(orderId);
		order.setOrderStatus(status);
		if(status == OrderStatus.CLOSE || status == OrderStatus.AUTOCLOSE){
			Date overAt = new Date(System.currentTimeMillis());
			order.setOverAt(overAt);//处理投诉结束，更新时间
			order.setSellerObserveFlag(Order.ObserveOver);
		}
		update(order);
	}
	/**
	 * 变更到某状态
	 * 给商家留言的地方
	 * @param status
	 * @param orderId
	 * @param comment
	 * @throws OutOfStockException
	 */
	@Transactional(rollbackFor = Exception.class)
	public void updateOrderStatus(int status, int orderId, String cancelComment, Integer cancelReason)throws OutOfStockException{
		Order order = getOrderById(orderId);
		/**
		 * 判断要变化到的状态，然后做 相应的处理
		 * 不同的原订单状态 要求 新状态的设定时间不一样
		 * 	付款项只需要设定
		 */
		int currentStatus = order.getOrderStatus();
		if(status == OrderStatus.PAID){//当付款的时候才会减到库存
			//1.确认是新订单状态
			if(currentStatus == OrderStatus.NOPAY){//只有是新下单状态才可以付款
				reduceStock(order);//减少订单中货物的库存
			}
			//2.开启买家观测
			order.setCustomerObserveFlag(Order.Observing);
			order.setPaidAt(new Date(System.currentTimeMillis()));
		}else if(status == OrderStatus.CANCELBYSELLER){//若是商家取消订单，则需要标注原因
			orderCancelledBySeller(order, cancelComment, cancelReason);
		}else if(status == OrderStatus.COMPLAIN){//被投诉的时候，观测期结束
			order.setSellerObserveFlag(Order.ObserveOver);
		}else if(status == OrderStatus.RETURN){//被退货的时候，观测期结束
			order.setSellerObserveFlag(Order.ObserveOver);
		}else if(status == OrderStatus.CLOSE || status == OrderStatus.AUTOCLOSE){ //结束的时候，卖家观测期结束
			order.setSellerObserveFlag(Order.ObserveOver);
			Date overAt = new Date(System.currentTimeMillis());
			order.setOverAt(overAt);
		}else if(status == OrderStatus.RECEIVE){//已收货就没有买家观测期了
			order.setCustomerObserveFlag(Order.ObserveOver);
		}
		financeService.insertOrderFinance(order, status);//根据先前状态来判读是否需要插入新的款项
		order.setOrderStatus(status);
		orderMapper.updateOrder(order);//改变订单状态
		financeService.freshUnitTime(orderId);//订单状态改变了，财务项的时间也要跟着改变，便于后续统计金额
		OrderRecord record = OrderRecordFactory.createByStatus(order, status);
		orderRecordService.insertOrderRecord(record);
	}
	
	/**
	 * 若由商家取消
	 * 1. 判断是否已经付款；
	 * 		若未付，无所谓了
	 * 		若已付，先退款
	 * 2. 设置原因
	 * 3. 发送邮件
	 * @param order
	 * @param cancelComment
	 * @param cancelReason
	 */
	private void orderCancelledBySeller(Order order ,String cancelComment, Integer cancelReason){
		order.setCancelComment(cancelComment);
		order.setCancelReason(cancelReason);
		emailService.sendEmailWhenSellerCancelOrder(order);
	}
	
	
	/**
	 * 创建订单
	 * 1. 判断是否均来自一个商家，否则需要切分订单
	 * 2. 根据购买数量来扣掉对应的库存
	 * 3. 发送邮件通知已经下单成功
	 * @param order
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public int insertOrder(Order order){
		boolean needSplit = checkNeedSplit(order);
		if(order.getPrice() == 0){
			countPrice(order);
		}
		orderMapper.insertOrder(order);//插入订单
		orderRecordService.insertOrderRecord(OrderRecordFactory.createByStatus(order, order.getOrderStatus()));//插入订单记录
		
		emailService.sendEmailWhenMakeOrderOk(order);//给卖家发邮件
		
		int orderId = order.getId();
		for(OrderItem item : order.getOrderItems()){
			item.setOrderId(orderId);
			orderItemMapper.insertOrderItem(item);
		}
		if(needSplit){
			List<Order> orders = splitOrder(order,orderId);
			for(Order subOrder : orders){
				insertOrder(subOrder);
			}
			order.setOrderStatus(OrderStatus.CUT);
			updateOrderStatus(OrderStatus.CUT, orderId);
		}
		
		return orderId;
	}
	/**
	 * 减少订单中对应货物的库存
	 */
	public void reduceStock(Order order) throws OutOfStockException{
		List<OrderItem> orderItems = order.getOrderItems();
		for(OrderItem orderItem : orderItems){
			int id = orderItem.getItemId();
			int count = orderItem.getNum();
			itemService.reduceStock(id, count);
		}
	}
	/**
	 * 检测是否需要切分订单
	 * @param order
	 * @return
	 * @throws OrderItemsException
	 */
	private boolean checkNeedSplit(Order order) throws OrderItemsException, ShopException{
		List<OrderItem> orderItems = order.getOrderItems();
		if(orderItems!=null){
			int sellerId = orderItems.get(0).getSellerId();
			for(OrderItem item : orderItems){
				int tmpId = item.getSellerId();
				if(tmpId != sellerId){
					return true;
				}
			}
			Seller seller = sellerMapper.getSellerById(sellerId);
			String sellerName = seller.getBusinessName();
			order.setSellerId(sellerId);
			order.setSellerName(sellerName);
			ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(sellerId);
			if(shopSetting == null){
				throw new ShopException();
			}
			order.setCoinage(shopSetting.getDefaultCoinage());
			return false;
		}else{
			throw new OrderItemsException(order);
		}
	}
	/**
	 * 将一个订单切分为多个订单
	 * @param order
	 * @param orderId
	 * @return
	 */
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
			subOrder.setSellerId(sellerId);
			String sellerName = sellerMapper.getSellerById(sellerId).getBusinessName();
			subOrder.setSellerName(sellerName);
			subOrder.setOrderStatus(OrderStatus.NOPAY);
			subOrder.setParentId(orderId);
			subOrder.setCreateAt(new Date());
			countPrice(subOrder);
			orders.add(subOrder);
		}
		return orders;
	}
	/**
	 * orderItem 的price为单价，priceRMB为对应的rmb价格
	 * order中的price 为总价，priceRMB为对应的rmb总价
	 */
	private void countPrice(Order order){
		List<OrderItem> orderItems = order.getOrderItems();
		float price = 0f;//该订单的总价
		float priceRMB = 0f;
		float transfeeAll = 0f;//该订单的运费总价
		float transfeeAllRMB = 0f;
		float orderFeeAll = 0f;//订单中货物价格
		float orderFeeAllRMB = 0f;
		float discountFee = 0f;//总折扣费用
		float discountFeeRMB = 0f;
		float originOrderFee = 0f;
		float originOrderFeeRMB = 0f;
		for(OrderItem orderItem : orderItems){
			float tmpTotal = orderItem.getSumPrice() + (orderItem.getInternationalShippingFee() * orderItem.getNum());//物品总价+运费*数量
			float tmpTotalRMB = orderItem.getSumPriceRMB() + (orderItem.getIfeeRMB() * orderItem.getNum());
			price += tmpTotal;
			priceRMB += tmpTotalRMB;
			
			/**
			 * 运费 = 运费*num
			 */
			transfeeAll += (orderItem.getInternationalShippingFee() * orderItem.getNum());
			transfeeAllRMB += (orderItem.getIfeeRMB() * orderItem.getNum());
			
			orderFeeAll += orderItem.getSumPrice();
			orderFeeAllRMB += orderItem.getSumPriceRMB();
			
			discountFee += (orderItem.getDiscountFee() * orderItem.getNum());
			discountFeeRMB += (orderItem.getDiscountFeeRMB() * orderItem.getNum());
			
			float originTmp = orderItem.getPrice() * orderItem.getNum();
			float originTmpRMB = orderItem.getPriceRMB() * orderItem.getNum();
			
			originOrderFee += originTmp;
			originOrderFeeRMB += originTmpRMB;
			
			
			
		}
		order.setPrice(price);
		order.setPriceRMB(priceRMB);
		order.setTransferPrice(transfeeAll);
		order.setTransferPriceRMB(transfeeAllRMB);
		order.setOrderPrice(orderFeeAll);
		order.setOrderPriceRMB(orderFeeAllRMB);
		order.setDiscountFee(discountFee);
		order.setDiscountFeeRMB(discountFeeRMB);
		order.setOriginPrice(originOrderFee);
		order.setOriginPriceRMB(originOrderFeeRMB);
		float tmpOriginTotal = originOrderFee + transfeeAll;
		float tmpOriginTotalRMB = originOrderFeeRMB + transfeeAllRMB;
		order.setOriginTotal(tmpOriginTotal);
		order.setOriginTotalRMB(tmpOriginTotalRMB);
	}
	
	public OrderMapper getOrderMapper() {
		return orderMapper;
	}
	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}
	public OrderItemMapper getOrderItemMapper() {
		return orderItemMapper;
	}
	public void setOrderItemMapper(OrderItemMapper orderItemMapper) {
		this.orderItemMapper = orderItemMapper;
	}
	public SellerMapper getSellerMapper() {
		return sellerMapper;
	}
	public void setSellerMapper(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
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
	

}
