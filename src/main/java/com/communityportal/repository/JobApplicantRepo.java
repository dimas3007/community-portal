package com.communityportal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.communityportal.dto.JobApplicant;

public interface JobApplicantRepo extends JpaRepository<JobApplicant, Long>{
	@Query(value = "SELECT * FROM jobs_applicants WHERE id_user = ?1", nativeQuery = true)
	List<JobApplicant> findByIdUser(Long id);
	
	@Query(value = "SELECT * FROM jobs_applicants WHERE id_job_opportunity = ?1", nativeQuery = true)
	List<JobApplicant> findByIdJobOpportunity(Long id);
}
