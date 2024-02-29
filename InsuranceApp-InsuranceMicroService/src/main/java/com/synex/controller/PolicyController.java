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
import com.synex.domain.Policy;
import com.synex.service.EmailService;
import com.synex.service.PlanService;
import com.synex.service.PolicyService;

@RestController
public class PolicyController {

	@Autowired PolicyService policyService;
	@Autowired EmailService emailService;
	@Autowired PlanService planService;
	
	@PostMapping("savePolicy")
	public Policy savePolicy(@RequestBody Policy policy) {
		policy.setOpenDate(LocalDate.now());
		policy.setEndDate(LocalDate.now().plusYears(1));
		Policy savedPolicy = policyService.savePolicy(policy);
		Plan plan = planService.findById(policy.getPlan().getId());
		
		EmailDetails emailDetails = new EmailDetails();
		emailDetails.setRecipient(savedPolicy.getCustomer().getEmail());
		emailDetails.setSubject("InsurancePress - Required Documents: " + plan.getPlanName());
		
		StringBuilder message = new StringBuilder();
		message.append("Hi " + savedPolicy.getCustomer().getFirstName() + ",\n\n");
		message.append("Thank you for purchasing our " + plan.getPlanName() + " plan.\n\n");
		message.append("Before your policy starts we require some additonal information.\n\n");
		message.append("Follow the link below to upload required documents:\n");
		message.append("http://localhost:8282/profile.\n\n");
		message.append("Here are the details of your purchase:\n\n");
		message.append("Plan name: " + plan.getPlanName() + "\n");
		message.append("Plan type: " + plan.getPlanType() + "\n");
		message.append("Monthly premium: " + savedPolicy.getPrice() + "\n");
		message.append("Deductible: " + plan.getDeductible() + "\n");
		message.append("PCP visit: " + plan.getPcpVisitPrice() + "\n");
		message.append("Specialist visit: " + plan.getSpecialistPrice() + "\n");
		message.append("Prescriptions: " + plan.getPrescriptionPrice() + "\n");
		emailDetails.setMsgBody(message.toString());

		emailService.sendSimpleMail(emailDetails);
		
		return savedPolicy;
	}
	
	@GetMapping("findPolicyByCustomerIdAndPlanId")
	public Policy findPolicyByCustomerIdAndPlanId(Long customerId, Long planId) {
		return policyService.findByCustomerIdAndPlanId(customerId, planId);
	}
	
	@GetMapping("findPolicyById/{policyId}")
	public Policy findPolicyById(@PathVariable Long policyId) {
		return policyService.findById(policyId);
	} 
	
	@GetMapping("findAllPolicies")
	public List<Policy> findAllPolicies() {
		return policyService.findAll();
	} 
	
	@GetMapping("findPolicyByCustomerId/{customerId}")
	public List<Policy> findPolicyByCustomerId(@PathVariable Long customerId) {
		return policyService.findbyCustomerId(customerId);
	}
	
	@GetMapping("findPolicyByStatus/{status}")
	public List<Policy> findPolicyByStatus(@PathVariable String status) {
		return policyService.findByStatus(status);
	}
	
	@GetMapping("approvePolicy/{policyId}")
	public Policy approvePolicy(@PathVariable Long policyId) {
		Policy policy = policyService.findById(policyId);
		policy.setStatus("APPROVED");
		
		return policyService.savePolicy(policy);
	} 
	
	@GetMapping("denyPolicy/{policyId}")
	public Policy denyPolicy(@PathVariable Long policyId) {
		Policy policy = policyService.findById(policyId);
		policy.setStatus("DENIED");
		
		return policyService.savePolicy(policy);
	} 
}
