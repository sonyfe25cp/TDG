package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.OrderRecordMapper;
import com.omartech.tdg.model.OrderRecord;
@Service
public class OrderRecordService {
	@Autowired
	private OrderRecordMapper orderRecordMapper;
	
	public void insertOrderRecord(OrderRecord record){
		orderRecordMapper.insertOrderRecord(record);
	}
	
	public List<OrderRecord> getOrderRecordsByOrderId(long orderId){
		return orderRecordMapper.getOrderRecordsByOrderId(orderId);
	}

	public OrderRecordMapper getOrderRecordMapper() {
		return orderRecordMapper;
	}

	public void setOrderRecordMapper(OrderRecordMapper orderRecordMapper) {
		this.orderRecordMapper = orderRecordMapper;
	}

}
