package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.service.FinanceRecordService;

@RequestMapping("/admin/financeRecord")
@Controller
public class AdminFinanceRecordAction {

	@Autowired
	private FinanceRecordService financeRecordService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize
			){
		List<FinanceRecord> financeRecords = financeRecordService.getFinanceRecordsByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/admin/finance/record-list").addObject("financeRecords", financeRecords);
	}
	
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable int id){
		FinanceRecord record = financeRecordService.getFinanceRecordById(id);
		return new ModelAndView("/admin/finance/record-show").addObject("financeRecord", record);
	}
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String update(
			@RequestParam int id,
			@RequestParam int status
			){
		financeRecordService.updateStatus(id, status);
		return "redirect:/admin/financeRecord/list";
	}
	
}
