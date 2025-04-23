import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

export class Login {
  constructor(
    @inject('router') private router: Router,
    @inject('http') private http: HttpClient
  ) {}

  login(email: string, password: string): void {
    const apiUrl = 'http://localhost:3000/api/login'; // Replace with your actual API URL
    const data = { email: email, password: password };

    this.http.post(apiUrl, data).subscribe({
      next: (response) => {
        if (response.success) {
          // Successful login
          localStorage.setItem('userToken', response.token); // Store token in localStorage
          this.router.navigate(['/todo']);
        } else {
          // Login failed
          alert('Invalid email or password.');
        }
      },
      error: (error) => {
        console.error('Login error:', error);
        alert('Login failed. Please try again.');
      }
    });
  }
}