import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-tab-content',
  templateUrl: './tab-content.component.html',
  styleUrls: ['./tab-content.component.scss']
})
export class TabContentComponent implements OnInit {
  task: any;
  tasks: any[] = [
    {'descr': 'task1'},
    {'descr': 'task2'},
    {'descr': 'task3'},
    {'descr': 'task4'},
    {'descr': 'task5'},
    {'descr': 'task6'},
    {'descr': 'task7'},
    {'descr': 'task8'},
    {'descr': 'task9'},
    {'descr': 'task10'},
    {'descr': 'task11'},
    {'descr': 'task12'},
  ];

  constructor() { }

  ngOnInit() {
  }

  completeTask() {

  }

  commentTask() {

  }
}
