package com.communityportal.services;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UtilsService {
	
	@Autowired
    private HttpServletRequest request;
	
	@Autowired
	private JavaMailSender emailSender;
	
	public static final List<Long> times = Arrays.asList(
	        TimeUnit.DAYS.toMillis(365),
	        TimeUnit.DAYS.toMillis(30),
	        TimeUnit.DAYS.toMillis(1),
	        TimeUnit.HOURS.toMillis(1),
	        TimeUnit.MINUTES.toMillis(1),
	        TimeUnit.SECONDS.toMillis(1) );
	
	public static final List<String> timesString = Arrays.asList("year","month","day","hour","minute","second");
	
	public void addFile(MultipartFile file, String directory) {
		 if (!file.isEmpty()) {
                 String realPathtoUploads =  request.getServletContext().getRealPath(directory);
                 if(! new File(realPathtoUploads).exists())
                 {
                     new File(realPathtoUploads).mkdir();
                 }

                 String orgName = file.getOriginalFilename();
                 String filePath = realPathtoUploads + orgName;
                 File dest = new File(filePath);
                 try {
					file.transferTo(dest);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 }
	}
	
	public static String toDuration(long duration) {

	    StringBuffer res = new StringBuffer();
	    for(int i=0;i< UtilsService.times.size(); i++) {
	        Long current = UtilsService.times.get(i);
	        long temp = duration/current;
	        if(temp>0) {
	            res.append(temp).append(" ").append( UtilsService.timesString.get(i) ).append(temp != 1 ? "s" : "").append(" ago");
	            break;
	        }
	    }
	    if("".equals(res.toString()))
	        return "0 seconds ago";
	    else
	        return res.toString();
	}
	
	public String sendEmail(String subject, String description, String email) {
		final String from="dimassetiaji30@gmail.com";
		
		String status = "error";
		
		try {	
			SimpleMailMessage message = new SimpleMailMessage(); 
			message.setFrom(from);
			message.setTo(email);
			message.setText(description);
			message.setSubject(subject);
			emailSender.send(message);
			
			status = "success";
		} catch (MessagingException mse) {
			status = "error";
		}
        
        return status;
	}

}
