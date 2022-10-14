package com.communityportal.dto;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="user_type")
public class UserType {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String description;
	
	@OneToMany(mappedBy="user_type")
	private Set<UserProfile> userProfile;

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

	public Set<UserProfile> getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(Set<UserProfile> userProfile) {
		this.userProfile = userProfile;
	}

	@Override
	public String toString() {
		return "UserType [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
}
