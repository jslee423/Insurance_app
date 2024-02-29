package com.synex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Claim;
import com.synex.repository.ClaimRepository;

@Service
public class ClaimService {

	@Autowired ClaimRepository claimRepository;
	
	public List<Claim> findAll() {
		return claimRepository.findAll();
	} 
	
	public Claim findById(Long claimId) {
		return claimRepository.findById(claimId).orElse(null);
	}

	public List<Claim> findByStatus(String status) {
		return claimRepository.findByStatus(status);
	} 
	
	public Claim saveClaim(Claim claim) {
		return claimRepository.save(claim);
	} 
	
	public List<Claim> findByCustomerId(Long customerId) {
		return claimRepository.findByCustomerId(customerId);
	} 
}
