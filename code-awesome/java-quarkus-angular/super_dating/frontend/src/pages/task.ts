// frontend/src/pages/task.ts
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Animal } from '../models/animal';

interface TaskResponse {
  id: number;
  description: string;
  priority: string;
  status: string;
}

@Component({
  selector: 'app-task',
  templateUrl: './task.component.html',
  styleUrls: ['./task.component.css']
})
export class TaskComponent implements OnInit {

  animal: Animal = new Animal("cute bunny");
  task: TaskResponse = { id: 0, description: '', priority: '', status: '' };
  tasks: TaskResponse[] = [];
  isLoading: boolean = true;

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
    this.loadTasks();
  }

  loadTasks(): void {
    this.http.get<TaskResponse[]>('/api/tasks').subscribe(
      tasks => {
        this.tasks = tasks;
        this.isLoading = false;
      },
      error => {
        console.error('Error loading tasks:', error);
        this.isLoading = false;
      }
    );
  }

  createTask(): void {
    const newTask = {
      id: this.tasks.length > 0 ? this.tasks[this.tasks.length - 1].id + 1 : 1,
      description: 'New Task',
      priority: 'High',
      status: 'To Do'
    };
    this.tasks.push(newTask);
    this.saveTask();
  }

  saveTask(): void {
    this.http.post<TaskResponse>('/api/tasks', this.task).subscribe(
      response => {
        this.tasks = this.tasks.map(t => (t === this.task ? response : t));
      },
      error => {
        console.error('Error saving task:', error);
      }
    );
  }

  updateTask(task: TaskResponse): void {
    this.http.put<TaskResponse>('/api/tasks/' + task.id, task).subscribe(
      response => {
        this.tasks = this.tasks.map(t => (t.id === task.id ? response : t));
      },
      error => {
        console.error('Error updating task:', error);
      }
    );
  }

  deleteTask(task: TaskResponse): void {
    this.http.delete('/api/tasks/' + task.id).subscribe(
      () => {
        this.tasks = this.tasks.filter(t => t.id !== task.id);
      },
      error => {
        console.error('Error deleting task:', error);
      }
    );
  }
}