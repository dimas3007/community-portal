package com.communityportal.dto;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Transactional
@Table(name="user_profiles")
public class UserProfile {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(length=50, nullable=false)
	private String first_name;
	
	@Column(length=50, nullable=false)
	private String last_name;
	
	private String gender;
	
	@Column(length=512)
	private String bio;
	
	@Column(length=15, nullable=false)
	private String phone;
	
	@Column(length=512, nullable=false)
	private String address;
	
	private String profile_foto;
	private String background_foto;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user", referencedColumnName = "id")
	private User id_user;
	
	@ManyToOne()
    @JoinColumn(name="id_role", referencedColumnName = "id")
    private Role role;
	
	@ManyToOne()
    @JoinColumn(name="id_user_type", referencedColumnName = "id")
    private UserType user_type;
	
	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;
	
	@OneToMany(mappedBy="user")
	@JsonIgnore
	private Set<JobOpportunities> jobOpportunities;
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL,          
		     orphanRemoval = true)
	private Set<JobApplicant> jobApplicant;
	
	@OneToMany(mappedBy="user_to")
	private Set<Message> message;
	
	@OneToMany(mappedBy="user_from")
	private Set<Message> messages;
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL)
	private Set<Thread> thread;
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL)
	private Set<Like> like;
	
	@OneToMany(mappedBy="user")
	private Set<UserEducation> userEducation;
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL)
	private Set<UserExperience> userExperience;
	
	public UserProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserProfile(String first_name, String last_name, String gender, String bio, String phone,
			User id_user, UserType user_type, Role role, String address) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.bio = bio;
		this.phone = phone;
		this.id_user = id_user;
		this.user_type = user_type;
		this.role = role;
		this.address = address;
	}

	public UserProfile(String first_name, String last_name, String gender, String phone, User id_user, Role role, UserType user_type, String address) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.phone = phone;
		this.id_user = id_user;
		this.user_type = user_type;
		this.role = role;
		this.address = address;
		
		System.out.println("Di COnstructor");
		System.out.println(this.role);
		System.out.println(role);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public User getId_user() {
		return id_user;
	}

	public void setId_user(User id_user) {
		this.id_user = id_user;
	}

	public UserType getUser_type() {
		return user_type;
	}

	public void setUser_type(UserType user_type) {
		this.user_type = user_type;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "UserProfile [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", gender="
				+ gender + ", bio=" + bio + ", phone=" + phone + ", id_user=" + id_user + ", user_type=" + user_type
				+ ", role=" + role + ", address=" + address + ", birth_date=" + "]";
	}
}
