package com.omartech.tdg.action.seller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.FinanceService;
import com.omartech.tdg.utils.UserType;
@RequestMapping("/seller/finance")
@Controller
public class SellerFinanceAction {
	@Autowired
	private FinanceService financeService;
	@RequestMapping("/thismonth")
	public ModelAndView listThisMonth(HttpSession session,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Seller seller = (Seller) session.getAttribute(UserType.SELLER);
		int sellerId = seller.getId();
		Calendar beginDate = Calendar.getInstance();
		beginDate.set(Calendar.MONTH, beginDate.get(Calendar.MONTH)-1);//上个月
		beginDate.set(Calendar.DATE, 15);
		Date begin = beginDate.getTime();
		Calendar endDate = Calendar.getInstance();
		Date end = endDate.getTime();
		List<FinanceUnit> units = financeService.getFinanceBySellerIdAndMonthByPage(sellerId, begin, end, new Page(pageNo, pageSize));
		
		return new ModelAndView("/seller/finance/this").addObject("financeUnits", units).addObject("pageNo", pageNo).addObject("begin", begin).addObject("end", end);
	}

	@RequestMapping("/lastmonth")
	public ModelAndView listLastMonth(){
		return new ModelAndView("/seller/finance/last");
	}
	@RequestMapping("/history")
	public ModelAndView listHistory(){
		return new ModelAndView("/seller/finance/history");
	}
}
