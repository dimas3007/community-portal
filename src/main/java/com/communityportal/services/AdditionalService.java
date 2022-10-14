package com.communityportal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.communityportal.dto.Company;
import com.communityportal.dto.EmploymentType;
import com.communityportal.dto.Role;
import com.communityportal.dto.User;
import com.communityportal.dto.UserType;
import com.communityportal.dto.WorkLevel;
import com.communityportal.repository.CompanyRepo;
import com.communityportal.repository.EmploymentTypeRepo;
import com.communityportal.repository.RoleRepo;
import com.communityportal.repository.UserTypeRepo;
import com.communityportal.repository.WorkLevelRepo;

@Service
public class AdditionalService {
	
	@Autowired
	RoleRepo roleRepo;
	
	@Autowired
	UserTypeRepo userTypeRepo;
	
	@Autowired
	EmploymentTypeRepo employmentTypeRepo;
	
	@Autowired
	CompanyRepo companyRepo;
	
	@Autowired
	WorkLevelRepo workLevelRepo;
	
    /**
     * Service For Roles Repository
     * to Manage all data on Role Table in Database
     */
	public List<Role> getAllRoles() {
		return roleRepo.findAll();
	}
	
	public Optional<Role> findRoleById(Long id) {
		return roleRepo.findById(id);
	}
	
	/**
     * Service For Roles Repository
     * to Manage all data on Role Table in Database
     */
	public Optional<UserType> findUserTypeById(Long id) {
		return userTypeRepo.findById(id);
	}
	
	 /**
     * Service For Employment Type Repository
     * to Manage all data on Employment Type Table in Database
     */
	public List<EmploymentType> getAllEmploymentType() {
		return employmentTypeRepo.findAll();
	}
	
	public Optional<EmploymentType> findEmploymentTypeById(Long id) {
		return employmentTypeRepo.findById(id);
	}
	
	/**
     * Service For Company Repository
     * to Manage all data on Company Table in Database
     */
	public List<Company> getAllCompany() {
		return companyRepo.findAll();
	}
	
	public Optional<Company> findCompanyById(Long id) {
		return companyRepo.findById(id);
	}
	
	/**
     * Service For Company Repository
     * to Manage all data on Company Table in Database
     */
	public List<WorkLevel> getAllWorkLevel() {
		return workLevelRepo.findAll();
	}
	
	public Optional<WorkLevel> findWorkLevelById(Long id) {
		return workLevelRepo.findById(id);
	}
}
