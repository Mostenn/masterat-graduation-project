package com.sgatman.taskManager.entities;

import com.sgatman.taskManager.Views.SimpleView;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "task_status", schema = "task_data")
public class TaskStatusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "color")
    private String color;

    public TaskStatusEntity(SimpleView sv){
        this.id = sv.getLabel();
        this.title = sv.getValue();
    }
}
