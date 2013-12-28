package com.omartech.tdg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.SystemSettingMapper;
import com.omartech.tdg.model.SystemSetting;

@Service
public class SystemSettingService {
	@Autowired
	private SystemSettingMapper systemSettingMapper;
	
	public SystemSetting getSystemSetting(){
		SystemSetting setting =  systemSettingMapper.getSystemSetting();
		if(setting == null){
			setting = new SystemSetting();
			insert(setting);
		}
		return setting;
	}
	
	public void update(SystemSetting systemSetting){
		systemSettingMapper.update(systemSetting);
	}
	
	public void insert(SystemSetting systemSetting){
		systemSettingMapper.insert(systemSetting);
	}

}
