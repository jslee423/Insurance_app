package com.synex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Insurance;
import com.synex.repository.InsuranceRepository;

@Service
public class InsuranceService {

	@Autowired InsuranceRepository insuranceRepository;
	
	public Insurance save(Insurance insurance) {
		return insuranceRepository.save(insurance);
	} 
	
	public List<Insurance> findAll() {
		return insuranceRepository.findAll();
	}
}
