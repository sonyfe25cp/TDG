package com.omartech.tdg.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Customer;
import com.omartech.tdg.utils.AccountStatus;

public class CustomerAuthInterceptor implements HandlerInterceptor{
	Logger logger = Logger.getLogger(CustomerAuthInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		HttpSession session=request.getSession();
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null){
			logger.info("no auth to login as Customer");
			logger.error("no Customer auth now!!");
			response.sendRedirect("/loginascustomer");
			return false;
		}else{
			int status = customer.getAccountStatus();
			if(status == AccountStatus.SUSPEND){
				response.sendRedirect("/freezeout");
				return false;
			}
			return true;
		}
	}

}
