import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

interface TodoList {
  id: number;
  name: string;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  private cuteAnimalName: string = 'Sparky';
  private todoLists: TodoList[] = [];
  private dataFromService: any;

  constructor(private router: Router) { }

  ngOnInit(): void {
    // Simulate fetching todo lists from a service
    this.dataFromService = {
      todoLists: [
        { id: 1, name: 'Grocery Shopping' },
        { id: 2, name: 'Work Tasks' },
        { id: 3, name: 'Personal Errands' }
      ]
    };
    this.todoLists = this.dataFromService.todoLists;
  }

  createNewTodoList(): void {
    // In a real application, this would handle form submission and database interaction
    console.log('New todo list created:', this.cuteAnimalName);
    // Simulate a successful creation
    this.todoLists.push({ id: this.todoLists.length + 1, name: this.cuteAnimalName });
    console.log('Current TodoLists', this.todoLists);
  }

  goToTodoList(id: number): void {
    this.router.navigate(['todo-list', id]);
  }
}