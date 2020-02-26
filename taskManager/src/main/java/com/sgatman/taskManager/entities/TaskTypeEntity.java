package com.sgatman.taskManager.entities;

import com.sgatman.taskManager.Views.SimpleView;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "task_types", schema = "task_data")
public class TaskTypeEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    public TaskTypeEntity(SimpleView sv){
        this.id = sv.getLabel();
        this.name = sv.getValue();
    }

}
