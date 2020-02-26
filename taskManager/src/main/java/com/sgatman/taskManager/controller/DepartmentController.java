package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.SimpleView;
import com.sgatman.taskManager.entities.DepartmentEntity;
import com.sgatman.taskManager.repository.DepartmentRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class DepartmentController {

    @Resource
    public DepartmentRepository departmentRepository;
    //TODO create View
    @GetMapping("/dep")
    public List<DepartmentEntity> loadDepartment(){
        return departmentRepository.findAll();
    }
}
