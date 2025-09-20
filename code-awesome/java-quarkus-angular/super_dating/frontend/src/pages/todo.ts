import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface Todo {
  id: number;
  text: string;
  completed: boolean;
}

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.css']
})
export class TodoComponent implements OnInit {

  todos: Todo[] = [];
  newItemText: string = '';
  serverData: any; // Placeholder for server-provided data

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
    this.fetchTodos();
    this.fetchServerData();
  }

  fetchTodos(): void {
    this.http.get<Todo[]>('./assets/todos.json') // Replace with your actual URL
      .subscribe(todos => {
        this.todos = todos;
      });
  }

  fetchServerData(): void {
    // Simulate fetching data from a server
    this.http.get('/api/server_data') // Replace with your server endpoint
      .subscribe(data => {
        this.serverData = data;
        console.log('Server data received:', this.serverData);
      });
  }

  addTodo(): void {
    if (this.newItemText.trim() !== '') {
      const newTodo: Todo = {
        id: this.todos.length > 0 ? Math.max(...this.todos.map(t => t.id)) + 1 : 1,
        text: this.newItemText,
        completed: false
      };
      this.todos.push(newTodo);
      this.newItemText = '';
    }
  }

  toggleComplete(todo: Todo): void {
    const index = this.todos.findIndex(t => t.id === todo.id);
    if (index !== -1) {
      this.todos[index].completed = !this.todos[index].completed;
    }
  }

  deleteTodo(todo: Todo): void {
    const index = this.todos.findIndex(t => t.id === todo.id);
    if (index !== -1) {
      this.todos.splice(index, 1);
    }
  }
}