import { Component, Inject } from '@angular/core';

interface TodoList {
  id: string;
  name: string;
}

@Component({
  selector: 'app-index',
  template: `
    <h1>Todo App</h1>

    <div *ngIf="todoLists.length === 0">
      <p>No todo lists found. Create a new one!</p>
    </div>

    <ul>
      <li *ngFor="let todoList of todoLists">
        {{ todoList.name }}
      </li>
    </ul>

    <button (click)="createTodo()">Create New Todo List</button>
  `
})
export class IndexComponent {

  @Inject('todoLists')
  private todoLists: TodoList[] = [];

  createTodo() {
    const newId = Math.random().toString(36).substring(2, 15);
    const newList: TodoList = { id: newId, name: 'New Todo List ' + Date.now() };
    this.todoLists.push(newList);
  }
}