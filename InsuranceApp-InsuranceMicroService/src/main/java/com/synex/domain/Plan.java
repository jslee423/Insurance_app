package com.synex.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Plan {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String planName;
	private String planType;
	private String description;
	private Double premium;
	private Double deductible;
	private Double pcpVisitPrice;
	private Double specialistPrice;
	private Double prescriptionPrice;
	@ManyToOne
	@JsonBackReference
	private Insurance insurance;
	
	public Plan() {}

	public Plan(Long id, String planName, String planType, String description, Double premium, Double deductible, Double pcpVisitPrice,
			Double specialistPrice, Double prescriptionPrice, Insurance insurance) {
		super();
		this.id = id;
		this.planName = planName;
		this.planType = planType;
		this.description = description;
		this.premium = premium;
		this.deductible = deductible;
		this.pcpVisitPrice = pcpVisitPrice;
		this.specialistPrice = specialistPrice;
		this.prescriptionPrice = prescriptionPrice;
		this.insurance = insurance;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPremium() {
		return premium;
	}

	public void setPremium(Double premium) {
		this.premium = premium;
	}

	public Double getDeductible() {
		return deductible;
	}

	public void setDeductible(Double deductible) {
		this.deductible = deductible;
	}

	public Double getPcpVisitPrice() {
		return pcpVisitPrice;
	}

	public void setPcpVisitPrice(Double pcpVisitPrice) {
		this.pcpVisitPrice = pcpVisitPrice;
	}

	public Double getSpecialistPrice() {
		return specialistPrice;
	}

	public void setSpecialistPrice(Double specialistPrice) {
		this.specialistPrice = specialistPrice;
	}

	public Double getPrescriptionPrice() {
		return prescriptionPrice;
	}

	public void setPrescriptionPrice(Double prescriptionPrice) {
		this.prescriptionPrice = prescriptionPrice;
	}

	public Insurance getInsurance() {
		return insurance;
	}

	public void setInsurance(Insurance insurance) {
		this.insurance = insurance;
	}

	
	
	
}
