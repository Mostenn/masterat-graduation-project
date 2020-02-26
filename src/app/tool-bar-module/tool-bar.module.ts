import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ToolBarComponent } from './tool-bar/tool-bar.component';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatTabsModule } from '@angular/material/tabs';
import { MatBadgeModule } from '@angular/material/badge';
import { MatToolbarModule } from '@angular/material/toolbar';
import { ProfileEditDialogComponent } from './tool-bar/profile-edit-dialog/profile-edit-dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import {MatFormFieldModule} from '@angular/material/form-field'; 



@NgModule({
  declarations: [ToolBarComponent, ProfileEditDialogComponent],
  imports: [
    CommonModule,
    MatIconModule,
    MatButtonModule,
    MatTooltipModule,
    MatTabsModule,
    MatBadgeModule,
    MatToolbarModule,
    MatDialogModule,
    MatFormFieldModule
  ],
  exports: [ToolBarComponent]
})
export class ToolBarModule { }
