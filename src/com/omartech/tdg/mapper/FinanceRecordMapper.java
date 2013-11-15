package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.Page;

public interface FinanceRecordMapper {
	
	public void insert(FinanceRecord record);
	
	public void update(FinanceRecord record);
	
	public FinanceRecord getFinanceRecordById(int id);
	
	public List<FinanceRecord> getFinanceRecordsByPage(Page page);
	

}
