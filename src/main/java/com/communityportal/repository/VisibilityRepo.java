package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Visibility;

public interface VisibilityRepo extends JpaRepository<Visibility, Long> {

}
