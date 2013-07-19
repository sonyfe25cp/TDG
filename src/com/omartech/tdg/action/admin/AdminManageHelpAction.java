package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.service.HelpServiceService;

@Controller
@RequestMapping(value="/admin/manageHelp")
public class AdminManageHelpAction {
	
	@Autowired
	private HelpServiceService helpServiceService;
	
	@RequestMapping(value="/{helpManagePage}")
	public ModelAndView helpManage(@PathVariable("helpManagePage") String helpManagePage){
		return new ModelAndView("/admin/help-manage/" + helpManagePage).addObject("updateResult", " ");
	}
	
	@RequestMapping(value="/updateTradeRules")
	public ModelAndView updateTradeRules(@RequestParam("tradeRules") String tradeRules){
		String updateResult = "更新成功！";
		helpServiceService.updateTradeRules(tradeRules);
		return new ModelAndView("/admin/help-manage/tradeRulesManage").addObject("updateResult", updateResult);
	}
	
}
