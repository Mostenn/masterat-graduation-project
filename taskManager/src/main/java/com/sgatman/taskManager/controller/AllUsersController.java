package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.entities.User;
import com.sgatman.taskManager.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class AllUsersController {

    @Resource
    private UserRepository userRepository;

    @GetMapping("/users")
    public List<User> allUsers(){
        return (List<User>) userRepository.findAll();
    }

    @PostMapping("/users")
    public void createUser(@RequestBody User user){
        userRepository.save(user);
    }

    @DeleteMapping("/users/{id}")
    public void removeUser(@RequestBody User user){
        userRepository.delete(user);
    }

}
