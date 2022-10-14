package com.communityportal.dto;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.communityportal.services.UtilsService;

@Entity
@Table(name="threads")
public class Thread {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
    @JoinColumn(name="id_user", referencedColumnName = "id")
    private UserProfile user;
	
	private String content;
	
	@ManyToOne()
    @JoinColumn(name="reply_to", referencedColumnName = "id")
    private Thread thread;
	
	private String foto;
	
	@CreationTimestamp
	private Date created_at;
	 
    @UpdateTimestamp
    private Date updated_at;
    
    @OneToMany(mappedBy="thread", cascade = CascadeType.ALL)
	private Set<Thread> thread_reply;
    
    @OneToMany(mappedBy="thread")
	private Set<Like> like;
    
	public Thread(UserProfile user, String content, String foto) {
		super();
		this.user = user;
		this.content = content;
		this.foto = foto;
	}

	public Thread(UserProfile user, String content, Thread thread, String foto) {
		super();
		this.user = user;
		this.content = content;
		this.thread = thread;
		this.foto = foto;
	}

	public Thread() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getNumberOfLikes() {
		return like.size();
	}
	
	public int getNumberOfComments() {
		return thread_reply.size();
	}
	
	public String getDuration(String date) throws ParseException {
		Date now = new Date();
		Date createdDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		
		long differentOnMills = now.getTime() - createdDate.getTime();
		
		return UtilsService.toDuration(differentOnMills);
	}
	
	public boolean getIsLike(Long id) {
		boolean isLike = false;
				
		for (Like item : like) {
            if (item.getUser().getId().equals(id)) {
            	isLike = true;
            	break;
            } else {
            	isLike = false;
            }
        }
		
		return isLike;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Thread getThread() {
		return thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
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

	public Set<Thread> getThread_reply() {
		return thread_reply;
	}

	public void setThread_reply(Set<Thread> thread_reply) {
		this.thread_reply = thread_reply;
	}

	public Set<Like> getLike() {
		return like;
	}

	public void setLike(Set<Like> like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "Thread [id=" + id + ", content=" + content + ", foto=" + foto + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + ", thread_reply=" + thread_reply + ", like=" + like + "]";
	}
}
