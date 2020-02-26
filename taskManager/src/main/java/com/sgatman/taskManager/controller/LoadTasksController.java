package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.TaskView;
import com.sgatman.taskManager.entities.TaskEntity;
import com.sgatman.taskManager.repository.TaskRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class LoadTasksController {

    @Resource
    private TaskRepository taskRepository;

    @GetMapping("/tasks")
    public List<TaskView> loadAllTasks(){
        return taskRepository.findAll().stream().map(TaskView::new).collect(Collectors.toList());
    }

    @GetMapping("/tasks/{taskId}")
    public TaskView loadTask(@PathVariable Long taskId){
        return new TaskView(taskRepository.getOne(taskId));

    }

    @PostMapping("/tasks")
    public void addTask(@RequestBody TaskEntity task){
        if (task.getId() == null)
            taskRepository.save(task);
    }

    @PutMapping("/tasks")
    public void changeTask(@RequestBody TaskEntity task){
        if (taskRepository.findById(task.getId()).isPresent())
            taskRepository.save(task);
    }
    @DeleteMapping("tasks/{taskId}")
    public void removeTask(@PathVariable Long taskId){
        taskRepository.deleteById(taskId);
    }

}
