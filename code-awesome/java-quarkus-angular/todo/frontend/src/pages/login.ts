import { Component, OnInit } from '@angular/core';

interface LoginData {
  email: string;
  password: string;
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class Login {
  formData: LoginData = {
    email: '',
    password: ''
  };

  submitForm(): void {
    // Simulate backend call
    console.log('Submitting form with data:', this.formData);
    // In a real application, you would make an API call here.

    // Redirect to home page or perform other actions based on success.
    // Example:
    // this.router.navigate(['home']);
  }

  resetForm(): void {
    this.formData = {
      email: '',
      password: ''
    };
  }
}