package com.omartech.tdg.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.LogMapper;
import com.omartech.tdg.model.Log;
@Service
public class LogService {
	@Autowired
	private LogMapper logMapper;

	public void addLog(String username, String message){
		Log log = new Log();
		log.setContent(message);
		log.setUsername(username);
		log.setDate(new Date());
		logMapper.insertLog(log);
	}

	public LogMapper getLogMapper() {
		return logMapper;
	}

	public void setLogMapper(LogMapper logMapper) {
		this.logMapper = logMapper;
	}
	
}
