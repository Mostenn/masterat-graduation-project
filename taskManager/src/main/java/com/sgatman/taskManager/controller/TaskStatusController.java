package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.SimpleView;
import com.sgatman.taskManager.entities.TaskStatusEntity;
import com.sgatman.taskManager.repository.TaskStatusRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class TaskStatusController {

    @Resource
    private TaskStatusRepository taskStatusRepository;

    @GetMapping("/ts")
    public List<SimpleView> loadTaskStatus() {
        return taskStatusRepository.findAll().stream()
                .map(taskTypeEntity -> new SimpleView(taskTypeEntity.getId(), taskTypeEntity.getTitle()))
                .collect(Collectors.toList());
    }

    @GetMapping("/ts/{id}")
    public SimpleView loadTaskStatus(@PathVariable Long id){
        TaskStatusEntity taskStatus = taskStatusRepository.getOne(id);
        return new SimpleView(taskStatus.getId(), taskStatus.getTitle());
    }

    @PostMapping("/ts")
    public void addTaskStatus(@RequestBody SimpleView taskStatus){
        if (taskStatus.getLabel() == null)
            taskStatusRepository.save(new TaskStatusEntity(taskStatus));
    }

    @PutMapping("/ts")
    public void changeTaskStatus(@RequestBody SimpleView taskStatus){
        if (taskStatusRepository.findById(taskStatus.getLabel()).isPresent()) {
            taskStatusRepository.save(new TaskStatusEntity(taskStatus));
        }
    }

    @DeleteMapping("/ts/{id}")
    public void removeTaskStatus(@PathVariable Long id){
        taskStatusRepository.deleteById(id);
    }
}
