package com.synex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.Plan;
import com.synex.service.PlanService;

@RestController
public class PlanController {

	@Autowired PlanService planService;
	
	@GetMapping("findAllPlans")
	public List<Plan> findAll() {
		return planService.findAll();
	} 
	
	@GetMapping("findPlanById/{planId}")
	public Plan findPlanById(@PathVariable Long planId) {
		return planService.findById(planId);
	} 
	
	@GetMapping("findPlanByInsuranceId/{insuranceId}")
	public List<Plan> findPlanByInsurance(@PathVariable Long insuranceId) {
		return planService.findByInsuranceId(insuranceId);
	} 
}
