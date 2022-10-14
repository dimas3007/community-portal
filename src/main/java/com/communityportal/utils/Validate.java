package com.communityportal.utils;

import java.util.regex.Pattern;

public class Validate {
	
	public boolean isEmptyString(String string) {
		return string == null || string.trim().isEmpty();
	}
	
	public boolean validEmailFormat(String email) {
		String regexPattern = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
	    return Pattern.compile(regexPattern)
	      .matcher(email)
	      .matches();
	}
	
	public boolean validStringOnly(String string) {
		String regexPattern = "^[a-zA-Z]*$";
	    return Pattern.compile(regexPattern)
	      .matcher(string)
	      .matches();
	}
	
	public boolean validNumberOnly(String integer) {
		String regexPattern = "[0-9]+";
	    return Pattern.compile(regexPattern)
	      .matcher(integer)
	      .matches();
	}
}
