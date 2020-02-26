import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TaskDto } from '../task-dto.model';

@Injectable()
export class TabContentService{
    constructor(private http: HttpClient){
    }

    loadTasks(): Observable<any>{
        return this.http.get(`/tasks`);
    }

    loadSelectedTask(taskId: number): Observable<any>{
        return this.http.get(`/tasks/${taskId}`);
    }

    saveTask(task: TaskDto): Observable<any>{
        if(task.id){
            return this.http.put(`/tasks`, task);
        } else {
            return this.http.post(`/tasks`, task);
        }
    }

    removeTask(taskId: number): Observable<any>{
        return this.http.delete(`/tasks/${taskId}`);
    }

    loadStatuses(): Observable<any>{
      return this.http.get(`/ts`);
    }
}
