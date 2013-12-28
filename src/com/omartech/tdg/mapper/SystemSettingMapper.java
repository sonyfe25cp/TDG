package com.omartech.tdg.mapper;

import com.omartech.tdg.model.SystemSetting;

public interface SystemSettingMapper {

	public SystemSetting getSystemSetting();
	
	public void update(SystemSetting systemSetting);
	
	public void insert(SystemSetting systemSetting);

}
