package com.omartech.tdg.action.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.NoticeMapper;
import com.omartech.tdg.model.Admin;
import com.omartech.tdg.model.Notice;
import com.omartech.tdg.service.admin.AdminAuthService;
import com.omartech.tdg.utils.PasswordUtils;
import com.omartech.tdg.utils.UserType;
@Controller
public class AdminAuthAction {
	@Autowired
	private AdminAuthService adminAuthService;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
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
			return "redirect:/admin/welcome";
		}else{
			return "/admin/auth/login";
		}
	}
	
	@RequestMapping("/admin/welcome")
	public ModelAndView welcome(){
		Notice notice = noticeMapper.getNoticeByUserType(UserType.ADMIN);
		return new ModelAndView("/admin/auth/welcome").addObject("notice", notice);
	}
	
	@RequestMapping(value="/admin/logout")
	public String adminlogout(HttpSession session){
		session.removeAttribute("admin");
		return "redirect:/loginasadmin";
	}
	
	public AdminAuthService getAdminAuthService() {
		return adminAuthService;
	}
	public void setAdminAuthService(AdminAuthService adminAuthService) {
		this.adminAuthService = adminAuthService;
	}
	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}

	public void setNoticeMapper(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}
}
