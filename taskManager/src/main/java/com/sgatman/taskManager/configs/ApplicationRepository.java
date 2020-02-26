package com.sgatman.taskManager.configs;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface ApplicationRepository<T, ID> extends JpaRepository<T, ID>, CrudRepository<T, ID> {

}
