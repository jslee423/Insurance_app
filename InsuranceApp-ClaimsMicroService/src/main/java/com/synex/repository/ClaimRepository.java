package com.synex.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Claim;

public interface ClaimRepository extends JpaRepository<Claim, Long> {

	public List<Claim> findByCustomerId(Long customerId);
	
	public List<Claim> findByStatus(String status);
}
