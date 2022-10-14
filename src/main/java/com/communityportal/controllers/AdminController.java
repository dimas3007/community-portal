package com.communityportal.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.communityportal.dto.BulkEmail;
import com.communityportal.dto.Company;
import com.communityportal.dto.EmploymentType;
import com.communityportal.dto.JobOpportunities;
import com.communityportal.dto.Role;
import com.communityportal.dto.UserProfile;
import com.communityportal.dto.WorkLevel;
import com.communityportal.services.AdditionalService;
import com.communityportal.services.AdminService;
import com.communityportal.services.JobService;
import com.communityportal.services.UserService;
import com.communityportal.services.UtilsService;
import com.communityportal.utils.Validate;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	UtilsService utilService;
	
	@Autowired
	AdditionalService additionalService;
	
	@Autowired
	JobService jobService;
	
	private String message = null;
	private String pageReturn = null;

	@GetMapping(value="/admin")
	public String admin(Model model, HttpSession session) {
		Optional<UserProfile> users = (Optional<UserProfile>) session.getAttribute("users");
		Iterable<UserProfile> userProfile = userService.showAllUserProfiles();
		
		model.addAttribute("auth", users.get());
		model.addAttribute("users", userProfile);
		return "admin/admin";
	}
	
	@GetMapping(value="/delete-user")
	public String deleteUser(@RequestParam String id) {
		Long id_user = (long) Integer.parseInt(id);
		
		userService.deleteUser(id_user);
		
		return "redirect:/admin";
	}
	
	@GetMapping(value="/user-update")
	public String updateProfile(Model model, HttpSession session, @RequestParam Long id) {
		Optional<UserProfile> users = userService.userProfileFindById(id);
		
		session.setAttribute("users_from_admin", users);
		
		return "redirect:/profile-update?from=admin";
	}
	
	/**
     * Controller For Email
     * to Manage all Function for email on Admin
     */
	@ResponseBody
	@RequestMapping(value = "/send-email", method = RequestMethod.POST)
	public String sendEmail(Model model, @RequestParam Map<String, Object> params) {
		String status = "error";
		
		System.out.println(params.get("emails").toString());
		
		Validate v = new Validate();
		if (v.isEmptyString(params.get("emails").toString())) {
			status = "Please check your input, empty email data!";
		} else {
			String[] dataEmail = params.get("emails").toString().split(",");
			
			for(int i = 0; i <= dataEmail.length - 1; i++){ 
				BulkEmail email = new BulkEmail(params.get("subject").toString(), params.get("description").toString(), "dimassetiaji30@gmail.com", dataEmail[i]);
				
				status = utilService.sendEmail(params.get("subject").toString(), params.get("description").toString(), dataEmail[i]);
				adminService.saveEmail(email);
			}			
		}
		
		System.out.println(status);
		
		return status;
	}
	
	@GetMapping(value="/email")
	public String Email(Model model) {
		Iterable<UserProfile> userProfile = userService.showAllUserProfiles();
	
		model.addAttribute("users", userProfile);
		return "admin/email";
	}
	
	/**
     * Controller For Job
     * to Manage all Function for Job on Admin
     */
	@GetMapping(value="/admin-job")
	public String job(Model model, @RequestParam Map<String, Object> params) {
		JobOpportunities jobOpportunities = new JobOpportunities();
		
		if(params.get("operation").toString().equals("add")) {
			model.addAttribute("operation", "Add");
			pageReturn = "redirect:admin-job?operation=add";
		} else {
			model.addAttribute("operation", "Update");
			
			Long id = (long) Integer.parseInt(params.get("id").toString());
			JobOpportunities jobOpportunitiesNew = jobService.findByIdJobOpportunities(id).get();
			
			jobOpportunities = jobOpportunitiesNew;
			pageReturn = "redirect:admin-job?operation=add&id=" + id;
		}
		
		Iterable<Role> roles = additionalService.getAllRoles();
		Iterable<Company> companys = additionalService.getAllCompany();
		Iterable<EmploymentType> employmentTypes = additionalService.getAllEmploymentType();
		Iterable<WorkLevel> workLevel = additionalService.getAllWorkLevel();
		
		model.addAttribute("job", jobOpportunities);
		
		model.addAttribute("roles", roles);
		model.addAttribute("companys", companys);
		model.addAttribute("employemntTypes", employmentTypes);
		model.addAttribute("workLevels", workLevel);
		
		model.addAttribute("message", message);
		return "admin/job";
	}
	
	@PostMapping(value="/admin-add-job")
	public String addJob(@RequestParam Map<String, Object> params, HttpSession session, @ModelAttribute("job") JobOpportunities job) {
		UserProfile user = (UserProfile) session.getAttribute("user");
		UserProfile users = userService.userProfileFindById(user.getId()).get();
		
		Validate v = new Validate();
		if(job.getEmployment_type() == null || job.getCompany() == null
				|| job.getRole() == null || job.getWork_level() == null || v.isEmptyString(job.getWorkExperience())
				|| v.isEmptyString(job.getLocation()) || v.isEmptyString(job.getDescription())) {
			
			message="Please check your input, empty input data!";
		} else if (!v.validNumberOnly(Integer.toString(job.getSalary()))) {
			message="Please check your input, salary cannot contain alphabet!";
		} else {
			if (params.get("operation").toString().equals("Update")) {
				Long idJob = (long) Integer.parseInt(params.get("id").toString());
				
				job.setId(idJob);
			}
			
			job.setUser(users);
			
			jobService.saveJob(job);
			
			message = null;
			pageReturn = "redirect:/job";
		}
		
		
		return pageReturn;
	}
}
