package com.sgatman.taskManager.entities;

import com.sgatman.taskManager.Views.TaskView;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "tasks", schema = "task_data")
public class TaskEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "status")
    private TaskStatusEntity status;

    @Column(name = "task_description")
    private String taskDescription;

    @OneToOne
    @JoinColumn(name = "customer_id")
    private UserEntity creator;

    @OneToOne
    @JoinColumn(name = "executor_id")
    private UserEntity executor;

    @OneToOne
    @JoinColumn(name = "task_type")
    private TaskTypeEntity taskType;

    @Column(name = "date_created")
    private LocalDate dateCreated;

    @Column(name = "date_closed")
    private LocalDate dateClosed;

    @Column(name = "estimated_date")
    private LocalDate estimatedDate;

    @ManyToMany
    @JoinTable(name = "tasks_to_users",
            joinColumns = {@JoinColumn(name = "task_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<UserEntity> users;

    public TaskEntity(TaskView tv) {
        this.id = tv.getId();
        this.status = tv.getStatus() != null ? new TaskStatusEntity(tv.getStatus()) : new TaskStatusEntity();
        this.taskDescription = tv.getDescription();
        this.creator = new UserEntity(tv.getCreator());
        this.executor = new UserEntity(tv.getExecutor());
        this.taskType = new TaskTypeEntity(tv.getTaskType());
        this.dateCreated = tv.getCreatedAt();
        this.dateClosed = tv.getClosedAt();
        this.estimatedDate = tv.getEstimated();
    }
}
