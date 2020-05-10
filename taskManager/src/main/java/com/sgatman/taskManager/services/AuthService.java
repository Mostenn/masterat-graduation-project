package com.sgatman.taskManager.services;

import com.sgatman.taskManager.dto.LoginRequest;
import com.sgatman.taskManager.dto.RegisterRequest;
import com.sgatman.taskManager.entities.UserEntity;
import com.sgatman.taskManager.repository.UserRepository;
import com.sgatman.taskManager.security.JwtProvider;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

import javax.annotation.Resource;

@Service
public class AuthService {

  @Resource
  UserRepository userRepository;

  @Resource
  PasswordEncoder passwordEncoder;

  @Resource
  private AuthenticationManager authenticationManager;

  @Resource
  private JwtProvider jwtProvider;

  public void signup(RegisterRequest registerRequest) {
    UserEntity user = new UserEntity();
    user.setUsername(registerRequest.getUsername());
    user.setEmail(registerRequest.getEmail());
    user.setPassword(encodePassword(registerRequest.getPassword()));

    userRepository.save(user);
  }

  private String encodePassword(String password) {
    return passwordEncoder.encode(password);
  }

  public String login(LoginRequest loginRequest) {
    Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));
    SecurityContextHolder.getContext().setAuthentication(authenticate);
    return jwtProvider.generateToken(authenticate);
  }

  public Optional<org.springframework.security.core.userdetails.User> getCurrentUser() {
    org.springframework.security.core.userdetails.User principal = (org.springframework.security.core.userdetails.User) SecurityContextHolder.
        getContext().getAuthentication().getPrincipal();
    return Optional.of(principal);
  }
}
