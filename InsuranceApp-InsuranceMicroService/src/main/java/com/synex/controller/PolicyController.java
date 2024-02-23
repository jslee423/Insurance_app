package com.synex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.EmailDetails;
import com.synex.domain.Policy;
import com.synex.service.EmailService;
import com.synex.service.PolicyService;

@RestController
public class PolicyController {

	@Autowired PolicyService policyService;
	@Autowired EmailService emailService;
	
	@PostMapping("savePolicy")
	public Policy savePolicy(@RequestBody Policy policy) {
		Policy savedPolicy = policyService.savePolicy(policy);
		
		EmailDetails emailDetails = new EmailDetails();
		emailDetails.setRecipient(savedPolicy.getCustomer().getEmail());
		emailDetails.setSubject("InsurancePress - Required Documents: " + savedPolicy.getPlan().getPlanName());
		
		StringBuilder message = new StringBuilder();
		message.append("Hi " + savedPolicy.getCustomer().getFirstName() + ",\n\n");
		message.append("Thank you for purchasing our " + savedPolicy.getPlan().getPlanName() + " plan.\n\n");
		message.append("Before your policy starts we require some additonal information.\n\n");
		message.append("Follow the link below to upload required documents:\n");
		message.append("http://localhost:8282/profile.\n\n");
		message.append("Here are the details of your purchase:\n\n");
		message.append("Plan name: " + savedPolicy.getPlan().getPlanName() + "\n");
		message.append("Plan type: " + savedPolicy.getPlan().getPlanType() + "\n");
		message.append("Monthly premium: " + savedPolicy.getPrice() + "\n");
		message.append("Deductible: " + savedPolicy.getPlan().getDeductible() + "\n");
		message.append("PCP visit: " + savedPolicy.getPlan().getPcpVisitPrice() + "\n");
		message.append("Specialist visit: " + savedPolicy.getPlan().getSpecialistPrice() + "\n");
		message.append("Prescriptions: " + savedPolicy.getPlan().getPrescriptionPrice() + "\n");
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
	
	@GetMapping("findPolicyByCustomerId/{customerId}")
	public List<Policy> findPolicyByCustomerId(@PathVariable Long customerId) {
		return policyService.findbyCustomerId(customerId);
	}
}
