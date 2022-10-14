package com.communityportal.dto;

import java.sql.Date;

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

@Entity
@Table(name="user_educations")
public class UserEducation {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="id_education", referencedColumnName = "id")
    private Education education;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="id_degree", referencedColumnName = "id")
    private Degree degree;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="id_field_study", referencedColumnName = "id")
    private FieldStudy field_study;
	
	private boolean is_graduated;
	private Date start_date;
	private Date last_date;
	private String description;
	
	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;
}
