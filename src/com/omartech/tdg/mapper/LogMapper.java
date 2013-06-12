package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Log;

public interface LogMapper {

	void insertLog(Log log);
	
	void deleteLogs();
	
	List<Log> getLogsByPage(int pageNo, int pageSize);
	
	Log getLogById(int id);
	
}