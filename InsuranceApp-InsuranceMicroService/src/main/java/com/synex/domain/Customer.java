package com.synex.domain;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String firstName;
	private String lastName;
	private String email;
	private LocalDate dob;
	@Enumerated(EnumType.STRING)
	private Gender gender;
	private String phoneNumber;
	@Embedded
	private Address address;
	private String govIdDoc;
	private String addressDoc;
	private Long userId;
	@OneToMany
	private List<Policy> policies;

	
	public Customer() {}

	public Customer(Long id, String firstName, String lastName, String email, LocalDate dob, Gender gender,
			String phoneNumber, Address address, String govIdDoc, String addressDoc, Long userId,
			List<Policy> policies) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dob = dob;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.govIdDoc = govIdDoc;
		this.addressDoc = addressDoc;
		this.userId = userId;
		this.policies = policies;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public Address getAddress() {
		return address;
	}


	public void setAddress(Address address) {
		this.address = address;
	}


	public String getGovIdDoc() {
		return govIdDoc;
	}


	public void setGovIdDoc(String govIdDoc) {
		this.govIdDoc = govIdDoc;
	}


	public String getAddressDoc() {
		return addressDoc;
	}


	public void setAddressDoc(String addressDoc) {
		this.addressDoc = addressDoc;
	}


	public Long getUserId() {
		return userId;
	}


	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public List<Policy> getPolicies() {
		return policies;
	}


	public void setPolicies(List<Policy> policies) {
		this.policies = policies;
	}
	
	
	
	
}
