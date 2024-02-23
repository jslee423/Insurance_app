package com.synex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Customer;
import com.synex.repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired CustomerRepository customerRepository;
	
	public Customer save(Customer customer) {
		return customerRepository.save(customer);
	}
	
	public Customer findByUserId(Long userId) {
		return customerRepository.findByUserId(userId);
	}
}
