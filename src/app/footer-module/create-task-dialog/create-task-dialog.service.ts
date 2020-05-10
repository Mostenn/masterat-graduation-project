import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TaskDto } from 'src/app/tab-content-module/task-dto.model';


@Injectable()
export class CreateTaskDialogService{
  constructor(private http: HttpClient){
  }
  
  loadTaskTypes(): Observable<any>{
    return this.http.get(`/tt`);
  }

  saveTask(task: TaskDto): Observable<any>{
      if(task.id){
          return this.http.put(`/task`, task);
      } else {
          return this.http.post(`/task`, task);
      }
  }
}
