package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.service.FinanceService;
import com.omartech.tdg.utils.UserType;

@Controller
@RequestMapping("/admin/finance")
public class AdminFinanceAction {
	
	@Autowired
	private FinanceService financeService;
	
	@RequestMapping("/thismonth")
	public ModelAndView listThisMonth(){
		return new ModelAndView("/admin/finance/this");
	}

	@RequestMapping("/lastmonth")
	public ModelAndView listLastMonth(){
		return new ModelAndView("/admin/finance/last");
	}
	@RequestMapping("/history")
	public ModelAndView listHistory(){
		return new ModelAndView("/admin/finance/history");
	}
	@RequestMapping("/orders-all")
	public ModelAndView allAboutOrders(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		
		List<FinanceUnit> units = null;
		return new ModelAndView("/admin/finance/finance-order-list").addObject("financeUnits", units).addObject("pageNo", pageNo);
	}
	@RequestMapping("/receive-all")
	public ModelAndView allReceive(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<FinanceUnit> units = financeService.getFinanceByReceiverAndMonthByPage(0, UserType.ADMIN, null, null, new Page(pageNo, pageSize));
		return new ModelAndView("/admin/finance/finance-order-list").addObject("financeUnits", units).addObject("pageNo", pageNo);
	}
	@RequestMapping("/send-all")
	public ModelAndView allSend(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<FinanceUnit> units = financeService.getFinanceBySenderAndMonthByPage(0, UserType.ADMIN, null, null, new Page(pageNo, pageSize));
		return new ModelAndView("/admin/finance/finance-order-list").addObject("financeUnits", units).addObject("pageNo", pageNo);
	}
}
