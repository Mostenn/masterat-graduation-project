package com.sgatman.taskManager.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "tasks", schema = "task_data")
public class Task implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "status")
    private int status;

    @Column(name = "task_description")
    private String taskDescription;

    @OneToOne
    @JoinColumn(name = "customer_id")
    private User creator;

    @OneToOne
    @JoinColumn(name = "executor_id")
    private User executor;

    @OneToOne
    @JoinColumn(name = "task_type")
    private TaskType task_type;

    @Column(name = "date_created")
    private Date dateCreated;

    @Column(name = "date_closed")
    private Date dateClosed;

    @Column(name = "estimated_date")
    private Date estimatedDate;

    @ManyToMany
    @JoinTable(name = "tasks_to_users",
            joinColumns = {@JoinColumn(name = "task_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<User> users;

}
