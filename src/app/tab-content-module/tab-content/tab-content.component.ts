import {Component, EventEmitter, OnInit} from '@angular/core';
import { SimpleDto, TaskDto } from "../task-dto.model";
import { TabContentService } from "./tab-content.service";
import {Task} from "protractor/built/taskScheduler";

@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit {

  task: TaskDto;
  tasks: TaskDto[];
  statuses: SimpleDto[];
  selectedStatus: SimpleDto;
  taskTypes: SimpleDto[];
  taskType: SimpleDto;
  editedBy: boolean = false;
  editedTask: any;


  constructor(private service: TabContentService) {
  }

  ngOnInit() {
    this.load();
  }

  load(){
    this.service.loadTasks().subscribe(data => {
      this.tasks = data;
    }, error => {
      console.error(`Loading error: ${error}`);
    });

    this.service.loadStatuses().subscribe(data => {
      this.statuses = data;
    }, error => {
      console.error(`Loading error: ${error}`);
    });

    this.service.loadTaskTypes().subscribe(data => {
      this.taskTypes = data;
    }, error => {
      console.error(`Loading error: ${error}`);
    });

  }

  completeTask(task: any) {
    console.log(task);
    task.status.label = 6;
    this.saveEditedTask(task);
  }

  commentTask() {

  }

  saveEditedTask( editedTask: any) {
    editedTask.createdAt = new Date(editedTask.createdAt).toISOString().substring(0,10);
    this.service.saveTask(editedTask).subscribe(data => {
      // console.log(data);
    }, error => {
      console.error(`Loading error: ${error}`);
    });
  }

  runEdit(task: TaskDto){
    this.editedTask = task;
    this.editedBy = !this.editedBy;
  }
}
