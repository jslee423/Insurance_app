package com.synex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.Customer;
import com.synex.service.CustomerService;

@RestController
public class CustomerController {

	@Autowired CustomerService customerService;
	
	@PostMapping("saveCustomer")
	public Customer saveCustomer(@RequestBody Customer customer) {
		Customer foundCustomer = customerService.findByUserId(customer.getUserId());
		
		if (foundCustomer != null) {
			System.out.println("Customer already exists for user with id " + customer.getUserId());
			return foundCustomer;
		}
		return customerService.save(customer);
	}
	
	@GetMapping("findCustomerByUserId/{userId}")
	public Customer findCustomerByUserId(@PathVariable Long userId) {
		return customerService.findByUserId(userId);
	} 
}
