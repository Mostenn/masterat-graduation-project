import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TaskDto } from '../task-dto.model';

@Injectable()
export class TabContentService{
    constructor(private http: HttpClient){
    }

    loadTasks(): Observable<any>{
        return this.http.get(`/api/tasks`);
    }

    loadSelectedTask(taskId: number): Observable<any>{
        return this.http.get(`/api/tasks/${taskId}`);
    }

    saveTask(task: TaskDto): Observable<any>{
        if(task.id){
            return this.http.put(`api/tasks`, task);
        } else {
            return this.http.post(`api/tasks`, task);
        }
    }

    removeTask(taskId: number): Observable<any>{
        return this.http.delete(`/api/tasks/${taskId}`);
    }

    loadStatuses(): Observable<any>{
      return this.http.get(`/api/ts`);
    }

    loadTaskTypes(): Observable<any>{
        return this.http.get(`/api/tt`);
    }
}
