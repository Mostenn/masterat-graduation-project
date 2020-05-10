package com.sgatman.taskManager.services;

import com.sgatman.taskManager.entities.UserEntity;
import com.sgatman.taskManager.repository.UserRepository;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;

import javax.annotation.Resource;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

  @Resource
  private UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    UserEntity user = userRepository.findByUsername(username).orElseThrow(() -> new UsernameNotFoundException("No user found" + username));
    return
        new org.springframework.security.core.userdetails.User(
            user.getUsername(),
            user.getPassword(),
            true, true, true, true, getAthorities("ROLE_USER"));
  }

  private Collection<? extends GrantedAuthority> getAthorities(String role_user) {
    return Collections.singletonList(new SimpleGrantedAuthority(role_user));
  }
}
