package com.communityportal.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bulk_emails")
public class BulkEmail {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	private String subject;

	private String content;
	private String email_from;
	private String email_to;
	
	public BulkEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BulkEmail(String subject, String content, String email_from, String email_to) {
		super();
		this.subject = subject;
		this.content = content;
		this.email_from = email_from;
		this.email_to = email_to;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail_from() {
		return email_from;
	}

	public void setEmail_from(String email_from) {
		this.email_from = email_from;
	}

	public String getEmail_to() {
		return email_to;
	}

	public void setEmail_to(String email_to) {
		this.email_to = email_to;
	}
}
