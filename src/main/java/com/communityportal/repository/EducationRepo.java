package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Education;

public interface EducationRepo extends JpaRepository<Education, Long> {

}
