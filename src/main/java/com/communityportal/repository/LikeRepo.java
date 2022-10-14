package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Like;

public interface LikeRepo extends JpaRepository<Like, Long>{

}
