package com.communityportal.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.communityportal.services.ThreadService;
import com.communityportal.services.UserService;
import com.communityportal.services.UtilsService;
import com.communityportal.utils.Validate;
import com.communityportal.dto.Like;
import com.communityportal.dto.Thread;
import com.communityportal.dto.UserProfile;

@Controller
public class ThreadController {
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	UtilsService fileService;
	
	@Autowired
	UserService userService;
	
	private boolean isValid = true;
	private String pageReturn = "redirect:/thread";
	
	@GetMapping(value="/thread")
	public String thread(Model model, HttpSession session) {
		List<Thread> thread = threadService.findAllThread();

		pageReturn = "redirect:/thread";
		if (!isValid) {
			model.addAttribute("message", "Please check your thread, empty thread data!");	
		}
		
		model.addAttribute("threads", thread);
		return "thread/thread";
	}
	
	@GetMapping(value="/thread-detail")
	public String threadDetail(Model model, @RequestParam Long id) {
		Thread thread = threadService.findById(id).get();

		pageReturn = "redirect:/thread-detail?id=" + id;
		if (!isValid) {
			model.addAttribute("message", "Please check your thread Comment, empty thread Comment data!");	
		}
		
		model.addAttribute("thread", thread);
		
		return "thread/thread-detail";
	}
	
	@RequestMapping(path = "save-thread", method = RequestMethod.POST)
	public String saveThread(Model model, HttpSession session, @RequestParam Map<String, Object> params, @RequestParam(required=false) MultipartFile img, @RequestParam(required=false) MultipartFile imgComment) {
		UserProfile user = (UserProfile) session.getAttribute("user");
		UserProfile users = userService.userProfileFindById(user.getId()).get();
		
		String content = params.get("content").toString().toString();
				
		Validate v = new Validate();
		if (v.isEmptyString(content)) {
			isValid = false;
		} else {
			Thread thread = new Thread();
			
			if (params.get("id").toString().isEmpty()) {
				thread = new Thread(users, content, img.getOriginalFilename());
				fileService.addFile(img, "/assets/img/thread/");
			} else{
				Long id = (long) Integer.parseInt(params.get("id").toString());
				
				Thread threadComment = threadService.findById(id).get();
				
				thread = new Thread(users, content, threadComment, imgComment.getOriginalFilename());
				fileService.addFile(imgComment, "/assets/img/thread/");
			}
			
			threadService.saveThread(thread);	
			isValid = true;
		}
		
		
		return pageReturn;
	}
	
	/**
     * Controller For Like
     * to Manage all data on Likes in Database
     */
	@PostMapping(value="/thread-like")
	public String saveLike(Model model, HttpSession session, @RequestParam Long id) {
		UserProfile user = (UserProfile) session.getAttribute("user");
		UserProfile users = userService.userProfileFindById(user.getId()).get();
		
		Thread thread = threadService.findById(id).get();
		
		Like like = new Like(users, thread);
		
		threadService.saveLike(like);
		
		return "redirect:/thread";
	}
}
