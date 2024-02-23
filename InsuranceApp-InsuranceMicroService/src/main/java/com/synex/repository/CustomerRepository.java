package com.synex.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

	public Customer findByUserId(Long userId); 
}
