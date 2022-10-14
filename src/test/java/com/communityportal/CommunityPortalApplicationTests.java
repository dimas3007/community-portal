package com.communityportal;

import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.communityportal.dto.Role;
import com.communityportal.dto.User;
import com.communityportal.dto.UserProfile;
import com.communityportal.dto.UserType;
import com.communityportal.repository.UserProfileRepo;
import com.communityportal.services.AdditionalService;
import com.communityportal.services.UserService;

@SpringBootTest
class CommunityPortalApplicationTests {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdditionalService additionalService;
	
	@Autowired
	UserProfileRepo userProfileRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Test
	void contextLoads() {
	}

//	@Test
//	void registerUserTest() {
//			
//		// Prepare All Data Requirements
//		String username = "junit";
//		String password = "junit_password";
//		String email = "junit@gmail.com";
//		
//		String firstName = "junit";
//		String lastName = "testing";
//		String phone = "089656564222";
//		String gender = "male";
//		String address = "St. J unit 29, United State";
//				
//		Role role = additionalService.findRoleById(1L).get();  // Data Analyst
//		UserType userType = additionalService.findUserTypeById(1L).get(); // Software Developer
//		
//		// Adding Process for User Account
//		User user = new User(
//				email, 
//				username, 
//				passwordEncoder.encode(password)
//		);
//		
//		userService.addUser(user);
//		
//		// Adding Process for User Profile		
//		UserProfile userProfile = new UserProfile(
//				firstName,
//				lastName,
//				gender,
//				phone,
//				user,
//				role,
//				userType,
//				address
//		);
//		
//		userService.addUserProfile(userProfile);
//		
//		// Check if the selected data in Role has id 1
//		Assertions.assertThat(role.getId()).isEqualTo(1L);
//		
//		// Check if the selected data in User Type has id 1
//		Assertions.assertThat(userType.getId()).isEqualTo(1L);
//		
//		// Check if Add User Account data is successfully
//		Assertions.assertThat(user.getId()).isGreaterThan(0);
//		
//		// Check if Add User Profile data is successfully
//		Assertions.assertThat(userProfile.getId()).isGreaterThan(0);
//	}
	
	
	@Test
	void forgotPasswordTest() {
		
		String email = "dimas@gmail.com";
		String newPassword = "newpassword";
		
		User user = userService.findByEmail(email).get(0);
		
		user.setPassword(passwordEncoder.encode(newPassword));
		
		userService.updatePassword(user);
		
		Assertions.assertThat(passwordEncoder.matches(passwordEncoder.encode(newPassword), user.getPassword()));
	}
}
