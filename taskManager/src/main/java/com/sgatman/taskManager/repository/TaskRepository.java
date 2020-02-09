package com.sgatman.taskManager.repository;

import com.sgatman.taskManager.entities.Task;
import org.springframework.data.repository.CrudRepository;

public interface TaskRepository extends CrudRepository<Task, Long> {
}
