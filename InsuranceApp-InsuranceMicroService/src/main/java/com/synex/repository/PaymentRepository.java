package com.synex.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

}
