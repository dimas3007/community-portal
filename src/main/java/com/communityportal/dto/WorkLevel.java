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
@Table(name="work_level")
public class WorkLevel {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@OneToMany(mappedBy="work_level")
	@JsonIgnore
	private Set<JobOpportunities> jobOpportunities;
	
	private String name;
	private String description;
	
	public WorkLevel(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
	
	public WorkLevel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Set<JobOpportunities> getJobOpportunities() {
		return jobOpportunities;
	}
	public void setJobOpportunities(Set<JobOpportunities> jobOpportunities) {
		this.jobOpportunities = jobOpportunities;
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
	
	
}
