package com.omartech.tdg.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.MessageMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Message;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Seller;

@Controller
public class MessageCenterAction {

	private MessageMapper messageMapper;
	
	@RequestMapping("/{userType}/messageCenter/list")
	public ModelAndView messageList(
			@PathVariable String userType,
			@RequestParam(value="pageNo", defaultValue = "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session){
		List<Message> messages = new ArrayList<Message>();
		if(userType.equals("admin")){
			messages = messageMapper.getMessageListByPage(new Page(pageNo,pageSize));
		}else{
			int userId = 0;
			if(userType.equals("seller")){
				Seller seller = (Seller) session.getAttribute("seller");
				userId = seller.getId();
			}else if(userType.equals("customer")){
				Customer customer = (Customer)session.getAttribute("customer");
				userId = customer.getId();
			}
			messages = messageMapper.getMessageListByUserAndPage(userType, userId, new Page(pageNo,pageSize));
		}
		return new ModelAndView("/"+userType+"/message/list").addObject("messages", messages).addObject("pageNo", pageNo);
	}
	@RequestMapping("/{userType}/messageCenter/{id}/show")
	public ModelAndView messageShow(
			@PathVariable String userType,
			@PathVariable int id,
			HttpSession session){
		Message message = messageMapper.getMessageById(id);
		int userId = 0;
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
		}
		if(userId != message.getUserId()){
			message = null;
		}
		return new ModelAndView("/"+userType+"/message/show").addObject("message", message);
	}
	@RequestMapping("/{userType}/messageCenter/new")
	public String messageShow(
			@PathVariable String userType){
		return "/"+userType+"/message/new";
	}
	
	@RequestMapping("/{userType}/messageCenter/create")
	public String messageCreate(
			@PathVariable String userType,
			@RequestParam String title,
			@RequestParam String content,
			HttpSession session
			){
		int userId = 0 ;
		if(userType.equals("seller")){
			Seller seller = (Seller) session.getAttribute("seller");
			userId = seller.getId();
		}else if(userType.equals("customer")){
			Customer customer = (Customer)session.getAttribute("customer");
			userId = customer.getId();
		}
		
		Message message = new Message();
		message.setContent(content);
		message.setTitle(title);
		message.setUserId(userId);
		message.setUserType(userType);
		message.setCreateAt(new Date());
		messageMapper.insertMessage(message);
		return "redirect:/"+userType+"/messageCenter/list";
	}
	@RequestMapping("/{userType}/messageCenter/{id}/edit")
	public ModelAndView messageEdit(
			@PathVariable String userType,
			@PathVariable int id
			){
		Message message = messageMapper.getMessageById(id);
		return new ModelAndView("/"+userType+"/message/edit").addObject("message", message);
	}
	@RequestMapping("/{userType}/messageCenter/{id}/update")
	public String messageUpdate(
			@PathVariable String userType,
			@PathVariable int id,
			@RequestParam String title,
			@RequestParam String content
			){
		Message message = messageMapper.getMessageById(id);
		message.setContent(content);
		message.setTitle(title);
		message.setCreateAt(new Date());
		messageMapper.updateMessage(message);
		return "redirect:/"+userType+"/messageCenter/list";
	}
	
	public MessageMapper getMessageMapper() {
		return messageMapper;
	}
	public void setMessageMapper(MessageMapper messageMapper) {
		this.messageMapper = messageMapper;
	}
}
