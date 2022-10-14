package com.communityportal.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.communityportal.dto.UserProfile;
import com.communityportal.services.UserService;

@Controller
public class SearchUserController {
	
	@Autowired
	UserService userService;

	@GetMapping(value = "/search")
	public String search(Model model, HttpSession session) {
		Optional<UserProfile> users = (Optional<UserProfile>) session.getAttribute("users");
		Iterable<UserProfile> userProfile = userService.showAllUserProfiles();
		
		model.addAttribute("auth", users.get());
		model.addAttribute("users", userProfile);
		return "search-user/search-user";
	}
	
	@PostMapping(value = "/search")
	public String searchProcess(Model model, @RequestParam Map<String, Object> params, HttpSession session) {
		List<UserProfile> userProfile = userService.search(params.get("search").toString());
		Optional<UserProfile> users = (Optional<UserProfile>) session.getAttribute("users");
		String page_return = "search-user/search-user";
		
		if (params.get("type").toString().equals("search")) {
			page_return = "search-user/search-user";
		} else {
			page_return = "admin/admin";
		}
				
		model.addAttribute("auth", users.get());
		model.addAttribute("users", userProfile);
		return page_return;
	}
	
	@GetMapping(value = "/find-user")
	public String searchById(Model model, HttpSession session, @RequestParam Long id) {
		Optional<UserProfile> userProfile = userService.userProfileFindById((long) id);
		
		session.setAttribute("users_profile", userProfile);
		
		return "redirect:/profile";
	}
}
