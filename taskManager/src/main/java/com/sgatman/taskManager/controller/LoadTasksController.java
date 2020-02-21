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
        if (task.getId() == null)
            taskRepository.save(task);
    }

    @PutMapping("/tasks")
    public void changeTask(@RequestBody Task task){
        if (taskRepository.findById(task.getId()).isPresent())
            taskRepository.save(task);
    }
    @DeleteMapping("tasks/{taskId}")
    public void removeTask(@PathVariable Long taskId){
        taskRepository.deleteById(taskId);
    }

}
