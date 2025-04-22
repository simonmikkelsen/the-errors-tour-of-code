import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface TodoList {
  id: number;
  title: string;
  description: string;
  created_at: string;
  updated_at: string;
}

@Component({
  selector: 'app-create-todo-list',
  templateUrl: './create-todo-list.component.html',
  styleUrls: ['./create-todo-list.component.css']
})
export class CreateTodoListComponent implements OnInit {

  todoListTitle: string = '';
  todoListDescription: string = '';
  
  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
  }

  createTodoList(): void {
    const newTodoList: TodoList = {
      id: 0, // Server will assign ID
      title: this.todoListTitle,
      description: this.todoListDescription,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString()
    };

    this.http.post('/api/todo-lists', newTodoList).subscribe(
      response => {
        console.log('Todo list created:', response);
        this.router.navigate(['../todo-list', response]); // Redirect to the todo list view
      },
      error => {
        console.error('Error creating todo list:', error);
      }
    );
  }
}