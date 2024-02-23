package com.synex.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Customer;
import com.synex.domain.Policy;
import com.synex.repository.PolicyRepository;

@Service
public class PolicyService {

	@Autowired PolicyRepository policyRepository;
	@Autowired CustomerService customerService;
	
	public Policy savePolicy(Policy policy) {
		policy.setOpenDate(LocalDate.now());
		policy.setEndDate(LocalDate.now().plusYears(1));
		Policy savedPolicy = policyRepository.save(policy);
//		Customer policyCustomer = customerService.findByUserId(savedPolicy.getCustomer().getId());
//		List<Policy> policies = policyCustomer.getPolicies();
//		policies.add(savedPolicy);
//		policyCustomer.setPolicies(policies);
//		customerService.save(policyCustomer);
		return savedPolicy;
	}
	
	public Policy findByCustomerIdAndPlanId(Long customerId, Long planId) {
		return policyRepository.findByCustomerIdAndPlanId(customerId, planId);
	} 
	
	public Policy findById(Long policyId) {
		return policyRepository.findById(policyId).orElse(null);
	} 
	
	public List<Policy> findbyCustomerId(Long customerId) {
		return policyRepository.findByCustomerId(customerId);
	} 
}
