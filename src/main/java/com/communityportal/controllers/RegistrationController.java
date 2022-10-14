package com.communityportal.controllers;


import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.communityportal.dto.Role;
import com.communityportal.dto.User;
import com.communityportal.dto.UserProfile;
import com.communityportal.dto.UserType;
import com.communityportal.services.AdditionalService;
import com.communityportal.services.UserService;
import com.communityportal.utils.Validate;

@Controller
public class RegistrationController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdditionalService additionalService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping(value = "/register")
	public String register() {
		return "register/register";
	}
	
	@PostMapping(value = "/register")
	public String registerProcess(Model model, @RequestParam Map<String, Object> params, HttpSession session) {		
				
		String page = params.get("page").toString();
		
		String page_return = "register/register";
		String message = null;
		
		Validate v = new Validate();
		switch(page) {
			case "register":
				String username = params.get("username").toString();
				String password = params.get("password").toString();
				String email = params.get("email").toString();
				
				password = passwordEncoder.encode(password);
				
				boolean isEmailExist = false;
				List<User> dataByEmail = userService.findByEmail(email);
								
				if (dataByEmail == null || dataByEmail.isEmpty()) {
					isEmailExist = false;
				} else {
					isEmailExist = true;
				}
								
				if (v.isEmptyString(email) || v.isEmptyString(password) || v.isEmptyString(username)) {
					message="Please check your input, empty input data!";			
				} else if (!v.validEmailFormat(email)) {
					message="Please check your email, Wrong email format!";			
				} else if (isEmailExist) {
					message="Please check your email, Email is already in use!";			
				} else {
					User user = new User(email, username, password);
					userService.addUser(user);
									
					session.setAttribute("registerAccount", user);
										
					page_return = "register/register-additional";
				}
				break;
			case "additional":
				page_return = "register/register-additional";
				
				String first_name = params.get("first_name").toString();
				String last_name = params.get("last_name").toString();
				String phone = params.get("phone").toString();
				String gender = params.get("gender").toString();
				String address = params.get("address").toString();
				
				if (v.isEmptyString(first_name) || v.isEmptyString(last_name) || v.isEmptyString(phone) || v.isEmptyString(gender) || v.isEmptyString(address)) {
					message="Please check your input, empty input data!";			
				} else {
					session.setAttribute("first_name", first_name);
					session.setAttribute("last_name", last_name);
					session.setAttribute("phone", phone);
					session.setAttribute("gender", gender);
					session.setAttribute("address", address);
					
					Iterable<Role> roles = additionalService.getAllRoles();
					
					model.addAttribute("roles", roles);
					
					page_return = "register/register-field";
				}
				break;
			case "field":
				page_return = "register/register-field";
				
				Long sRole = (long) Integer.parseInt(params.get("role").toString());
				String sFirstName = session.getAttribute("first_name").toString();
				String sLastName = session.getAttribute("last_name").toString();
				String sPhone = session.getAttribute("phone").toString();
				String sGender = session.getAttribute("gender").toString();
				String sAddress = session.getAttribute("address").toString();
				
				User userSession = (User) session.getAttribute("registerAccount");
				User user = userService.findById(userSession.getId()).get();
				
				Optional<UserType> userType = additionalService.findUserTypeById((long) 1);
				Optional<Role> role = additionalService.findRoleById(sRole);
				
				if (v.isEmptyString(params.get("role").toString())) {
					message="Please check your choice, not choose option!";			
				} else {
					UserProfile userProfile = new UserProfile(sFirstName, sLastName, sGender, sPhone, user, role.get(), userType.get(), sAddress);
					userService.addUserProfile(userProfile);
					
					model.addAttribute("for", "register");
					page_return = "thank-you/thank-you";
				}
			
				break;
			default:
		}
		
		model.addAttribute("message", message);
		return page_return;
	}
}
