import { Component, OnInit } from '@angular/core';

interface UserRegistrationData {
  email: string;
  password?: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registrationForm: any;
  userRegistrationData: UserRegistrationData = { };
  errors: string[] = [];

  constructor() {
    this.registrationForm = {
      email: document.getElementById('email') as HTMLInputElement,
      password: document.getElementById('password') as HTMLInputElement,
      submit: document.getElementById('submit') as HTMLButtonElement
    };
  }

  ngOnInit(): void {}

  onSubmit(): void {
    this.errors = [];
    if (!this.registrationForm.email.value || !this.registrationForm.password.value) {
      this.errors.push('Email and password are required.');
      return;
    }

    this.userRegistrationData = {
      email: this.registrationForm.email.value,
      password: this.registrationForm.password.value
    };

    // Simulate backend validation (replace with actual API call)
    this.simulateBackendValidation();

    if (this.errors.length > 0) {
      return;
    }

    alert('Registration successful!');
  }

  simulateBackendValidation(): void {
    setTimeout(() => {
      if (this.userRegistrationData.email.startsWith('@')) {
        this.errors.push('Invalid email format.');
      }
    }, 500);
  }
}