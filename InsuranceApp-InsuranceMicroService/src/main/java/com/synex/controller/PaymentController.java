package com.synex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.synex.domain.Payment;
import com.synex.service.PaymentService;

@RestController
public class PaymentController {

	@Autowired PaymentService paymentService;
	
	@PostMapping("savePayment")
	public Payment savePayment(@RequestBody Payment payment) {
		return paymentService.savePayment(payment);
	}
}
