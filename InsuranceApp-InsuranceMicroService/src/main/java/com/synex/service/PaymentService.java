package com.synex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synex.domain.Payment;
import com.synex.repository.PaymentRepository;

@Service
public class PaymentService {

	@Autowired PaymentRepository paymentRepository;
	
	public Payment savePayment(Payment payment) {
		return paymentRepository.save(payment);
	}
}
