package com.communityportal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
public class CommunityPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(CommunityPortalApplication.class, args);
	}
}
