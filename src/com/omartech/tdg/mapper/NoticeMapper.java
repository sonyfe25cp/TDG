package com.omartech.tdg.mapper;

import com.omartech.tdg.model.Notice;

public interface NoticeMapper {

	public void insertNotice(Notice notice);
	
	public void updateNotice(Notice notice);
	
	public Notice getNoticeByUserType(String userType);
	
}
