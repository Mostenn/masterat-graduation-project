import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {TabContentComponent} from "./tab-content-module/tab-content/tab-content.component";
import {AppComponent} from "./app.component";


const routes: Routes = [

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
