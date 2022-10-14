package com.communityportal.security;

import java.io.IOException;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.communityportal.dto.User;
import com.communityportal.dto.UserProfile;
import com.communityportal.repository.UserProfileRepo;

@Component
public class WebSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired(required = false)
	private HttpSession session;
	
	@Autowired
	private UserProfileRepo userProfileRepo;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		User user = (User) session.getAttribute("loguser");
		Optional<UserProfile> userProfile = userProfileRepo.findByIdUser(user.getId());
		
		session.setAttribute("user", userProfile.get());
		session.setAttribute("users", userProfile);
		session.setAttribute("users_profile", userProfile);
		session.setAttribute("user_log", userProfile);
				
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
        if (roles.contains("admin")) {
        	new DefaultRedirectStrategy().sendRedirect(request, response, "/admin");
        	session.setAttribute("role", "admin");
        } else {
        	new DefaultRedirectStrategy().sendRedirect(request, response, "/thread");
        	session.setAttribute("role", "software developer");
        }
		
	}
	 
}
