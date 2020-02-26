package com.sgatman.taskManager.repository;

import com.sgatman.taskManager.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
}
