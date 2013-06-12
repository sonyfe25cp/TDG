package com.omartech.tdg.mapper;

import com.omartech.tdg.model.Admin;

public interface AdminMapper {
	
	public Admin getAdminByEmail(String email);
	
	public Admin getAdminByEmailAndPassword(String email, String password);
	
	public void insertAdmin(Admin admin);
	
	public void updateAdmin(Admin admin);
	
}
