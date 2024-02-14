package com.synex.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synex.domain.Insurance;

public interface InsuranceRepository extends JpaRepository<Insurance, Long> {

}
