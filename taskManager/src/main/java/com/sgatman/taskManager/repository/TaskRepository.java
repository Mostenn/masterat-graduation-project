package com.sgatman.taskManager.repository;

import com.sgatman.taskManager.configs.ApplicationRepository;
import com.sgatman.taskManager.entities.TaskEntity;
public interface TaskRepository extends ApplicationRepository<TaskEntity, Long> {
}
