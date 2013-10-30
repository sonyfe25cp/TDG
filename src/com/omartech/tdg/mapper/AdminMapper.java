package com.omartech.tdg.mapper;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Admin;

public interface AdminMapper {
	
	public Admin getAdminByEmail(String email);
	
	public Admin getAdminByEmailAndPassword(@Param("email")String email, @Param("password")String password);
	
	public void insertAdmin(Admin admin);
	
	public void updateAdmin(Admin admin);
	
}
