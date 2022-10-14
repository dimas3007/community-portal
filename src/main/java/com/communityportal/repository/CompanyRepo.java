package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Company;

public interface CompanyRepo extends JpaRepository<Company, Long> {

}
