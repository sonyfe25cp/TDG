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
	@RequestMapping("/admin/auth/new")
	public String newAdmin(){
		return "/admin/auth/new";
	}
	@RequestMapping("/admin/auth/edit")
	public String editAdmin(){
		return "/admin/auth/edit";
	}
	@RequestMapping(value="/admin/auth/update", method = RequestMethod.POST)
	public String updateAdmin(@RequestParam String email, @RequestParam String password, @RequestParam String oldPassword){
		Admin admin = adminAuthService.getAdminByEmailAndPassword(email, oldPassword);
		if(admin == null || admin.getEmail() == null){
			
		}else{
			admin.setPassword(password);
			adminAuthService.updateAdmin(admin);
		}
		return "redirect:/admin/auth/show";
	}
	
	@RequestMapping("/admin/auth/show")
	public ModelAndView showAdmin(HttpSession session){
		Admin ad = (Admin) session.getAttribute("admin");
		String email = ad.getEmail();
		Admin admin = adminAuthService.getAdminByEmail(email);
		return new ModelAndView("/admin/auth/show").addObject("admin", admin);
	}
	@RequestMapping(value="/admin/auth/create", method = RequestMethod.POST)
	public ModelAndView createAAdmin(@RequestParam String email, @RequestParam int level){
		if(email == null || email.length() == 0){
			return new ModelAndView("/admin/error/errorInput");
		}
		Admin admin = new Admin();
		admin.setEmail(email);
		admin.setPassword(PasswordUtils.create());
		admin.setLevel(level);
		boolean flag = adminAuthService.insertAdmin(admin);
		return new ModelAndView("/admin/auth/confirm").addObject("admin",admin).addObject("flag", flag);
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
