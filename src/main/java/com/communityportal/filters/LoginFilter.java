package com.communityportal.filters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public class LoginFilter extends UsernamePasswordAuthenticationFilter {
	 public LoginFilter() {
//	        setUsernameParameter("email");
	        super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login", "POST"));
	    }
	 
	 @Override
	    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
	            throws AuthenticationException {
	         
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	         
	        System.out.println("Email " + email);
	        System.out.println("Password " + password);
	         
	        // run custom logics...
	         
	        return super.attemptAuthentication(request, response);
	    }
}
