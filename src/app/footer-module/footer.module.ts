import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatInputModule } from '@angular/material/input';
import { MatNativeDateModule } from '@angular/material/core';
import { MatChipsModule } from '@angular/material/chips';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatDialogModule } from '@angular/material/dialog';
import { FooterComponent } from './footer.component';
import { PaginatorComponent } from './paginator/paginator.component';
import { CreateTaskDialogComponent } from './create-task-dialog/create-task-dialog.component';



@NgModule({
  declarations: [FooterComponent, PaginatorComponent, CreateTaskDialogComponent, CreateTaskDialogComponent],
  imports: [
    CommonModule,
    MatIconModule,
    MatButtonModule,
    MatTooltipModule,
    MatExpansionModule,
    MatFormFieldModule,
    MatDatepickerModule,
    MatInputModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatChipsModule,
    MatToolbarModule,
    MatDialogModule
  ],
  entryComponents:[ CreateTaskDialogComponent ],
  exports: [
    CreateTaskDialogComponent,
    FooterComponent,
    PaginatorComponent,
  ]
})
export class FooterModule { }
