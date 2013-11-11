package com.omartech.tdg.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;

public interface FinanceUnitMapper {
	
	public void insert(FinanceUnit unit);
	
	public void update(FinanceUnit unit);
	
	public List<FinanceUnit> getFinanceBySellerIdAndMonthByPage(@Param("sellerId")int sellerId,@Param("begin") Date begin, @Param("end")Date end,@Param("page") Page page);
	
	public List<FinanceUnit> getFinanceByMonthByPage(@Param("begin")Date begin,@Param("end") Date end, @Param("page")Page page);

}
