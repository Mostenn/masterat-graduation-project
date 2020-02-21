package com.sgatman.taskManager.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "users", schema = "user_data")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "department_id")
    private Long departmentId;

    @Column(name = "work_position")
    private String workPosition;

    @Column(name = "email")
    private String email;

    @Column(name = "personal_phone")
    private String personalPhone;

    @Column(name = "role")
    private Integer role;

}
