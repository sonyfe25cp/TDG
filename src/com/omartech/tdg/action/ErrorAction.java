package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorAction {

	@RequestMapping("/{userType}/error/shopError")
	public String shopError(@PathVariable String userType){
		return "/"+ userType +"/error/shopError";
	}

}
