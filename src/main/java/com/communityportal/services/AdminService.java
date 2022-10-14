package com.communityportal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.communityportal.dto.BulkEmail;
import com.communityportal.dto.JobOpportunities;
import com.communityportal.dto.Role;
import com.communityportal.repository.BulkEmailRepo;
import com.communityportal.repository.JobOpportunitiesRepo;
import com.communityportal.repository.RoleRepo;

@Service
public class AdminService {

	@Autowired
	BulkEmailRepo bulkEmailRepo;
	
	public void saveEmail(BulkEmail email) {
		bulkEmailRepo.save(email);
	}
	
}
