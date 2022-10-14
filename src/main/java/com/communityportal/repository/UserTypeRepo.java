package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.UserType;

public interface UserTypeRepo extends JpaRepository<UserType, Long>{

}
