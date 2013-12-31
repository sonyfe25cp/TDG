package com.omartech.tdg.action.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.service.ClaimService;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.utils.UserType;

@Controller
@RequestMapping("/customer/claim")
public class CustomerClaimAction {

	@Autowired
	private ClaimService claimService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/list/{claimType}")
	public ModelAndView list(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			@PathVariable String claimType,
			HttpSession session
			){
		Customer customer = (Customer) session.getAttribute(UserType.CUSTOMER);
		int customerId = customer.getId();
		List<ClaimItem> claimItems = claimService.getClaimItemsByCustomerIdAndClaimTypeByPage(customerId, claimType, new Page(pageNo, pageSize));
		return new ModelAndView("/customer/claim/list").addObject("claims", claimItems).addObject("pageNo", pageNo).addObject("claimType", claimType);
	}

}
