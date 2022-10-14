package com.communityportal.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.communityportal.dto.User;
import com.communityportal.services.UserService;
import com.communityportal.utils.Validate;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping(value = "/forgot-password")
	public String forgotPassword() {
		return "forgot-password/forgot-password";
	}
	
	@PostMapping(value = "/forgot-password")
	public String forgotPasswordProcess(@RequestParam String email, Model model, HttpSession session) {
		String message = null;
		String page_return = "forgot-password/forgot-password";
		
		List<User> user = userService.findByEmail(email);
				
		Validate v = new Validate();
		if (v.isEmptyString(email)) {
			message="Please check your input, empty input data!";			
		} else if (!v.validEmailFormat(email)) {
			message="Please check your email, Wrong email format!";			
		} else if (!user.isEmpty()) {	
			session.setAttribute("user", user);
			page_return = "forgot-password/forgot-password-new";
		} else {
			message="Please check your email, account doesn't exist!";
		}
		
		model.addAttribute("message", message);
		return page_return;
	}
	
	@PostMapping(value = "/forgot-password-new")
	public String forgotPasswordNewProcess(@RequestParam Map<String, Object> params, Model model, HttpSession session) {
		String password = params.get("password").toString();
		String rpassword = params.get("rpassword").toString();
		
		String message = null;
		String page_return = "forgot-password/forgot-password-new";
				
		Validate v = new Validate();
		if (v.isEmptyString(password) || v.isEmptyString(rpassword)) {
			message="Please check your input, empty input data!";			
		} else if (!password.equals(rpassword)) {
			message="Please check your repeat password, not match!";			
		} else {
			List<User> dataUser = (List<User>) session.getAttribute("user");
			dataUser.get(0).setPassword(passwordEncoder.encode(password));
			
			userService.updatePassword(dataUser.get(0));
			
			model.addAttribute("for", "forgot");
			page_return = "redirect:/login";
		}
		
		model.addAttribute("message", message);
		return page_return;
	}
	
}
