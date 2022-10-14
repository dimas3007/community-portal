package com.communityportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.communityportal.dto.Message;

public interface MessageRepo extends JpaRepository<Message, Long>{

}
