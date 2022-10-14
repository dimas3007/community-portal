package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.EmploymentType;

public interface EmploymentTypeRepo extends JpaRepository<EmploymentType, Long> {

}
