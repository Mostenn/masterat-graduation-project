package com.sgatman.taskManager.Views;

import com.sgatman.taskManager.entities.UserEntity;
import lombok.Getter;

@Getter
public class UserView {

    private Long id;

    private String fName;

    private String lName;

    public UserView(UserEntity user) {
        this.id = user.getId();
        this.fName = user.getFirstName();
        this.lName = user.getLastName();
    }
}
