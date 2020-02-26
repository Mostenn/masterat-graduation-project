package com.sgatman.taskManager.Views;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sgatman.taskManager.entities.TaskEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class TaskView {

    private Long id;

    private SimpleView status;

    private String description;

    private UserView creator;

    private UserView executor;

    private SimpleView taskType;

    private String color;

    @JsonFormat(pattern = "yyyy-MM-dd", shape = JsonFormat.Shape.STRING)
    private LocalDate createdAt;

    @JsonFormat(pattern = "yyyy-MM-dd", shape = JsonFormat.Shape.STRING)
    private LocalDate closedAt;

    @JsonFormat(pattern = "yyyy-MM-dd", shape = JsonFormat.Shape.STRING)
    private LocalDate estimated;

    public TaskView(TaskEntity task){
        this.id = task.getId();
        this.status = new SimpleView(task.getStatus().getId(), task.getStatus().getTitle());
        this.description = task.getTaskDescription();
        this.creator = new UserView(task.getCreator());
        this.executor = new UserView(task.getExecutor());
        this.taskType = new SimpleView(task.getTaskType().getId(), task.getTaskType().getName());
        this.color = task.getStatus().getColor();
        this.createdAt = task.getDateCreated();
        this.closedAt = task.getDateClosed();
        this.estimated = task.getEstimatedDate();
    }
}
