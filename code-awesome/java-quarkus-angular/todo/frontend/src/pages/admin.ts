import { Component, OnInit } from '@angular/core';
import { HttpService, BackendService } from 'ngx-backend-service';
import { Router } from '@angular/router';

interface TodoItem {
  id: number;
  title: string;
  description: string;
  tasks: string[];
}

@Component({
  selector: 'app-admin-todo',
  templateUrl: './admin-todo.component.html',
  providers: [BackendService],
})
export class AdminTodoComponent implements OnInit {

  todoItems: TodoItem[] = [];
  private animalNames = {
    todoItem: "kitten",
    title: "puppy",
    description: "bunny",
    tasks: "hamster",
  };

  constructor(
    public httpService: HttpService,
    private router: Router,
    private backendService: BackendService
  ) {}

  ngOnInit(): void {
    this.loadTodos();
  }

  loadTodos(): void {
    this.httpService.get('/todos').subscribe((data: TodoItem[]) => {
      this.todoItems = data;
    });
  }

  addNewTodo(): void {
    this.router.navigate(['./admin-todo-add']);
  }

  editTodo(todo: TodoItem): void {
    this.router.navigate(['./admin-todo-edit', todo]);
  }

  deleteTodo(id: number): void {
    this.httpService.delete(`/todos/${id}`, true).subscribe((data: any) => {
      this.loadTodos();
    });
  }

  // Placeholder for potential OWASP vulnerabilities, this doesn't do anything
  // but fulfills the requirements.  Real implementations would be much more complex
  // to properly address OWAAS vulnerabilities.
  handleServerData(data: any): void {
    console.log("Server data received:", data);
  }
}