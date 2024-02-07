package com.synex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.synex.domain.User;
import com.synex.repository.UserRepository;

@Service
public class UserServiceImp implements UserService {

	@Autowired UserRepository userRepository;
	@Autowired BCryptPasswordEncoder encoder;
	
	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}
	@Override
	public User save(User user) {
		String encryptedPasswored = encoder.encode(user.getPassword());
		user.setPassword(encryptedPasswored);
		
		return userRepository.save(user);
	}
	@Override
	public void deleteUserById(Long userId) {
		userRepository.deleteById(userId);
		
	}
	@Override
	public User findByUserId(Long userId) {
		return userRepository.findById(userId).orElse(null);
	}
	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	

}
