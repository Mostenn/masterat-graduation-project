import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import {CreateTaskDialogComponent} from "./create-task-dialog/create-task-dialog.component";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit() {
  }

  openDialog() {
    const dialogRef = this.dialog.open(CreateTaskDialogComponent, {
      minWidth: '80vw'
    });
    dialogRef.afterClosed().subscribe(result => {

      console.log(`Dialog result: ${result}`);
    });
  }
}
