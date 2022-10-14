package com.communityportal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.communityportal.dto.JobApplicant;
import com.communityportal.dto.JobOpportunities;
import com.communityportal.repository.JobApplicantRepo;
import com.communityportal.repository.JobOpportunitiesRepo;

@Service
public class JobService {

	@Autowired
	private JobOpportunitiesRepo jobOpportunitiesRepo;
	
	@Autowired
	private JobApplicantRepo jobApplicantRepo;
	
	 /**
     * Service For Job Opportunities Repository
     * to Manage all data on job_opportunities Table in Database
     */
	public List<JobOpportunities> showAllJobOpportunities() {
		return jobOpportunitiesRepo.findAll();
	}
	
	public Optional<JobOpportunities> findByIdJobOpportunities(Long id) {
		return jobOpportunitiesRepo.findById(id);
	}
	
	public void saveJob(JobOpportunities jobOpportunities) {
		jobOpportunitiesRepo.save(jobOpportunities);
	}
	
	public void deleteJob(JobOpportunities jobOpportunities) {
		jobOpportunitiesRepo.delete(jobOpportunities);;
	}
	
	 /**
     * Service For Job Applicants Repository
     * to Manage all data on job_applicants Table in Database
     */
	public List<JobApplicant> showAllJobApplicants() {
		return jobApplicantRepo.findAll();
	}
	
	public Optional<JobApplicant> findByIdJobApplicant(Long id) {
		return jobApplicantRepo.findById(id);
	}
	
	public List<JobApplicant> showAllJobApplicantsByIdJobOpportunity(Long id) {
		return jobApplicantRepo.findByIdJobOpportunity(id);
	}
	
	public List<JobApplicant> showAllJobApplicantsByIdUser(Long id) {
		return jobApplicantRepo.findByIdUser(id);
	}
	
	public void saveJobApplicant(JobApplicant jobApplicant) {
		jobApplicantRepo.save(jobApplicant);
	}
}
