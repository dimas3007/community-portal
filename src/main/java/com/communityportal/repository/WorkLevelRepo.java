package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.WorkLevel;

public interface WorkLevelRepo extends JpaRepository<WorkLevel, Long> {

}
