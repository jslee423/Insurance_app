package com.synex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Policy;
import com.synex.repository.PolicyRepository;

@Service
public class PolicyService {

	@Autowired PolicyRepository policyRepository;
	@Autowired CustomerService customerService;
	
	public Policy savePolicy(Policy policy) {
		Policy savedPolicy = policyRepository.save(policy);

		return savedPolicy;
	}
	
	public Policy findByCustomerIdAndPlanId(Long customerId, Long planId) {
		return policyRepository.findByCustomerIdAndPlanId(customerId, planId);
	} 
	
	public Policy findById(Long policyId) {
		return policyRepository.findById(policyId).orElse(null);
	} 
	
	public List<Policy> findAll() {
		return policyRepository.findAll();
	} 
	
	public List<Policy> findbyCustomerId(Long customerId) {
		return policyRepository.findByCustomerId(customerId);
	} 
	
	public List<Policy> findByStatus(String status) {
		return policyRepository.findByStatus(status);
	} 
}
