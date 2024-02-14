package com.synex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Plan;
import com.synex.repository.PlanRepository;

@Service
public class PlanService {

	@Autowired PlanRepository planRepository;
	
	public List<Plan> findAll() {
		return planRepository.findAll();
	} 
	
	public Plan findById(Long planId) {
		return planRepository.findById(planId).orElse(null);
	}
	
	public List<Plan> findByInsuranceId(Long insuranceId) {
		return planRepository.findByInsuranceId(insuranceId);
	} 
}
