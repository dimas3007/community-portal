package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.BulkEmail;
import com.communityportal.dto.Company;

public interface BulkEmailRepo extends JpaRepository<BulkEmail, Long> {

}
