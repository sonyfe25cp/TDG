package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.SystemSetting;
import com.omartech.tdg.service.SystemSettingService;

/*
 * basic settings
 */
@RequestMapping("/admin/settings")
@Controller
public class AdminSystemSettingAction {
	
	
	@Autowired
	private SystemSettingService systemSettingService;
	
	@RequestMapping("/show")
	public ModelAndView show(){
		SystemSetting systemSetting = systemSettingService.getSystemSetting();
		return new ModelAndView("/admin/systemsetting/show").addObject("systemSetting", systemSetting);
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(){
		SystemSetting systemSetting = systemSettingService.getSystemSetting();
		return new ModelAndView("/admin/systemsetting/edit").addObject("systemSetting", systemSetting);
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam String storeAddress){
		SystemSetting setting = systemSettingService.getSystemSetting();
		setting.setStoreAddress(storeAddress);
		systemSettingService.update(setting);
		return "redirect:/admin/settings/show";
	}
}
