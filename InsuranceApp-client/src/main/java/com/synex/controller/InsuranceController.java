package com.synex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.synex.client.InsuranceClient;

@RestController
public class InsuranceController {
	
	@Autowired InsuranceClient insuranceClient;

	//----------------- INSURANCE -----------------
	@GetMapping("findAllInsurance")
	public JsonNode findAllInsurance() {
		insuranceClient.findAllInsurance().forEach(insurance -> {
			System.out.println(insurance.get("name").toString());
		});
		return insuranceClient.findAllInsurance();
	}
	
	//----------------- PLAN -----------------
	@GetMapping("findPlanByInsuranceId/{insuranceId}")
	public JsonNode findPlanByInsuranceId(@PathVariable Long insuranceId) {
		return insuranceClient.findPlanByInsuranceId(insuranceId);
	}
	
	@GetMapping("findAllPlans")
	public JsonNode findAllPlans() {
		return insuranceClient.findAllPlans();
	} 
	
	@PostMapping("getPlanQuote")
	public JsonNode getPlanQuote(@RequestBody JsonNode jsonNode) {
		return insuranceClient.getPlanQuote(jsonNode);
	}
	
	//----------------- CUSTOMER -----------------
	@PostMapping("saveCustomer")
	public JsonNode saveCustomer(@RequestBody JsonNode jsonNode) {
		return insuranceClient.saveCustomer(jsonNode);
	}
	
	@GetMapping("findCustomerByUserId/{userId}")
	public JsonNode findCustomerByUserId(@PathVariable Long userId) {
		return insuranceClient.findCustomerByUserId(userId);
	}

	@PostMapping("addCustomerDocs")
	public JsonNode addCustomerDocs(@PathVariable Long customerId, @PathVariable String addressDoc, @PathVariable String govIdDoc) {
		return insuranceClient.addCustomerDocs(customerId, addressDoc, govIdDoc);
	}
	
	//----------------- POLICY -----------------
	@PostMapping("savePolicy")
	public JsonNode savePolicy(@RequestBody JsonNode jsonNode) {
		return insuranceClient.savePolicy(jsonNode);
	}
	
	@GetMapping("findPolicyById/{policyId}")
	public JsonNode findPolicyById(@PathVariable Long policyId) {
		return insuranceClient.findPolicyById(policyId);
	}
	
	@GetMapping("findAllPolicies")
	public JsonNode findAllPolicies() {
		return insuranceClient.findAllPolicies();
	} 
	
	@GetMapping("findPolicyByStatus/{status}")
	public JsonNode findPolicyByStatus(@PathVariable String status) {
		return insuranceClient.findPolicyByStatus(status);
	}
	
	@GetMapping("approvePolicy/{policyId}")
	public JsonNode approvePolicy(@PathVariable Long policyId) {
		return insuranceClient.approvePolicy(policyId);
	}
	
	@GetMapping("denyPolicy/{policyId}")
	public JsonNode denyPolicy(@PathVariable Long policyId) {
		return insuranceClient.denyPolicy(policyId);
	}
	
	//----------------- PAYMENT -----------------
	@PostMapping("savePayment")
	public JsonNode savePayment(@RequestBody JsonNode jsonNode) {
		return insuranceClient.savePayment(jsonNode);
	}
}
