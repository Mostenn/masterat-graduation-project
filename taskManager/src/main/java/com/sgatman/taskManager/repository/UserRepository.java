package com.sgatman.taskManager.repository;

import com.sgatman.taskManager.entities.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
}
