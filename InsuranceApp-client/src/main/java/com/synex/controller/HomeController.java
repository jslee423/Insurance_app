package com.synex.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.ClaimClient;
import com.synex.client.InsuranceClient;
import com.synex.domain.User;
import com.synex.service.UserService;

@Controller
public class HomeController {
	
	@Autowired InsuranceClient insuranceClient;
	@Autowired UserService userService;
	@Autowired ClaimClient claimClient;

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		ArrayList<Object> plans = new ArrayList<>();
		insuranceClient.findAllPlans().forEach(plan -> {
			plans.add(plan);
		});
		mav.addObject("plans", plans);
		
		return mav;
	} 
	
	@GetMapping("profile")
	@Secured({"USER"})
	public ModelAndView profile(Principal principal) {
		ModelAndView mav = new ModelAndView("profile");
		User loggedUser = userService.findByUsername(principal.getName());
		if (!insuranceClient.findCustomerByUserId(loggedUser.getId()).isEmpty()) {
			Long customerId = insuranceClient.findCustomerByUserId(loggedUser.getId()).get("id").asLong();
			ArrayList policies = new ArrayList();
			insuranceClient.findPolicyByCustomerId(customerId).forEach(policy -> {
				policies.add(policy);
			});
			mav.addObject("policies", policies);
			
			ArrayList approvedPolicies = new ArrayList();
			insuranceClient.findPolicyByCustomerId(customerId).forEach(policy -> {
				if (policy.get("status").asText().equals("APPROVED")) {
					approvedPolicies.add(approvedPolicies);
				}
			});
			mav.addObject("approvedPolicies", approvedPolicies);
			
			ArrayList claims = new ArrayList();
			claimClient.findClaimByCustomerId(customerId).forEach(claim -> claims.add(claim));
			mav.addObject("claims", claims);
			
			mav.addObject("customer", insuranceClient.findCustomerByUserId(loggedUser.getId()));			
		}
		
		return mav;
	} 
}
