package com.omartech.tdg.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpCenterAction {

	@RequestMapping("/seller/help")
	public String sellerHelp(){
		return "/seller/common/help";
	}
	@RequestMapping("/help")
	public String customerHelp(){
		return "/customer/common/help";
	}
	@RequestMapping("/translator/help")
	public String translatorHelp(){
		return "/translator/common/help";
	}
}
