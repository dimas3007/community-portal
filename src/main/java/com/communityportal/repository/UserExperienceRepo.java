package com.communityportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.communityportal.dto.UserExperience;

public interface UserExperienceRepo extends JpaRepository<UserExperience, Long> {

	@Query(value = "SELECT * FROM user_experiences WHERE id_user = ?1", nativeQuery = true)
	List<UserExperience> findByIdUser(Long id);
}
