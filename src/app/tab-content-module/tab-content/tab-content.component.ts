import { Component, OnInit, Input } from '@angular/core';
import {SimpleDto, TaskDto} from "../task-dto.model";
import {TabContentService} from "./tab-content.service";
import { Router } from "@angular/router";

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
  editedBy: boolean = false;


  constructor(private service: TabContentService, private Router: Router) {
  }

  ngOnInit() {
    this.load();
  }

  load(){
    this.service.loadTasks().subscribe(data => {
      this.tasks = data;
      // console.log(data);
    }, error => {
      console.error(`Loading error: ${error}`);
    });

    this.service.loadStatuses().subscribe(data =>{
      this.statuses = data;
      // console.log(data);
    }, error => {
      console.error(`Loading error: ${error}`);
    });

  }

  completeTask() {

  }

  commentTask() {

  }

  saveEditedTask() {

  }
}
