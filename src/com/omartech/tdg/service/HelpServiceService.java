package com.omartech.tdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.HelpServiceMapper;
import com.omartech.tdg.model.HelpService;

@Service
public class HelpServiceService {
	@Autowired
	private HelpServiceMapper helpServiceMapper;
	
	public List<HelpService> getHelpService(){
		return helpServiceMapper.getHelpService();
	}
	
	public void insertHelpService(HelpService helpService){
		helpServiceMapper.insertHelpService(helpService);
	}
	
	public void updateHelpService(HelpService helpService){
		helpServiceMapper.updateHelpService(helpService);
	}

}
