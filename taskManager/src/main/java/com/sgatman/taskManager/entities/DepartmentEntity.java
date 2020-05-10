package com.sgatman.taskManager.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

import java.io.Serializable;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "departments", schema = "user_data")
public class DepartmentEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "phone_value")
    private String phoneValue;

    @Column(name = "additional_phones")
    private String additional_phones;

    @ManyToMany
    @JoinTable(name = "users_to_departments",
            joinColumns = {@JoinColumn(name = "department_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<UserEntity> users;

}
