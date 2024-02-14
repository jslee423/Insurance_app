package com.synex.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Plan;

public interface PlanRepository extends JpaRepository<Plan, Long> {

	public List<Plan> findByInsuranceId(Long insuranceId);
	
	public List<Plan> findByPlanType(String planType);
}
