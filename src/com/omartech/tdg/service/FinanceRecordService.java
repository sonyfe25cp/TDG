package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.FinanceRecordMapper;
import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.Page;
@Service
public class FinanceRecordService {

	@Autowired
	private FinanceService financeService;
	@Autowired
	private FinanceRecordMapper financeRecordMapper;
	
	public void insert(FinanceRecord record){
		financeRecordMapper.insert(record);
	}
	/**
	 * 变更对账单状态
	 * 1.变为申请
	 * 2.变为完成
	 * 		完成时，需要更新所有该对账单内的账目为完成
	 * @param id
	 * @param status
	 */
	
	public void updateStatus(int id, int status){
		FinanceRecord record = getFinanceRecordById(id);
		switch(status){
		case FinanceRecord.Over:
			financeService.batchUpdate(record.getUnitIdSet(), FinanceRecord.Over);
			break;
		}
	}
	
	public FinanceRecord getFinanceRecordById(int id){
		return financeRecordMapper.getFinanceRecordById(id);
	}
	public List<FinanceRecord> getFinanceRecordsByPage(Page page){
		return financeRecordMapper.getFinanceRecordsByPage(page);
	}
}
