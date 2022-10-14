package com.communityportal.services;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.communityportal.dto.User;
import com.communityportal.dto.UserExperience;
import com.communityportal.dto.UserProfile;
import com.communityportal.repository.UserExperienceRepo;
import com.communityportal.repository.UserProfileRepo;
import com.communityportal.repository.UserRepo;

@Service
//@Transactional
public class UserService implements UserDetailsService {
	
	@Autowired
	private UserProfileRepo userProfileRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private UserExperienceRepo userExperienceRepo;
	
	@Autowired(required = false)
	private HttpServletRequest request;
	
	@Autowired(required = false)
	private HttpServletResponse response;
	
	@Autowired(required = false)
	private HttpSession session;
	
	    @Override
	    @Transactional(readOnly = true)
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    	List<User> user = userRepo.findByEmail(username);
	    	
	    	 Set < GrantedAuthority > grantedAuthorities = new HashSet < > ();
	    	if (!user.isEmpty()) {
	    		Optional<UserProfile> userProfile = userProfileRepo.findByIdUser(user.get(0).getId());
	    		
	    		if (userProfile.get().getUser_type().getName().equals("Admin")) {
	    			 grantedAuthorities.add(new SimpleGrantedAuthority("admin"));
	    		} else {
	    			grantedAuthorities.add(new SimpleGrantedAuthority("software developer"));
	    		}
	    	}
	    	
	    	session.setAttribute("loguser", user.get(0));

	        return new org.springframework.security.core.userdetails.User(user.get(0).getEmail(), user.get(0).getPassword(),
	            grantedAuthorities);
	    }
	
	public List<User> showAllUser() {
		return userRepo.findAll();
	}
	
	public void addUserProfile(UserProfile userProfile) {
		System.out.println("Aku di Service");
		System.out.println(userProfile);
		System.out.println(userProfile.getRole());
		
		userProfileRepo.save(userProfile);
	}
	
	public List<UserProfile> showAllUserProfiles() {
		return userProfileRepo.findAll();
	}
	
	public void addUser(User user) {
		userRepo.save(user);
	}
	
	public Optional<User> findById(Long id) {
		return userRepo.findById(id);
	}
	
	public Optional<UserProfile> userProfileFindById(Long id) {
		return userProfileRepo.findById(id);
	}
	
	public Optional<UserProfile> findByIdUser(Long id) {
		return userProfileRepo.findByIdUser(id);
	}
	
	public List<User> login(String email, String password) {
		return userRepo.findByEmailAndPassword(email, password);
	}
	
	public List<UserProfile> search(String search) {
		return userProfileRepo.findByName(search);
	}
	
	public void updatePassword(User user) {
		userRepo.save(user);
	}
	
	public void deleteUser(Long id) {
		userProfileRepo.deleteById(id);
	}
	
	public List<User> findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	
	/**
     * Service For User Experience Repository
     * to Manage all data on User Experience Table in Database
     */
	public List<UserExperience> findUserExperienceByIdUser(Long id){
		return userExperienceRepo.findByIdUser(id);
	}
	
	public void saveUserExperience(UserExperience userExperience) {
		userExperienceRepo.save(userExperience);
	}
}
