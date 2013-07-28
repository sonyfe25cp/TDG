package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.OrderRecord;

public interface OrderRecordMapper {
	
	public void insertOrderRecord(OrderRecord record);
	
	public List<OrderRecord> getOrderRecordsByOrderId(long orderId);

}
