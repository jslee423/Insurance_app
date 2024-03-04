package com.synex.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.ClaimClient;
import com.synex.client.InsuranceClient;

@Controller
@Secured({"DBA", "ADMIN"})
public class AdminController {
	
	@Autowired InsuranceClient insuranceClient;
	@Autowired ClaimClient claimClient;

	@GetMapping(value = "admin")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView("admin");
		ArrayList pendingPolicies = new ArrayList();
		insuranceClient.findPolicyByStatus("PENDING").forEach(policy -> {
			pendingPolicies.add(policy);
		});
		mav.addObject("pendingPolicies", pendingPolicies);
		
		ArrayList pendingClaims = new ArrayList();
		claimClient.findClaimByStatus("PENDING").forEach(claim -> {
			pendingClaims.add(claim);
		});
		mav.addObject("pendingClaims", pendingClaims);
		
		return mav;
	} 
	
	@GetMapping("admin/insurances")
	public ModelAndView adminInsurance() {
		ModelAndView mav = new ModelAndView("adminInsurance");
		ArrayList insurances = new ArrayList();
		insuranceClient.findAllInsurance().forEach(insurance -> {
			insurances.add(insurance);
		});
		mav.addObject("insurances", insurances);
		return mav;
	}
	
	@GetMapping("admin/policies")
	public ModelAndView adminPolicies() {
		ModelAndView mav = new ModelAndView("adminPolicies");
		ArrayList policies = new ArrayList();
		insuranceClient.findAllPolicies().forEach(policy -> {
			policies.add(policy);
		});
		mav.addObject("policies", policies);
		
		return mav;
	} 
	
	@GetMapping("admin/claims")
	public ModelAndView adminClaims() {
		ModelAndView mav = new ModelAndView("adminClaims");
		ArrayList pendingClaims = new ArrayList();
		ArrayList closedClaims = new ArrayList();
		claimClient.findAllClaims().forEach(claim -> {
			if (claim.get("status").asText().equals("PENDING")) {
				pendingClaims.add(claim);
			} else {
				closedClaims.add(claim);
			}
		});
		mav.addObject("pendingClaims", pendingClaims);
		mav.addObject("closedClaims", closedClaims);
		
		return mav;
	} 
}
