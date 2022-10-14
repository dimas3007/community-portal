package com.communityportal.dto;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="jobs_applicants")
public class JobApplicant {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
	@JsonIgnore
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	@ManyToOne()
    @JoinColumn(name="id_job_opportunity", referencedColumnName = "id")
    private JobOpportunities jobOpportunities;
	
	private int expected_salary;
	private String applicant;
	private String status;

	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;

	public JobApplicant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobApplicant(UserProfile user, JobOpportunities jobOpportunities, int expected_salary, String applicant) {
		super();
		this.user = user;
		this.jobOpportunities = jobOpportunities;
		this.expected_salary = expected_salary;
		this.applicant = applicant;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserProfile getUser() {
		return user;
	}

	public void setUser(UserProfile user) {
		this.user = user;
	}

	public JobOpportunities getJobOpportunities() {
		return jobOpportunities;
	}

	public void setJobOpportunities(JobOpportunities jobOpportunities) {
		this.jobOpportunities = jobOpportunities;
	}

	public int getExpected_salary() {
		return expected_salary;
	}

	public void setExpected_salary(int expected_salary) {
		this.expected_salary = expected_salary;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "JobApplicant [id=" + id + ", jobOpportunities=" + jobOpportunities + ", expected_salary="
				+ expected_salary + ", applicant=" + applicant + ", created_at=" + created_at + ", updated_at="
				+ updated_at + "]";
	}
}
