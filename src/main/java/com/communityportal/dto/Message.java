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

@Entity
@Table(name="message")
public class Message {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="user_from", referencedColumnName = "id")
    private UserProfile user_from;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="user_to", referencedColumnName = "id")
    private UserProfile user_to;
	
	private String message;
	
	@CreationTimestamp
	private Date created_at;

	public Message(UserProfile user_from, UserProfile user_to, String message) {
		super();
		this.user_from = user_from;
		this.user_to = user_to;
		this.message = message;
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserProfile getUser_from() {
		return user_from;
	}

	public void setUser_from(UserProfile user_from) {
		this.user_from = user_from;
	}

	public UserProfile getUser_to() {
		return user_to;
	}

	public void setUser_to(UserProfile user_to) {
		this.user_to = user_to;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
