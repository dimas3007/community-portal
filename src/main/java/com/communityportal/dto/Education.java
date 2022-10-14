package com.communityportal.dto;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="educations")
public class Education {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String address;
	private String description;
	private String profile_foto;
	private String background_foto;
	
	@OneToMany(mappedBy="education")
	private Set<UserEducation> userEducation;
}
