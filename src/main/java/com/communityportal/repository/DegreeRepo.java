package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Degree;

public interface DegreeRepo extends JpaRepository<Degree, Long> {

}
