package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.TaskView;
import com.sgatman.taskManager.repository.TaskRepository;
import com.sgatman.taskManager.services.TaskService;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

  @Resource
  private TaskRepository taskRepository;

  @Resource
  private TaskService taskService;

  @GetMapping("/all")
  public List<TaskView> loadAllTasks() {
    return taskRepository.findAll().stream().map(TaskView::new).collect(Collectors.toList());
  }

  @GetMapping("/{taskId}")
  public TaskView loadTask(@PathVariable Long taskId) {
    return new TaskView(taskRepository.getOne(taskId));

  }

  @PostMapping
  public ResponseEntity addTask(@RequestBody TaskView task) {
    if (task.getId() == null) {
      taskService.saveTask(task);
      return new ResponseEntity(HttpStatus.OK);
    }
    return new ResponseEntity(HttpStatus.BAD_REQUEST);
  }

  @PutMapping
  public ResponseEntity changeTask(@RequestBody TaskView task) {
    if (taskRepository.findById(task.getId()).isPresent()) {
      taskService.updateTask(task);
      return new ResponseEntity(HttpStatus.OK);
    }
    return new ResponseEntity(HttpStatus.BAD_REQUEST);
  }

  @DeleteMapping("tasks/{taskId}")
  public void removeTask(@PathVariable Long taskId) {
    taskRepository.deleteById(taskId);
  }

}
