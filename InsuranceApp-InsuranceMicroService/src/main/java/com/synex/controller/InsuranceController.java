package com.synex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.Insurance;
import com.synex.service.InsuranceService;

@RestController
public class InsuranceController {

	@Autowired InsuranceService insuranceService;
	
	@PostMapping("saveInsurance")
	public Insurance saveInsurance(@RequestBody Insurance insurance) {
		return insuranceService.save(insurance);
	}
	
	@GetMapping("findAllInsurance")
	public List<Insurance> findAllInsurance() {
		return insuranceService.findAll();
	} 
}
