package com.sgatman.taskManager.controller;

import com.sgatman.taskManager.dto.LoginRequest;
import com.sgatman.taskManager.dto.RegisterRequest;
import com.sgatman.taskManager.services.AuthService;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

  @Resource
  private AuthService authService;

  @PostMapping("/signup")
  public ResponseEntity singup(@RequestBody RegisterRequest registerRequest) {
    authService.signup(registerRequest);
    return new ResponseEntity(HttpStatus.OK);
  }

  @PostMapping("/login")
  public String login(@RequestBody LoginRequest loginRequest) {
    return authService.login(loginRequest);
  }

}
