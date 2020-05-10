package com.sgatman.taskManager.services;

import com.sgatman.taskManager.Views.TaskView;
import com.sgatman.taskManager.entities.TaskEntity;
import com.sgatman.taskManager.repository.TaskRepository;
import com.sgatman.taskManager.repository.TaskStatusRepository;
import com.sgatman.taskManager.repository.TaskTypesRepository;
import com.sgatman.taskManager.repository.UserRepository;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TaskService {

  @Resource
  private AuthService authService;

  @Resource
  private TaskRepository taskRepository;

  @Resource
  private TaskStatusRepository taskStatusRepository;

  @Resource
  private TaskTypesRepository taskTypesRepository;

  @Resource
  private UserRepository userRepository;

  public void updateTask(TaskView task) {
    TaskEntity upd = new TaskEntity();
    upd.setId(task.getId());
    createEntity(task, upd);
  }

  public void saveTask(TaskView task) {
    TaskEntity newT = new TaskEntity();
    createEntity(task, newT);
  }

  private void createEntity(TaskView task, TaskEntity entity) {
    entity.setStatus(taskStatusRepository.findById(task.getStatus().getLabel()).get());
    entity.setTaskDescription(task.getDescription());

    User username = authService.getCurrentUser().orElseThrow(() -> new IllegalArgumentException("No User logged in"));
    if (task.getCreator().getId() != null) {
      entity.setCreator(userRepository.getOne(task.getCreator().getId()));
    } else {
      entity.setCreator(userRepository.findByUsername(username.getUsername()).get());
    }

    entity.setExecutor(userRepository.getOne(task.getExecutor().getId()));
    entity.setTaskType(taskTypesRepository.getOne(task.getTaskType().getLabel()));
    entity.setDateCreated(task.getCreatedAt());
    entity.setEstimatedDate(task.getEstimated());

    taskRepository.save(entity);
  }
}
