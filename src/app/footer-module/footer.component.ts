import {Component, OnInit} from '@angular/core';
import {MatDialog} from '@angular/material/dialog';
import {CreateTaskDialogComponent} from "./create-task-dialog/create-task-dialog.component";
import {TabContentService} from "../tab-content-module/tab-content/tab-content.service";
import {TaskDto} from "../tab-content-module/task-dto.model";

@Component({
             selector: 'app-footer',
             templateUrl: './footer.component.html',
             styleUrls: ['./footer.component.scss']
           })
export class FooterComponent implements OnInit {

  newTask: TaskDto;

  constructor(private dialog: MatDialog, private service: TabContentService) {
  }

  ngOnInit() {
  }

  openDialog() {
    console.log(this.newTask);
    const dialogRef = this.dialog.open(CreateTaskDialogComponent, {
      width: '550px'
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result != undefined) {

        result.estimated = result.estimated != undefined ? result.estimated.toISOString().substring(0, 10) : new Date().toISOString().substring(0, 10);
        result.creator.id = 1;
        result.executor.id = 2;
        result.status.label = 1;

        this.service.saveTask(result).subscribe(data => {
          this.newTask = new TaskDto(data);

        }, error => {
          console.error(`Saving error : ${error}`);
        });

      }
    });
  }
}
