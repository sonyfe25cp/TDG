package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Message;
import com.omartech.tdg.model.Page;

public interface MessageMapper {
	
	public List<Message> getMessageListByPage(Page page);
	
	public List<Message> getMessageListByUserTypeAndPage(@Param("userType") String userType, @Param("page") Page page);
	
	public List<Message> getMessageListByUserAndPage(@Param("userType") String userType, @Param("userId") int userId, @Param("page")Page page);

	public Message getMessageById(int id);
	
	public void insertMessage(Message message);
	
	public void deleteMessage(int id);
	
	public void updateMessage(Message message);
	
	
}
