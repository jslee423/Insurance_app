package com.synex.service;

import java.util.List;

import com.synex.domain.User;

public interface UserService {
	public List<User> findAll();
	public User save(User user);
	public void deleteUserById(Long userId);
	public User findByUserId(Long userId);
	public User findByUsername(String username);
}
