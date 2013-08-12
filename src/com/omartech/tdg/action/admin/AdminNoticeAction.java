package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.NoticeMapper;
import com.omartech.tdg.model.Notice;

/**
 * 管理员通知各用户
 * @author Sonyfe25cp
 * 2013-8-12
 */
@Controller
public class AdminNoticeAction {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@RequestMapping("/admin/notice/new/{userType}")
	public ModelAndView newNotice(@PathVariable String userType){
		return new ModelAndView("/admin/notice/new").addObject("userType", userType);
	}
	@RequestMapping("/admin/notice/show/{userType}")
	public ModelAndView showNotice(@PathVariable String userType){
		Notice notice = noticeMapper.getNoticeByUserType(userType);
		return new ModelAndView("/admin/notice/show").addObject("notice", notice).addObject("userType", userType);
	}
	@RequestMapping("/admin/notice/create/{userType}")
	public String createNotice(@RequestParam String content, @RequestParam String userType){
		Notice  notice = new Notice();
		notice.setContent(content);
		notice.setUserType(userType);
		noticeMapper.insertNotice(notice);
		return "redirect:/admin/notice/show/"+userType;
	}
	@RequestMapping("/admin/notice/edit/{userType}")
	public ModelAndView editNotice(@PathVariable String userType){
		Notice notice = noticeMapper.getNoticeByUserType(userType);
		return new ModelAndView("/admin/notice/edit").addObject("notice", notice).addObject("userType", userType);
	}
	@RequestMapping("/admin/notice/update/{userType}")
	public String updateNotice(@RequestParam String content, @RequestParam String userType){
		Notice notice = noticeMapper.getNoticeByUserType(userType);
		notice.setContent(content);
		notice.setUserType(userType);
		noticeMapper.updateNotice(notice);
		return "redirect:/admin/notice/show/"+userType;
	}

	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}
	public void setNoticeMapper(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}
	
}
