package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.entities.Task;
import com.sgatman.taskManager.repository.TaskRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
public class LoadTasksController {

    @Resource
    private TaskRepository taskRepository;

    @GetMapping("/tasks")
    public Iterable<Task> loadAllTasks(){
        return taskRepository.findAll();
    }

    @PostMapping("/tasks")
    public void addTask(@RequestBody Task task){
        taskRepository.save(task);
    }

    @DeleteMapping("/tasks/{id}")
    public void removeTask(@RequestBody Task task){
        taskRepository.delete(task);
    }

}
