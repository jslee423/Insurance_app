package com.synex.domain;

import jakarta.persistence.Embeddable;

@Embeddable
public class Address {

	private String AddressLine1;
	private String AddressLine2;
	private String city;
	private String state;
	private String country;
	private Long zipCode;
	
	public Address() {}

	public Address(String addressLine1, String addressLine2, String city, String state, String country, Long zipCode) {
		super();
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipCode = zipCode;
	}

	public String getAddressLine1() {
		return AddressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return AddressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Long getZipCode() {
		return zipCode;
	}

	public void setZipCode(Long zipCode) {
		this.zipCode = zipCode;
	}
	
	
}
