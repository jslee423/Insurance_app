package com.synex.service;

import java.util.List;

import com.synex.domain.Role;

public interface RoleService {

	public Role saveRole(Role role); 
	
	public List<Role> findAll();
	
	public Role findById(Long roleId);
	
	public void deleteById(Long roleId);
	
	public Role findByRoleName(String roleName);
}
