package com.synex.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.InsuranceClient;
import com.synex.domain.Plan;

@Controller
public class HomeController {
	
	@Autowired InsuranceClient insuranceClient;

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
	
	@GetMapping(value = "admin")
	@Secured({"DBA", "ADMIN"})
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView("admin");
		
		return mav;
	} 
	
	@GetMapping("adminInsurance")
	public ModelAndView adminInsurance() {
		ModelAndView mav = new ModelAndView("adminInsurance");
		ArrayList insurances = new ArrayList();
		insuranceClient.findAllInsurance().forEach(insurance -> {
			insurances.add(insurance);
		});
		mav.addObject("insurances", insurances);
		return mav;
	}
}
