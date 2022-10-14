package com.communityportal.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.communityportal.services.UtilsService;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="jobs_opportunities")
public class JobOpportunities {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
    @JoinColumn(name="id_employment_type", referencedColumnName = "id")
    private EmploymentType employment_type;
	
	@ManyToOne()
    @JoinColumn(name="id_company", referencedColumnName = "id")
    private Company company;
	
	@ManyToOne()
    @JoinColumn(name="id_role", referencedColumnName = "id")
    private Role role;

	@ManyToOne()
    @JoinColumn(name="id_work_level", referencedColumnName = "id")
    private WorkLevel work_level;
	
	@ManyToOne()
	@JsonIgnore
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	private String location;
	private String workExperience;
	
	@Lob
	@Column(length=2000)
	private String description;
	private int salary;
	
	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;
    
    @OneToMany(mappedBy="jobOpportunities", cascade = CascadeType.ALL)
    @JsonIgnore
	private Set<JobApplicant> jobApplicant;

	public JobOpportunities() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JobOpportunities(EmploymentType employment_type, Company company, Role role, WorkLevel work_level,
			UserProfile user, String location, String description, int salary, String workExperience) {
		super();
		this.employment_type = employment_type;
		this.company = company;
		this.role = role;
		this.work_level = work_level;
		this.user = user;
		this.location = location;
		this.description = description;
		this.salary = salary;
		this.workExperience = workExperience;
	}

	public String getDuration(String date) throws ParseException {
		Date now = new Date();
		Date createdDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		
		long differentOnMills = now.getTime() - createdDate.getTime();
		
		return UtilsService.toDuration(differentOnMills);
	}
	
	public int getNumberOfApplicants() {
		return jobApplicant.size();
	}
	
	public boolean getIsApply(Long id) {
		boolean isApply = false;
				
		System.out.println(id);
		for (JobApplicant item : jobApplicant) {
            if (item.getUser().getId().equals(id)) {
            	isApply = true;
            	break;
            } else {
            	isApply = false;
            }
        }
		
		return isApply;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public EmploymentType getEmployment_type() {
		return employment_type;
	}

	public void setEmployment_type(EmploymentType employment_type) {
		this.employment_type = employment_type;
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

	public WorkLevel getWork_level() {
		return work_level;
	}

	public void setWork_level(WorkLevel work_level) {
		this.work_level = work_level;
	}

	public UserProfile getUser() {
		return user;
	}

	public void setUser(UserProfile user) {
		this.user = user;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
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

	public Set<JobApplicant> getJobApplicant() {
		return jobApplicant;
	}

	public void setJobApplicant(Set<JobApplicant> jobApplicant) {
		this.jobApplicant = jobApplicant;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	@Override
	public String toString() {
		return "JobOpportunities [id=" + id + ", employment_type=" + employment_type + ", company=" + company
				+ ", role=" + role + ", work_level=" + work_level + ", location=" + location + ", workExperience="
				+ workExperience + ", description=" + description + ", salary=" + salary + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + "]";
	}
}
