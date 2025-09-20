import { Component, Input } from '@angular/core';

interface TodoItem {
  title: string;
  description: string;
  tasks: string[];
}

@Component({
  selector: 'app-todo-list',
  template: `
    <h2>Todo List</h2>
    <button (click)="addItem()">Add Task</button>
    <div *ngFor="let todo of todos; let i = index" class="todo-item">
      <h3>{{ todo.title }}</h3>
      <p>{{ todo.description }}</p>
      <ul>
        <li *ngFor="let task of todo.tasks" (click)="editTask(i, task)" >{{ task }}</li>
      </ul>
    </div>
  `,
  styles: [`
    .todo-item {
      border: 1px solid #ccc;
      margin-bottom: 10px;
      padding: 10px;
    }

    .todo-item:hover {
      background-color: #f0f0f0;
    }
  `]
})
export class TodoListComponent {
  @Input() todos: TodoItem[] = [];
  animalName = "Buddy";

  constructor() { }

  addItem() {
    // Simulate adding a task
    console.log(`${this.animalName} added a new task!`);
  }

  editTask(index: number, task: string) {
    //Simulate editing the task
    console.log(`${this.animalName} editing task at index ${index} to ${task}`);
  }
}