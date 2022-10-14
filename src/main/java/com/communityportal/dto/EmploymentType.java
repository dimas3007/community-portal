package com.communityportal.dto;


import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="employment_types")
public class EmploymentType {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String description;
	
	@OneToMany(mappedBy="employment_type")
	@JsonIgnore
	private Set<JobOpportunities> jobOpportunities;
	 
	@OneToMany(mappedBy="employmentType")
	private Set<UserExperience> userExperience;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<JobOpportunities> getJobOpportunities() {
		return jobOpportunities;
	}

	public void setJobOpportunities(Set<JobOpportunities> jobOpportunities) {
		this.jobOpportunities = jobOpportunities;
	}

	@Override
	public String toString() {
		return "EmploymentType [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	 
	 
}
