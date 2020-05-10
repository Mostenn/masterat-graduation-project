import {Component, OnInit} from '@angular/core';
import {MatDialogRef} from "@angular/material/dialog";
import {TabContentService} from "../../tab-content-module/tab-content/tab-content.service";
import {SimpleDto, UserDto} from "../../tab-content-module/task-dto.model";
import DateTimeFormat = Intl.DateTimeFormat;

@Component({
             selector: 'app-create-task-dialog',
             templateUrl: './create-task-dialog.component.html',
             styleUrls: ['./create-task-dialog.component.scss']
           })
export class CreateTaskDialogComponent implements OnInit {

  newTask: any;
  taskTypes: SimpleDto[];
  now: Date;

  constructor(private dialogRef: MatDialogRef<any>, private service: TabContentService) {
    this.now = new Date();
    this.newTask = {
      id: null,
      description: '',
      taskType: new SimpleDto(),
      createdAt: new Date().toISOString().substring(0, 10),
      estimated: undefined,
      creator: new UserDto(),
      executor: new UserDto(),
      status: new SimpleDto()
    }
  }

  ngOnInit() {
    this.service.loadTaskTypes().subscribe(data => {
      this.taskTypes = data;
    }, error => {
      console.error(`Loading error: ${error}`);
    });
  }

  onAbort() {
    this.dialogRef.close();
  }
}
