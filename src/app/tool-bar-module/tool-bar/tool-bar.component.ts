import { Component, OnInit, Input } from '@angular/core';
import { ThemePalette } from '@angular/material/core';
import { MatDialog } from '@angular/material/dialog';
import { ProfileEditDialogComponent } from './profile-edit-dialog/profile-edit-dialog.component';

@Component({
  selector: 'app-tool-bar',
  templateUrl: './tool-bar.component.html',
  styleUrls: ['./tool-bar.component.scss']
})
export class ToolBarComponent implements OnInit {

  @Input() backgroundColor: ThemePalette = "primary";
  @Input() color: ThemePalette;
  isIconButton: boolean;

  links = [ 'All Tasks', 'In progress', 'Done'];
  activeLink = this.links[0];

  constructor(public dialog: MatDialog) { }

  openProfileDialog(): void {
    const dialogRef = this.dialog.open(ProfileEditDialogComponent, {
      width: '1250px',
      height: '300px',
      data: {name: 'test', animal: 'this.animal'}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    });
  }

  openHelpBtn(){
    // open pdf manual
    window.open('www.google.com', '_blank');
  }

  onLogout(){}

  ngOnInit() {
  }

}
