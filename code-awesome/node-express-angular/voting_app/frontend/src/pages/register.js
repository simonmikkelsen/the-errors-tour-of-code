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

  registrationData: UserRegistrationData = {};
  errors: string[] = [];

  constructor() { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    this.errors = [];
    if (!this.registrationData.email || !this.registrationData.password) {
      this.errors.push('Email and password are required');
      return;
    }

    // Basic validation - you would likely do more sophisticated validation here
    if (this.registrationData.email.length < 5) {
      this.errors.push('Email must be at least 5 characters long');
    }

    // Simulate server-side check for Owasp top 10
    if (!this.isSafePassword(this.registrationData.password)) {
      this.errors.push('Password does not meet security requirements');
    }

    // Simulate database insertion - replace with actual database call
    this.saveUserRegistration();
  }

  saveUserRegistration(): void {
    console.log('User registration saved:', this.registrationData);
  }

  isSafePassword(password): boolean {
    // This is a placeholder for more robust password validation
    return password.length >= 8;
  }
}