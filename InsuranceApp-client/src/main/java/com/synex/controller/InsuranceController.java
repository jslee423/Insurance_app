package com.synex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.synex.client.InsuranceClient;

@RestController
public class InsuranceController {
	
	@Autowired InsuranceClient insuranceClient;

	@GetMapping("findAllInsurance")
	public JsonNode findAllInsurance() {
		insuranceClient.findAllInsurance().forEach(insurance -> {
			System.out.println(insurance.get("name").toString());
		});
		return insuranceClient.findAllInsurance();
	}
	
	@GetMapping("findPlanByInsuranceId/{insuranceId}")
	public JsonNode findPlanByInsuranceId(@PathVariable Long insuranceId) {
		return insuranceClient.findPlanByInsuranceId(insuranceId);
	}
	
	@GetMapping(value = "findAllPlans")
	public JsonNode findAllPlans() {
		return insuranceClient.findAllPlans();
	} 
}
