package com.synex.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.synex.domain.Role;
import com.synex.domain.User;
import com.synex.service.RoleService;
import com.synex.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	
	@Autowired UserService userService;
	@Autowired RoleService roleService;

	@GetMapping(value = "/login")
	public String login(@RequestParam(required = false) String logout, @RequestParam(required = false) String error,
			HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Model model) {
		String message = "";
		if (error != null) {
			message = "Invalid Credentials";
		}
		if (logout != null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(httpServletRequest, httpServletResponse, auth);
			}
			message = "Logout";
			return "login";
		}
		model.addAttribute("Message", message);
		return "login";

	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	} 
	
	@PostMapping("/saveNewUser")
	public ModelAndView saveNewUser(@RequestParam String username, @RequestParam String email, @RequestParam String password) {
		ModelAndView mav = new ModelAndView();
		User newUser = new User();
		
		newUser.setUsername(username);
		newUser.setEmail(email);
		newUser.setPassword(password);
		List<Role> roles = new ArrayList<>();
		roles.add(roleService.findByRoleName("USER"));
		newUser.setRoles(roles);
		
		User foundUser = userService.findByUsername(username);
		if (foundUser != null) {
			mav.addObject("Message", "username already exists");
			mav.setViewName("signup");
		} else {
			userService.save(newUser);
			mav.setViewName("login");
		}
		
		return mav;
		
	} 
	
	@GetMapping("accessDenied")
	public String accessDenied() {
		return "accessDenied";
	}
}
