package com.communityportal.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.communityportal.dto.JobApplicant;
import com.communityportal.dto.JobOpportunities;
import com.communityportal.dto.UserProfile;
import com.communityportal.services.JobService;
import com.communityportal.services.UserService;
import com.communityportal.utils.Validate;

@Controller
@Transactional
public class JobController {
	
	@Autowired
	JobService jobService;
	
	@Autowired
	UserService userService;
	
	private String message = null;

	@GetMapping(value="/job")
	public String jobUserList(Model model, @ModelAttribute("jobApplicant") JobApplicant applicant) {
		List<JobOpportunities> jobs = jobService.showAllJobOpportunities();
				
		model.addAttribute("jobs", jobs);
		model.addAttribute("message", message);
		return "job/job";
	}
	
	@RequestMapping(value = "/get-detail-job", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody JobOpportunities getDetailJob(@RequestParam Long id) {
		Optional<JobOpportunities> job = jobService.findByIdJobOpportunities(id);
		
		return job.get();
	}
	
	@GetMapping(value="/delete-job")
	public String jobDelete(@RequestParam Long id) {	
		JobOpportunities job = jobService.findByIdJobOpportunities(id).get();
		
		jobService.deleteJob(job);
		
		return "redirect:/job";
	}
	
	/**
     * Controller For Job Applicant
     * to Manage all Function for Job Applicant on User
     */
	@PostMapping(value="/add-job-applicant")
	public String saveJobApplicant(@RequestParam Map<String, Object> params, HttpSession session, @ModelAttribute("jobApplicant") JobApplicant applicant) {
		UserProfile user = (UserProfile) session.getAttribute("user");
		UserProfile users = userService.userProfileFindById(user.getId()).get();
		
		Validate v = new Validate();
		String pageReturn = null;
		if (v.isEmptyString(applicant.getApplicant()) || v.isEmptyString(Integer.toString(applicant.getExpected_salary()))) {
			
			message = "Please check your input, empty input data!";
			pageReturn = "redirect:/job";
		} else if (!v.validNumberOnly(Integer.toString(applicant.getExpected_salary()))) {
			
			message = "Please check your input, salary cannot contain alphabet!";
			pageReturn = "redirect:/job";
		} else {
			applicant.setUser(users);
			applicant.setStatus("sent");
			jobService.saveJobApplicant(applicant);	
			message = null;
			pageReturn = "redirect:/user-job-response";
		}
		
		return pageReturn;
	}
	
	@RequestMapping(value = "/get-detail-response", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody JobApplicant getDetailJobResponse(@RequestParam Long id) {
		Optional<JobApplicant> job = jobService.findByIdJobApplicant(id);
		
		return job.get();
	}
	
	@GetMapping(value="/user-job-response")
	public String jobUserResponse(Model model, HttpSession session) {
		UserProfile user = (UserProfile) session.getAttribute("user");
		
		List<JobApplicant> jobs = jobService.showAllJobApplicantsByIdUser(user.getId());
		
		model.addAttribute("jobs", jobs);
		
		return "job/job-response";
	}
	
	@GetMapping(value="/admin-job-applicant")
	public String jobAdminResponse(Model model, @RequestParam Long id, HttpSession session) {		
		List<JobApplicant> applicants = jobService.showAllJobApplicantsByIdJobOpportunity(id);
		
		model.addAttribute("applicants", applicants);
		
		session.setAttribute("idJobForApplicants", id);
		
		return "job/job-applicant";
	}
	
	@PostMapping(value="/update-status-applicant")
	public String jobUpdateStatusApplicant(Model model, @RequestParam Map<String, Object> params, HttpSession session) {		
		
		Long idJobFromSession = (long) Integer.parseInt(session.getAttribute("idJobForApplicants").toString());
		
		Long id = (long) Integer.parseInt(params.get("id").toString());
		String status = params.get("status").toString();
		
		JobApplicant job = jobService.findByIdJobApplicant(id).get();
		job.setStatus(status);
				
		jobService.saveJobApplicant(job);
		
		return "redirect:/admin-job-applicant?id=" + idJobFromSession;
	}
}
