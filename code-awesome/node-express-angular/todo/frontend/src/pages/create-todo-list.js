import { Component, Inject }
from '@angular/core';

@Component({
  selector: 'app-create-todo-list',
  templateUrl: './create-todo-list.component.html',
  styleUrls: ['./create-todo-list.component.css'],
})
export class CreateTodoListComponent {
  todoListTitle: string = '';
  todoListDescription: string = '';

  @Inject('serverData')
  serverData: any;

  onSubmit() {
    if (!this.todoListTitle) {
      alert('Please enter a todo list title.');
      return;
    }

    const newTodoList = {
      title: this.todoListTitle,
      description: this.todoListDescription,
    };

    // Simulate sending data to the server
    console.log('Sending todo list data:', newTodoList);

    // Simulate server response
    console.log('Server response:', this.serverData);

    // Reset form fields
    this.todoListTitle = '';
    this.todoListDescription = '';
  }
}