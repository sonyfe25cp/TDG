package com.omartech.tdg.action.seller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.FinanceRecord;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.FinanceRecordService;
import com.omartech.tdg.utils.UserType;

@Controller
@RequestMapping("/seller/financeRecord")
public class SellerFinanceRecordAction {

	@Autowired
	private FinanceRecordService financeRecordService;
	
	@RequestMapping("/list")
	public ModelAndView list(
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session
			){
		Seller seller = (Seller) session.getAttribute(UserType.SELLER);
		int sellerId = seller.getId();
		List<FinanceRecord> financeRecords = financeRecordService.getFinanceRecordsBySellerIdByPage(sellerId, new Page(pageNo, pageSize));
		return new ModelAndView("/seller/finance/record-list").addObject("financeRecords", financeRecords).addObject("pageNo", pageNo);
	}
	/**
	 * 查看对账单
	 * @param id
	 * @return
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView show(
			@PathVariable int id
			){
		FinanceRecord  record = financeRecordService.getFinanceRecordById(id);
		return new ModelAndView("/seller/finance/record-show").addObject("financeRecord", record);
	}
	
	/**
	 * 申请交易
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/apply", method = RequestMethod.POST)
	public String update(@RequestParam int id){
		financeRecordService.updateStatus(id, FinanceRecord.Applying);
		return "redirect:/seller/financeRecord/show/"+id;
	}
	
}
