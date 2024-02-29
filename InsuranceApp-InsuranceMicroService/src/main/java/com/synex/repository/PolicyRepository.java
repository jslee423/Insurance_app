package com.synex.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Policy;

public interface PolicyRepository extends JpaRepository<Policy, Long> {

	public Policy findByCustomerIdAndPlanId(Long customerId, Long planId);
	
	public List<Policy> findByCustomerId(Long customerId);
	
	public List<Policy> findByStatus(String status); 
}
