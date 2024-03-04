package com.synex.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.InsuranceClient;
import com.synex.domain.Gender;
import com.synex.service.UserService;

@Controller
public class HealthController {
	
	@Value("${stripe.keys.public}")
    private String API_PUBLIC_KEY;

	@Autowired InsuranceClient insuranceClient;
	@Autowired UserService userService;
	
	@RequestMapping("health")
	public ModelAndView health() {
		ModelAndView mav = new ModelAndView("health");
		ArrayList plans = new ArrayList();
		insuranceClient.findAllPlans().forEach(plan -> {
			plans.add(plan);
		});
		mav.addObject("plans", plans);
		
		ArrayList insurances = new ArrayList();
		insuranceClient.findAllInsurance().forEach(insurance -> {
			insurances.add(insurance);
		});
		mav.addObject("insurances", insurances);
		
		return mav;
	} 
	
	@RequestMapping("apply")
	public ModelAndView applyHealth(Principal principal) {
		ModelAndView mav = new ModelAndView("apply");
		mav.addObject("genders", Gender.values());
		ArrayList plans = new ArrayList();
		insuranceClient.findAllPlans().forEach(plan -> {
			plans.add(plan);	
		});
		mav.addObject("plans", plans);
		mav.addObject("currentUser", userService.findByUsername(principal.getName()));
		
		mav.addObject("stripePublicKey", API_PUBLIC_KEY);
		
		return mav;
	} 
	
	@RequestMapping("result/{policyId}/{chargeId}")
	public ModelAndView result(@PathVariable Long policyId, @PathVariable String chargeId) {
		ModelAndView mav = new ModelAndView("result");
		
		mav.addObject("policy", insuranceClient.findPolicyById(policyId));
		mav.addObject("chargeId", chargeId);
		
		return mav;
	} 
}
