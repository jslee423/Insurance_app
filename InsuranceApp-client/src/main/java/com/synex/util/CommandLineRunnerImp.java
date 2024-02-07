package com.synex.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.synex.domain.Role;
import com.synex.domain.User;
import com.synex.service.RoleService;
import com.synex.service.UserService;

@Component
public class CommandLineRunnerImp implements CommandLineRunner {

	@Autowired UserService userService;
	@Autowired RoleService roleService;
	
	@Override
	public void run(String... args) throws Exception {
		if (roleService.findByRoleName("ADMIN") == null) {
			Role role = new Role();
			role.setId(1L);
			role.setRoleName("ADMIN");
			roleService.saveRole(role);
		}
		
		if (userService.findByUsername("admin") == null) {
			List<Role> roles = new ArrayList<>();
			roles.add(roleService.findByRoleName("ADMIN"));
			
			User user = new User();
			user.setId(null);
			user.setUsername("admin");
			user.setPassword("admin");
			user.setEmail("admin@admin.com");
			user.setRoles(roles);
			userService.save(user);
		}

	}

}
