package com.synex.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Claim {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String status;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate openDate;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate claimDate;
	private Long customerId;
	private Long policyId;
	private String reason;
	private String description;
	private String claimDoc;
	private Double amount;
	
	public Claim() {}

	public Claim(Long id, String status, LocalDate openDate, LocalDate claimDate, Long customerId, Long policyId,
			String reason, String description, String claimDoc, Double amount) {
		super();
		this.id = id;
		this.status = status;
		this.openDate = openDate;
		this.claimDate = claimDate;
		this.customerId = customerId;
		this.policyId = policyId;
		this.reason = reason;
		this.description = description;
		this.claimDoc = claimDoc;
		this.amount = amount;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public LocalDate getClaimDate() {
		return claimDate;
	}

	public void setClaimDate(LocalDate claimDate) {
		this.claimDate = claimDate;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public Long getPolicyId() {
		return policyId;
	}

	public void setPolicyId(Long policyId) {
		this.policyId = policyId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getClaimDoc() {
		return claimDoc;
	}

	public void setClaimDoc(String claimDoc) {
		this.claimDoc = claimDoc;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	
}
