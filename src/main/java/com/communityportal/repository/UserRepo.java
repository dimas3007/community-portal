package com.communityportal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.communityportal.dto.User;

public interface UserRepo extends JpaRepository<User, Long>{
	@Query(value = "SELECT id, email, password, username FROM users WHERE email = ?1", nativeQuery = true)
	List<User> findByEmail(String email);
	
	@Query(value = "SELECT id, email, password, username FROM users WHERE email = ?1 AND password = ?2", nativeQuery = true)
	List<User> findByEmailAndPassword(String email, String password);
	
	@Query(value = "SELECT * FROM users WHERE username = ?1", nativeQuery = true)
	List<User> findByUsername(String username);
}
