package com.synex.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.synex.client.ClaimClient;
import com.synex.client.InsuranceClient;
import com.synex.domain.User;
import com.synex.service.UserService;

@Controller
public class FileUploadController {
	
	@Autowired UserService userService;
	@Autowired InsuranceClient insuranceClient;
	@Autowired ClaimClient claimClient;

	private static String UPLOAD_FOLDER = "src/main/resources/static/documents/";
	
	@PostMapping("/upload")
	public ModelAndView fileUpload(
			@RequestParam(value = "addressDoc", required = false) MultipartFile addressDoc, 
			@RequestParam(value = "govIdDoc", required = false) MultipartFile govIdDoc, 
			Principal principal) {
		ModelAndView mav = new ModelAndView("profile");
		
		User loggedUser = userService.findByUsername(principal.getName());
		System.out.println("test");
		if (!insuranceClient.findCustomerByUserId(loggedUser.getId()).isEmpty()) {
			Long customerId = insuranceClient.findCustomerByUserId(loggedUser.getId()).get("id").asLong();
			ArrayList policies = new ArrayList();
			insuranceClient.findPolicyByCustomerId(customerId).forEach(policy -> {
				policies.add(policy);
			});
			mav.addObject("policies", policies);
			
			ArrayList claims = new ArrayList();
			claimClient.findClaimByCustomerId(customerId).forEach(claim -> claims.add(claim));
			mav.addObject("claims", claims);	
			
			ArrayList approvedPolicies = new ArrayList();
			insuranceClient.findPolicyByCustomerId(customerId).forEach(policy -> {
				System.out.println(policy.get("status").asText());
				if (policy.get("status").asText().equals("APPROVED")) {
					approvedPolicies.add(approvedPolicies);
				}
			});
			mav.addObject("approvedPolicies", approvedPolicies);
			
			mav.addObject("customer", insuranceClient.findCustomerByUserId(loggedUser.getId()));
			
			if (addressDoc == null || addressDoc.isEmpty()) {
				System.out.println("proof of address empty");
				mav.addObject("message", "Please select a file and upload again");
				return mav;
			}
			if (govIdDoc == null || govIdDoc.isEmpty()) {
				System.out.println("proof of id empty");
				mav.addObject("message", "Please select a file and upload again");
				return mav;
			}
			
			try {
				//read and write the file to the selected path folder
				byte[] bytes = addressDoc.getBytes();
				Path path = Paths.get(UPLOAD_FOLDER + customerId + "_addressDoc_" + addressDoc.getOriginalFilename());
				Files.write(path, bytes);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			try {
				//read and write the file to the selected path folder
				byte[] bytes = govIdDoc.getBytes();
				Path path = Paths.get(UPLOAD_FOLDER + customerId + "_govIdDoc_" + govIdDoc.getOriginalFilename());
				Files.write(path, bytes);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.addObject("successMessage", "File(s) uploaded successfully");

			insuranceClient.addCustomerDocs(customerId, customerId+"_addressDoc_"+addressDoc.getOriginalFilename(), customerId+"_govIdDoc_"+govIdDoc.getOriginalFilename());
			
		}
		
		
		
		
		return mav;
	}
}
