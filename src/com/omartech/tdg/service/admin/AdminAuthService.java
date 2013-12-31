package com.omartech.tdg.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.AdminMapper;
import com.omartech.tdg.model.Admin;

@Service
public class AdminAuthService {
	@Autowired
	private AdminMapper adminMapper;
	
	public Admin getAdminByEmailAndPassword(String email, String password){
		Admin admin = adminMapper.getAdminByEmailAndPassword(email, password);
		return admin;
	}
	
	public Admin getAdminByEmail(String email){
		Admin admin = adminMapper.getAdminByEmail(email);
		return admin;
	}
	
	public boolean insertAdmin(Admin admin){
		Admin old = getAdminByEmail(admin.getEmail());
		if(old != null){
			return false;
		}else{
			adminMapper.insertAdmin(admin);
			return true;
		}
	}
	
	public void updateAdmin(Admin admin){
		adminMapper.updateAdmin(admin);
	}

	public AdminMapper getAdminMapper() {
		return adminMapper;
	}
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	

}
