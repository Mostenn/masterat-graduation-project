package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.entities.User;
import com.sgatman.taskManager.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
public class AllUsersController {

    @Resource
    private UserRepository userRepository;

    @GetMapping("/users")
    public Iterable<User> allUsers(){
        return userRepository.findAll();
    }

    @PostMapping("/users")
    public void createUser(@RequestBody User user) {
        if(user.getId() == null)
            userRepository.save(user);
    }

    @PutMapping("/users")
    public void updateUser(@RequestBody User user){
        if (userRepository.findById(user.getId()).isPresent())
            userRepository.save(user);
    }

    @DeleteMapping("/users/{userId}")
    public void removeUser(@PathVariable Long userId){
        userRepository.deleteById(userId);
    }

}
