package com.synex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.synex.client.ClaimClient;

@RestController
public class ClaimRestController {

	@Autowired ClaimClient claimClient;
	
	@GetMapping("findAllClaims")
	public JsonNode findAllClaims() {
		return claimClient.findAllClaims();
	} 
	
	@GetMapping("findClaimByStatus/{status}")
	public JsonNode findClaimByStatus(@PathVariable String status) {
		return claimClient.findClaimByStatus(status);
	}
	
	@GetMapping("findClaimByCustomerId/{customerId}")
	public JsonNode findClaimByCustomerId(@PathVariable Long customerId) {
		return claimClient.findClaimByCustomerId(customerId);
	}
	
	@GetMapping("updateClaimStatus/{claimId}/{status}")
	public JsonNode updateClaimStatus(@PathVariable Long claimId, @PathVariable String status) {
		return claimClient.updateClaimStatus(claimId, status);
	}
}
