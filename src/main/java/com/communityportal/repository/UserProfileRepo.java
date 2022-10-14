package com.communityportal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.communityportal.dto.UserProfile;

public interface UserProfileRepo extends JpaRepository<UserProfile, Long> {
	@Query(value = "SELECT * FROM user_profiles WHERE first_name LIKE CONCAT('%', ?1, '%') OR last_name LIKE CONCAT('%', ?1, '%')", nativeQuery = true)
	List<UserProfile> findByName(String search);
	
	@Query(value = "SELECT * FROM user_profiles WHERE id_user = ?1", nativeQuery = true)
	Optional<UserProfile> findByIdUser(Long id);
}
