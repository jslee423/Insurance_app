package com.synex.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.Claim;
import com.synex.service.ClaimService;

@RestController
public class ClaimController {

	@Autowired ClaimService claimService;
	
	@GetMapping("findAllClaims")
	public List<Claim> findAllClaims() {
		return claimService.findAll();
	} 
	
	@GetMapping("findClaimByStatus/{status}")
	public List<Claim> findClaimByStatus(@PathVariable String status) {
		return claimService.findByStatus(status);
	}
	
	@PostMapping("saveClaim")
	public Claim saveClaim(@RequestBody Claim claim) {
		claim.setOpenDate(LocalDate.now());
		claim.setStatus("PENDING");
		
		return claimService.saveClaim(claim);
	}
	
	@GetMapping("findClaimByCustomerId/{customerId}")
	public List<Claim> findClaimByCustomerId(@PathVariable Long customerId) {
		return claimService.findByCustomerId(customerId);
	} 
	
	@GetMapping("updateClaimStatus/{claimId}/{status}")
	public Claim approveClaim(@PathVariable Long claimId, @PathVariable String status) {
		Claim claim = claimService.findById(claimId);
		claim.setStatus(status);
		
		return claimService.saveClaim(claim);
	} 
}
