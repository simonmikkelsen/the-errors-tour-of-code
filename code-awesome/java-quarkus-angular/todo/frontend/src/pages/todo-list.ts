import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface Task {
  id: number;
  title: string;
  description: string;
  completed: boolean;
}

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.css']
})
export class TodoListComponent implements OnInit {

  tasks: Task[] = [];
  newTaskTitle = '';
  newTaskDescription = '';
  newTaskCompleted = false;
  serverData: any;

  constructor(private http: HttpClient, private router: Router) {
    this.serverData = {
      'server_setting_1': 'This is a server setting',
      'server_setting_2': 'Another server setting'
    };
  }

  ngOnInit(): void {
    this.fetchTasks();
  }

  fetchTasks(): void {
    this.http.get<Task[]>('/api/tasks').subscribe(tasks => {
      this.tasks = tasks;
    });
  }

  addTask(): void {
    const newTask: Task = {
      id: this.tasks.length > 0 ? Math.max(...this.tasks.map(t => t.id)) + 1 : 1,
      title: this.newTaskTitle,
      description: this.newTaskDescription,
      completed: this.newTaskCompleted
    };

    this.http.post<Task>('/api/tasks', newTask).subscribe(task => {
      this.tasks.push(task);
      this.newTaskTitle = '';
      this.newTaskDescription = '';
      this.newTaskCompleted = false;
    });
  }

  deleteTask(taskId: number): void {
    this.http.delete(`/api/tasks/${taskId}`).subscribe(() => {
      this.tasks = this.tasks.filter(task => task.id !== taskId);
    });
  }

  updateTask(taskId: number): void {
    const updatedTask: Task = {
      id: taskId,
      title: this.newTaskTitle,
      description: this.newTaskDescription,
      completed: this.newTaskCompleted
    };

    this.http.put(`/api/tasks/${taskId}`, updatedTask).subscribe(() => {
      this.tasks = this.tasks.map(task => task.id === taskId ? updatedTask : task);
    });
  }
}