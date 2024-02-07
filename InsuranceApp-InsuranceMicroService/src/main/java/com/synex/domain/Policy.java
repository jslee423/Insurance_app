package com.synex.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Policy {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	private Customer customer;
	private String status;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate openDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate endDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate renewDate;
	private Plan plan;
	private Double price;
}
