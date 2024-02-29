package com.synex.domain;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

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
	@ManyToOne
	private Plan plan;
	private Double price;
	@OneToMany
	private List<Payment> payments;
	
	public Policy() {}

	public Policy(Long id, Customer customer, String status, LocalDate openDate, LocalDate endDate, LocalDate renewDate,
			Plan plan, Double price) {
		super();
		this.id = id;
		this.customer = customer;
		this.status = status;
		this.openDate = openDate;
		this.endDate = endDate;
		this.renewDate = renewDate;
		this.plan = plan;
		this.price = price;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDate getOpenDate() {
		return openDate;
	}

	public void setOpenDate(LocalDate openDate) {
		this.openDate = openDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public LocalDate getRenewDate() {
		return renewDate;
	}

	public void setRenewDate(LocalDate renewDate) {
		this.renewDate = renewDate;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
}
