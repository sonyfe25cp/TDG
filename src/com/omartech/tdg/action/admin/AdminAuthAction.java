package com.omartech.tdg.action.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Admin;
import com.omartech.tdg.service.admin.AdminAuthService;
import com.omartech.tdg.utils.PasswordUtils;
@Controller
public class AdminAuthAction {
	@Autowired
	private AdminAuthService adminAuthService;
	
	@RequestMapping(value="/loginasadmin")
	public String loginAsAdmin(){
		return "/admin/auth/login";
	}
	
	@RequestMapping(value="/admin/create", method = RequestMethod.POST)
	public String createAAdmin(@RequestParam String email){
		Admin admin = new Admin();
		admin.setEmail(email);
		admin.setPassword(PasswordUtils.create());
		adminAuthService.insertAdmin(admin);
		//TODO send email to master
		return "/admin/auth/confirm";
	}
	
	@RequestMapping(value="/adminlogin", method = RequestMethod.POST)
	public String adminLogin(@RequestParam String email,
			@RequestParam String password, HttpSession session){
		Admin admin = adminAuthService.getAdminByEmailAndPassword(email, password);
		session.setAttribute("admin", admin);
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
