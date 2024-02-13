package com.synex.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.InsuranceClient;
import com.synex.domain.Gender;

@Controller
public class HealthController {

	@Autowired InsuranceClient insuranceClient;
	
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
	public ModelAndView applyHealth() {
		ModelAndView mav = new ModelAndView("apply");
		mav.addObject("genders", Gender.values());
		ArrayList plans = new ArrayList();
		insuranceClient.findAllPlans().forEach(plan -> {
			plans.add(plan);	
		});
		
		mav.addObject("plans", plans);
		
		return mav;
	} 
}
