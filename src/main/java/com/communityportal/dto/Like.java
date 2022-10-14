package com.communityportal.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="likes")
public class Like {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	@ManyToOne()
    @JoinColumn(name="id_thread", referencedColumnName = "id")
    private Thread thread;
	
	private boolean is_like;

	public Like(UserProfile user, Thread thread) {
		super();
		this.user = user;
		this.thread = thread;
	}

	public Like() {
		super();
		// TODO Auto-generated constructor stub
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

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	public boolean isIs_like() {
		return is_like;
	}

	public void setIs_like(boolean is_like) {
		this.is_like = is_like;
	}
}
