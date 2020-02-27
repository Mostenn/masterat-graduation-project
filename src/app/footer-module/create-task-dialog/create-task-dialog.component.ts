import { Component, OnInit } from '@angular/core';
import {TaskDto} from "../../tab-content-module/task-dto.model";

@Component({
  selector: 'app-create-task-dialog',
  templateUrl: './create-task-dialog.component.html',
  styleUrls: ['./create-task-dialog.component.scss']
})
export class CreateTaskDialogComponent implements OnInit {
  newTask: TaskDto;

  constructor() { }

  ngOnInit() {
    this.newTask = new TaskDto();
  }

}
