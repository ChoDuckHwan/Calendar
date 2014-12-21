package com.mycompany.myapp.dao;

import com.mycompany.myapp.domain.UserRole;

public interface UserRoleDao {
	public int add(UserRole userRole);
	UserRole get(String email);
	void update(UserRole userRole);
}