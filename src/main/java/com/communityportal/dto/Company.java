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
@Table(name="companys")
public class Company {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	 @OneToMany(mappedBy="company")
	 @JsonIgnore
	 private Set<JobOpportunities> jobOpportunities;
	
	private String name;
	private String address;
	private String description;
	private String profile_foto;
	private String background_foto;
	
	@OneToMany(mappedBy="company")
	@JsonIgnore
	private Set<UserExperience> userExperience;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProfile_foto() {
		return profile_foto;
	}

	public void setProfile_foto(String profile_foto) {
		this.profile_foto = profile_foto;
	}

	public String getBackground_foto() {
		return background_foto;
	}

	public void setBackground_foto(String background_foto) {
		this.background_foto = background_foto;
	}

	public Set<UserExperience> getUserExperience() {
		return userExperience;
	}

	public void setUserExperience(Set<UserExperience> userExperience) {
		this.userExperience = userExperience;
	}
	
	
}
