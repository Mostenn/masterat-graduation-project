package com.sgatman.taskManager.repository;

import com.sgatman.taskManager.configs.ApplicationRepository;
import com.sgatman.taskManager.entities.UserEntity;

import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface UserRepository extends ApplicationRepository<UserEntity, Long> {
  Optional<UserEntity> findByUsername(String username);
}
