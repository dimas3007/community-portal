package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Thread;

public interface ThreadRepo extends JpaRepository<Thread, Long> {

}
