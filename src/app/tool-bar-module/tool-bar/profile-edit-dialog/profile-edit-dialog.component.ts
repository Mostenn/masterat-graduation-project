import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

export interface DialogData {
  animal: string;
  name: string;
}

//TODO Finish component

@Component({
  selector: 'app-profile-edit-dialog',
  templateUrl: './profile-edit-dialog.component.html',
  styleUrls: ['./profile-edit-dialog.component.scss']
})
export class ProfileEditDialogComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<ProfileEditDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }


  onNoClick(): void {
    this.dialogRef.close();
  }
  ngOnInit() {
  }

}
