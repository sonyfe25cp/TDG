package com.omartech.tdg.mapper;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;

public interface FinanceUnitMapper {
	
	public FinanceUnit getFinanceUnitById(int id);
	
	public void insert(FinanceUnit unit);
	public void update(FinanceUnit unit);
	
	public List<FinanceUnit> getFinanceByReceiverByPage(@Param("receiver")String receiver, @Param("page")Page page);
	public List<FinanceUnit> getFinanceBySenderByPage(@Param("sender")String sender, @Param("page") Page page);
	
	public List<FinanceUnit> getFinanceByReceiverAndMonthByPage(@Param("receiver")String receiver, @Param("begin") Date begin, @Param("end")Date end,  @Param("page")Page page);
	public List<FinanceUnit> getFinanceBySenderAndMonthByPage(@Param("sender")String sender, @Param("begin") Date begin, @Param("end")Date end,  @Param("page")Page page);
	//根据detailstype和id查，是唯一的
	public FinanceUnit getFinanceUnitsByRelatedIdAndDetailsType(@Param("relatedId")int relatedId, @Param("financeDetailsType") int financeDetailsType, @Param("userType") String userType);
	//根据financeType和id查是一组
	public List<FinanceUnit> getFinanceUnitsByRelatedIdAndRelatedType(@Param("relatedId")int relatedId, @Param("relatedType") String relatedType);
	
	//批量更新状态用
	public void batchUpdate(@Param("idset")Set<Integer> idset, @Param("status")int status);
	
	public void delete(int id);
}
