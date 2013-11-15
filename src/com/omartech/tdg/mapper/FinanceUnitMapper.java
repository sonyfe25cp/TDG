package com.omartech.tdg.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;

public interface FinanceUnitMapper {
	
	public void insert(FinanceUnit unit);
	public void update(FinanceUnit unit);
	
	public List<FinanceUnit> getFinanceByReceiverByPage(@Param("receiver")String receiver, @Param("page")Page page);
	public List<FinanceUnit> getFinanceBySenderByPage(@Param("sender")String sender, @Param("page") Page page);
	
	public List<FinanceUnit> getFinanceByReceiverAndMonthByPage(@Param("receiver")String receiver, @Param("begin") Date begin, @Param("end")Date end,  @Param("page")Page page);
	public List<FinanceUnit> getFinanceBySenderAndMonthByPage(@Param("sender")String sender, @Param("begin") Date begin, @Param("end")Date end,  @Param("page")Page page);
}
