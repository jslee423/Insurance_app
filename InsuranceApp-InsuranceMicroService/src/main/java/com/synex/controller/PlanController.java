package com.synex.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.EmailDetails;
import com.synex.domain.Plan;
import com.synex.domain.QuoteRequest;
import com.synex.service.EmailService;
import com.synex.service.PlanService;

@RestController
public class PlanController {

	@Autowired PlanService planService;
	@Autowired EmailService emailService;
	
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
	
	@PostMapping("getPlanQuote")
	public void getPlanQuote(@RequestBody QuoteRequest quoteRequest) {
		quoteRequest.setRequestDate(LocalDate.now());
		
		Plan requestedPlan = planService.findById(quoteRequest.getPlan().getId());
		
		EmailDetails emailDetails = new EmailDetails();
		emailDetails.setRecipient(quoteRequest.getEmail());
		emailDetails.setSubject("InsurancePress - Free Quote: " + requestedPlan.getPlanName());
		
		StringBuilder message = new StringBuilder();
		message.append("Hi " + quoteRequest.getName() + ",\n\n");
		message.append("Here are details for the requested plan:\n\n");
		message.append("Plan name: " + requestedPlan.getPlanName() + "\n");
		message.append("Plan type: " + requestedPlan.getPlanType() + "\n");
		message.append("Monthly premium: " + requestedPlan.getPremium() + "\n");
		message.append("Deductible: " + requestedPlan.getDeductible() + "\n");
		message.append("PCP visit: " + requestedPlan.getPcpVisitPrice() + "\n");
		message.append("Specialist visit: " + requestedPlan.getSpecialistPrice() + "\n");
		message.append("Prescriptions: " + requestedPlan.getPrescriptionPrice() + "\n");
		emailDetails.setMsgBody(message.toString());

		emailService.sendSimpleMail(emailDetails);
		
	}
}
