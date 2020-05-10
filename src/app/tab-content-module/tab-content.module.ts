import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatDatepickerModule } from "@angular/material/datepicker";
import { MatInputModule } from "@angular/material/input";
import { MatNativeDateModule } from '@angular/material/core';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatChipsModule } from '@angular/material/chips';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule } from "@angular/forms";
import { HttpClientModule } from "@angular/common/http";
import { TabContentService } from './tab-content/tab-content.service';
import { TabContentComponent } from './tab-content/tab-content.component';
import {MatTabsModule} from "@angular/material/tabs";



@NgModule({
  declarations: [TabContentComponent],
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
                  MatSelectModule,
                  MatChipsModule,
                  FormsModule,
                  HttpClientModule,
                  MatTabsModule
              ],
  providers:[
    TabContentService
  ],
  exports: [
    TabContentComponent
  ]
})
export class TabContentModule { }
