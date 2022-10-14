package com.communityportal.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.communityportal.dto.Company;
import com.communityportal.dto.EmploymentType;
import com.communityportal.dto.Role;
import com.communityportal.dto.UserExperience;
import com.communityportal.dto.UserProfile;
import com.communityportal.dto.WorkLevel;
import com.communityportal.services.AdditionalService;
import com.communityportal.services.UtilsService;
import com.communityportal.utils.Validate;
import com.communityportal.services.UserService;

@Controller
public class ProfileController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdditionalService additionalService;
	
	@Autowired
	UtilsService fileService;
	
	private String message = null;
	
	@GetMapping(value="/profile")
	public String profile(HttpSession session, Model model) {
		Optional<UserProfile> users = (Optional<UserProfile>) session.getAttribute("users");
		Optional<UserProfile> uprof = (Optional<UserProfile>) session.getAttribute("users_profile");
		List<UserExperience> userExperience = userService.findUserExperienceByIdUser(uprof.get().getId());
				
		model.addAttribute("auth", users.get());
		model.addAttribute("uprofile", uprof.get());
		model.addAttribute("experiences", userExperience);
		
		return "profile/profile";
	}
	
	@GetMapping(value="/profile-update")
	public String updateProfile(Model model, HttpSession session, @RequestParam(defaultValue = "user") String from) {	
		Optional<UserProfile> users = (Optional<UserProfile>) session.getAttribute("users");
		
		if(from.toString().equals("admin")) {
			users = (Optional<UserProfile>) session.getAttribute("users_from_admin");
		}
		
		Iterable<Role> roles = additionalService.getAllRoles();
		model.addAttribute("auth", users.get());
		model.addAttribute("from", from.toString());
		
		model.addAttribute("roles", roles);
		
		model.addAttribute("message", message);
		return "profile/profile-update";
	}
	
	@RequestMapping(path = "profile-update", method = RequestMethod.POST)
	public String updateProfileProcess(Model model, HttpSession session, @RequestParam Map<String, Object> params, @RequestParam("profile") MultipartFile profile, @RequestParam("background") MultipartFile bg) {
		Optional<UserProfile> users = null;
		
		String page_return = null;
		
		Validate v = new Validate();
		if (v.isEmptyString(params.get("bio").toString()) || v.isEmptyString(params.get("first_name").toString()) || v.isEmptyString(params.get("last_name").toString())
				|| v.isEmptyString(params.get("gender").toString()) || v.isEmptyString(params.get("role").toString()) || v.isEmptyString(params.get("phone").toString())
				|| v.isEmptyString(params.get("address").toString())) {
			
			message="Please check your input, empty input data!";
			if(params.get("from").toString().equals("admin")) {
				page_return = "redirect:/profile-update?from=admin";
			} else {
				page_return = "redirect:/profile-update";
			}
		} else if (!v.validStringOnly(params.get("first_name").toString()) || !v.validStringOnly(params.get("last_name").toString()) ) {
			
			message="Please check your input, name cannot contain numbers!";
			if(params.get("from").toString().equals("admin")) {
				page_return = "redirect:/profile-update?from=admin";
			} else {
				page_return = "redirect:/profile-update";
			}
		} else {
			if(params.get("from").toString().equals("admin")) {
				page_return = "redirect:/admin";
				users = (Optional<UserProfile>) session.getAttribute("users_from_admin");
			} else {
				page_return = "redirect:/profile";
				users = (Optional<UserProfile>) session.getAttribute("users");
			}
			
			Long idRole = (long) Integer.parseInt(params.get("role").toString());
			Optional<Role> role = additionalService.findRoleById(idRole);
			
			String dir = "/assets/img/users/";
			if (!profile.isEmpty()) {
				users.get().setProfile_foto(profile.getOriginalFilename());				
				fileService.addFile(profile, dir);
			} 
			
			if (!bg.isEmpty()) {
				users.get().setBackground_foto(bg.getOriginalFilename());				
				fileService.addFile(bg, dir);
			}
			
			users.get().setBio(params.get("bio").toString());
			users.get().setFirst_name(params.get("first_name").toString());
			users.get().setLast_name(params.get("last_name").toString());
			users.get().setGender(params.get("gender").toString());
			users.get().setRole(role.get());
			users.get().setPhone(params.get("phone").toString());
			users.get().setAddress(params.get("address").toString());			
			
			userService.addUserProfile(users.get());
			
			session.setAttribute("users", users);
			session.setAttribute("users_profile", users);
			message = null;
		}
		
		return page_return;
	}
	
	@GetMapping(value="/add-experience")
	public String addExperience(Model model) {	
		
		Iterable<Role> roles = additionalService.getAllRoles();
		Iterable<Company> companys = additionalService.getAllCompany();
		Iterable<EmploymentType> employmentTypes = additionalService.getAllEmploymentType();
		
		model.addAttribute("jobs", roles);
		model.addAttribute("companys", companys);
		model.addAttribute("employemntTypes", employmentTypes);
		return "profile/experience";
	}
	
	@PostMapping(value="/add-experience")
	public String addExperience(@RequestParam Map<String, Object> params, HttpSession session) throws ParseException {
		
		Long idRole = (long) Integer.parseInt(params.get("job").toString());
		Long idEmploymentType = (long) Integer.parseInt(params.get("employmentType").toString());
		Long idCompany = (long) Integer.parseInt(params.get("company").toString());
		UserProfile user = (UserProfile) session.getAttribute("user");
		
		String description = params.get("description").toString();
		
		boolean isCurrentWorking = params.get("isCurrentWorking") == null ? false : true;
				
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date startDate =  df.parse(params.get("startDate").toString()); 
		Date lastDate =  df.parse(params.get("endDate").toString());
		
		Optional<Role> role = additionalService.findRoleById(idRole);
		Optional<EmploymentType> et = additionalService.findEmploymentTypeById(idEmploymentType);
		Optional<Company> company = additionalService.findCompanyById(idCompany);
		Optional<UserProfile> users = userService.userProfileFindById(user.getId());
		
		UserExperience userExperience = new UserExperience(users.get(), company.get(), role.get(), et.get(), isCurrentWorking, startDate, lastDate, description);
		userService.saveUserExperience(userExperience);
		
		return "redirect:/profile";
	}
}
