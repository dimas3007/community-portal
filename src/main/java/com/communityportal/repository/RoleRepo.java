package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Role;

public interface RoleRepo extends JpaRepository<Role, Long> {

}
