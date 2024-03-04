package com.synex.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.ClaimClient;
import com.synex.client.InsuranceClient;
import com.synex.domain.User;
import com.synex.service.UserService;

@Controller
public class ClaimController {

	@Autowired ClaimClient claimClient;
	@Autowired InsuranceClient insuranceClient;
	@Autowired UserService userService;
	
	private static String UPLOAD_FOLDER = "src/main/resources/static/documents/";
	
	@GetMapping("newClaim")
	@Secured("USER")
	public ModelAndView newClaim(Principal principal) {
		ModelAndView mav = new ModelAndView("claimForm");
		User loggedUser = userService.findByUsername(principal.getName());
		if (!insuranceClient.findCustomerByUserId(loggedUser.getId()).isEmpty()) {
			Long customerId = insuranceClient.findCustomerByUserId(loggedUser.getId()).get("id").asLong();
			ArrayList policies = new ArrayList();
			insuranceClient.findPolicyByCustomerId(customerId).forEach(policy -> {
				policies.add(policy);
			});
			mav.addObject("policies", policies);
			mav.addObject("customer", insuranceClient.findCustomerByUserId(loggedUser.getId()));
		}
		
		return mav;
	}
	
	@PostMapping("saveClaim")
	public ModelAndView saveClaim(
			@RequestParam Long customerId, 
			@RequestParam(required = false) Long policyId,
			@RequestParam(required = false) String claimDate,
			@RequestParam(required = false) String reason,
			@RequestParam(required = false) String description,
			@RequestParam(required = false) Double amount,
			@RequestParam(required = false) MultipartFile claimDoc,
			Principal principal
			) {
		//return claimClient.saveClaim(jsonNode);
		System.out.println("saveClaim");
		System.out.println("customerId: " + customerId);
		ModelAndView mav = new ModelAndView("claimForm");
		
		User loggedUser = userService.findByUsername(principal.getName());
		Long userCustomerId = insuranceClient.findCustomerByUserId(loggedUser.getId()).get("id").asLong();
		ArrayList policies = new ArrayList();
		insuranceClient.findPolicyByCustomerId(userCustomerId).forEach(policy -> {
			policies.add(policy);
		});
		mav.addObject("policies", policies);
		mav.addObject("customer", insuranceClient.findCustomerByUserId(loggedUser.getId()));
		
		System.out.println("claimdate: " + claimDate);
		if (claimDate.isEmpty()) {
			mav.addObject("message", "Please enter claim date");
			return mav;
		}
		if (policyId == null) {
			mav.addObject("message", "Please select a policy");
			return mav;
		}
		
		if (amount == null) {
			mav.addObject("message", "Please enter claim amount");
			return mav;
		}
		
		if (reason.isEmpty()) {
			mav.addObject("message", "Please enter reason for claim");
			return mav;
		}
		
		if (description.isEmpty()) {
			mav.addObject("message", "Please enter details for your claim");
			return mav;
		}
		
		if (claimDoc == null || claimDoc.isEmpty()) {
			System.out.println("proof of claim empty");
			mav.addObject("message", "Please select a file and resubmit");
			return mav;
		}
		
		String filename = customerId + "_claimDoc_" + claimDate + "_" + claimDoc.getOriginalFilename();
		try {
			//read and write the file to the selected path folder
			byte[] bytes = claimDoc.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + filename);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		claimClient.saveClaim(customerId, policyId, claimDate, reason, description, amount, filename);
		
		mav.addObject("successMessage", "Claim filed successfully!");
		
		
		return mav;
	}
}
