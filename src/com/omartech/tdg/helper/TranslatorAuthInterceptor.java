package com.omartech.tdg.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Translator;

public class TranslatorAuthInterceptor implements HandlerInterceptor{
	Logger logger = Logger.getLogger(TranslatorAuthInterceptor.class);
	
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
		Translator translator=(Translator)session.getAttribute("translator");
		if(translator==null){
			logger.info("no auth to login as translator");
			logger.error("no translator auth now!!");
			response.sendRedirect("/loginastranslator");
			return false;
		}else{
			return true;
		}
	}

}
