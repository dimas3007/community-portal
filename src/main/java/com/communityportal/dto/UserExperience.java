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

@Entity
@Table(name="user_experiences")
public class UserExperience {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	@ManyToOne()
    @JoinColumn(name="id_company", referencedColumnName = "id")
    private Company company;
	
	@ManyToOne()
    @JoinColumn(name="id_role", referencedColumnName = "id")
    private Role role;
	
	@ManyToOne()
    @JoinColumn(name="id_employment_type", referencedColumnName = "id")
    private EmploymentType employmentType;
	
	private boolean is_currently_working;
	private Date start_date;
	private Date last_date;
	private String description;
	
	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;
    
	public UserExperience() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserExperience(UserProfile user, Company company, Role role, EmploymentType employmentType,
			boolean is_currently_working, Date start_date, Date last_date, String description) {
		super();
		this.user = user;
		this.company = company;
		this.role = role;
		this.employmentType = employmentType;
		this.is_currently_working = is_currently_working;
		this.start_date = start_date;
		this.last_date = last_date;
		this.description = description;
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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public EmploymentType getEmploymentType() {
		return employmentType;
	}

	public void setEmploymentType(EmploymentType employmentType) {
		this.employmentType = employmentType;
	}

	public boolean isIs_currently_working() {
		return is_currently_working;
	}

	public void setIs_currently_working(boolean is_currently_working) {
		this.is_currently_working = is_currently_working;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	@Override
	public String toString() {
		return "UserExperience [id=" + id + ", is_currently_working=" + is_currently_working + ", start_date="
				+ start_date + ", last_date=" + last_date + ", description=" + description + ", created_at="
				+ created_at + ", updated_at=" + updated_at + "]";
	}
    
    
}
