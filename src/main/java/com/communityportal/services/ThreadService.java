package com.communityportal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.communityportal.repository.LikeRepo;
import com.communityportal.repository.ThreadRepo;
import com.communityportal.dto.Like;
import com.communityportal.dto.Thread;

@Service
public class ThreadService {
	
	@Autowired
	private ThreadRepo threadRepo;
	
	@Autowired
	private LikeRepo likeRepo;
	
	public Optional<Thread> findById(Long id) {
		return threadRepo.findById(id);
	}
	
	public List<Thread> findAllThread() {
		return threadRepo.findAll();
	}
	
	public void saveThread(Thread thread) {
		threadRepo.save(thread);
	}
	
	/**
     * Service For Likes Repository
     * to Manage all data on Likes Table in Database
     */
	public void saveLike(Like like) {
		likeRepo.save(like);
	}
}
