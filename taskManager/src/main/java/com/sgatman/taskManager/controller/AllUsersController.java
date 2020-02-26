package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.Views.UserView;
import com.sgatman.taskManager.entities.UserEntity;
import com.sgatman.taskManager.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class AllUsersController {

    @Resource
    private UserRepository userRepository;

    @GetMapping("/users")
    public List<UserView> allUsers(){
        return userRepository.findAll().stream().map(UserView::new).collect(Collectors.toList());
    }

    @GetMapping("/users/{id}")
    public UserView userById(@PathVariable Long id){
        return new UserView(userRepository.getOne(id));
    }

    @PostMapping("/users")
    public void createUser(@RequestBody UserEntity user) {
        if(user.getId() == null)
            userRepository.save(user);
    }

    @PutMapping("/users")
    public void updateUser(@RequestBody UserEntity user){
        if (userRepository.findById(user.getId()).isPresent())
            userRepository.save(user);
    }

    @DeleteMapping("/users/{userId}")
    public void removeUser(@PathVariable Long userId){
        userRepository.deleteById(userId);
    }

}
