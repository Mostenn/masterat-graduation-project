package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.SimpleView;
import com.sgatman.taskManager.entities.TaskTypeEntity;
import org.springframework.web.bind.annotation.*;
import com.sgatman.taskManager.repository.TaskTypesRepository;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class TaskTypesController {

    @Resource
    private TaskTypesRepository taskTypesRepository;

    @GetMapping("/tt")
    public List<SimpleView> loadTaskTypes() {
        return taskTypesRepository.findAll().stream()
                .map(taskTypeEntity -> new SimpleView(taskTypeEntity.getId(), taskTypeEntity.getName()))
                .collect(Collectors.toList());
    }

    @GetMapping("/tt/{id}")
    public SimpleView loadTaskType(@PathVariable Long id){
        TaskTypeEntity taskType = taskTypesRepository.getOne(id);
        return new SimpleView(taskType.getId(), taskType.getName());
    }

    @PostMapping("/tt")
    public void addTaskType(@RequestBody SimpleView taskType){
        if (taskType.getLabel() == null)
            taskTypesRepository.save(new TaskTypeEntity(taskType));
    }

    @PutMapping("/tt")
    public void changeTaskType(@RequestBody SimpleView taskType){
        if (taskTypesRepository.findById(taskType.getLabel()).isPresent()) {
            taskTypesRepository.save(new TaskTypeEntity(taskType));
        }
    }

    @DeleteMapping("/tt/{id}")
    public void removeTaskType(@PathVariable Long id){
        taskTypesRepository.deleteById(id);
    }
}
