package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.UserEducation;

public interface UserEducationRepo extends JpaRepository<UserEducation, Long> {

}
