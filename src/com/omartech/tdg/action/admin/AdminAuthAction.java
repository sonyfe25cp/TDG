package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Admin;
import com.omartech.tdg.service.admin.AdminAuthService;
@Controller
public class AdminAuthAction {
	@Autowired
	private AdminAuthService adminAuthService;
	
	@RequestMapping(value="/loginasadmin")
	public String loginAsAdmin(){
		return "/admin/auth/login";
	}
	@RequestMapping(value="/createaadmin")
	public String createAAdmin(){
		return "/admin/auth/confirm";
	}
	
	@RequestMapping(value="/adminlogin")
	public String adminLogin(@RequestParam String email,
			@RequestParam String password){
		Admin admin = adminAuthService.getAdminByEmailAndPassword(email, password);
		if(admin !=null){
			return "/admin/index";
		}else{
			return "/admin/auth/login";
		}
	}
	
	
	
	
	public AdminAuthService getAdminAuthService() {
		return adminAuthService;
	}
	public void setAdminAuthService(AdminAuthService adminAuthService) {
		this.adminAuthService = adminAuthService;
	}
}
