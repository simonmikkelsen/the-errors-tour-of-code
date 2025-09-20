import { Component, OnInit } from '@angular/core';

interface UserData {
  username: string;
  email: string;
  password?: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  userData: UserData = {
    username: '',
    email: ''
  };

  constructor() { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    // In a real application, you would send this data to the server
    // for validation and storage.
    console.log('User data submitted:', this.userData);
  }
}