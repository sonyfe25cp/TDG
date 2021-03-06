package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.FinanceRecordMapper;
import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.utils.UserType;
@Service
public class FinanceRecordService {

	@Autowired
	private FinanceService financeService;
	@Autowired
	private FinanceRecordMapper financeRecordMapper;
	/**
	 * 构建ID
	 * @param id
	 * @param userType
	 * @return
	 */
	private String contructID(int id, String userType){
		if(userType.equals(UserType.ADMIN)){
			return UserType.ADMIN;
		}else{
			return userType +"-"+id;
		}
	}
	/**
	 * 卖家对账单
	 * @param sellerId
	 * @param page
	 * @return
	 */
	public List<FinanceRecord> getFinanceRecordsBySellerIdByPage(int sellerId, Page page){
		String receiver = contructID(sellerId, UserType.SELLER);
		return financeRecordMapper.getFinanceRecordsByReceiverByPage(receiver, page);
	}
	/**
	 * 翻译对账单
	 * @param translatorId
	 * @param page
	 * @return
	 */
	public List<FinanceRecord> getFinanceRecordsByTranslatorIdByPage(int translatorId, Page page){
		String receiver = contructID(translatorId, UserType.TRANSLATOR);
		return financeRecordMapper.getFinanceRecordsByReceiverByPage(receiver, page);
	}
	
	/**
	 * 插入对帐单，同时所有对帐单内信息不可更改
	 * @param record
	 */
	public void insert(FinanceRecord record){
		if(record.getTotal() == 0){
			record.setStatus(FinanceRecord.NoNeed);
		}
		financeRecordMapper.insert(record);
		financeService.batchUpdate(record.getUnitIdSet(), FinanceUnit.ONGOING);
	}
	/**
	 * 变更对账单状态
	 * 1.变为申请
	 * 		将unit的状态变为正在处理
	 * 2.变为完成
	 * 		完成时，需要更新所有该对账单内的账目为完成
	 * @param id
	 * @param status
	 */
	
	public void updateStatus(int id, int status){
		FinanceRecord record = getFinanceRecordById(id);
		switch(status){
		case FinanceRecord.Over:
			financeService.batchUpdate(record.getUnitIdSet(), FinanceUnit.OVER);
			break;
		case FinanceRecord.Applying:
			financeService.batchUpdate(record.getUnitIdSet(), FinanceUnit.ONGOING);
			break;
		}
		record.setStatus(status);
		financeRecordMapper.update(record);
	}
	
	public FinanceRecord getFinanceRecordById(int id){
		FinanceRecord fr =  financeRecordMapper.getFinanceRecordById(id);
		String units = fr.getUnitIds();
		if(units!=null && units.length() > 0){
			String[] unitsArray = units.split(",");
			for(String unit : unitsArray){
				int unitId = Integer.parseInt(unit);
				FinanceUnit tmp = financeService.getFinanceUnitById(unitId);
				fr.addFinanceUnit(tmp);
			}
		}
		return fr;
	}
	public List<FinanceRecord> getFinanceRecordsByPage(Page page){
		return financeRecordMapper.getFinanceRecordsByPage(page);
	}
}
