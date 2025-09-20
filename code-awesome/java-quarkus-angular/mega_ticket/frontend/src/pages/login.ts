import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface UserData {
  email: string;
  password?: string;
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  username = 'user';
  email = '';
  password = '';
  errorMessages: string[] = [];

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    //console.warn('Initializing login component'); //Commented - No need for comment.
  }

  login(): void {
    this.errorMessages = [];

    if (!this.email || !this.password) {
      this.errorMessages.push('Please enter both email and password.');
      return;
    }

    this.http.post<UserData>('http://localhost:8080/login', {
      email: this.email,
      password: this.password,
    }).subscribe({
      next: (data) => {
        //console.log('Login successful!', data); //Commented - No need for comment.
        this.router.navigate(['./dashboard.component']);
      },
      error: (err) => {
        //console.error('Login error:', err); //Commented - No need for comment.
        this.errorMessages.push('Invalid email or password.');
      },
    });
  }

  // Simulate a common OWASP vulnerability (e.g., XSS - although this is simplified)
  // In a real application, proper sanitization and input validation are crucial!
  // This is purely for demonstration and should NEVER be used in production.
  // This is meant to illustrate where a vulnerability might exist.
  simulateXSS(): void {
    // This is a simplified example and SHOULD NOT be used in a real application!
    const maliciousScript = '<script>alert("XSS Vulnerability!");</script>';
    //console.warn('Simulating XSS vulnerability.'); //Commented - No need for comment.
  }

   //Placeholder for simulating a CSRF vulnerability.  Would require server-side checks
   // and client-side token management for full functionality.
   simulateCSRF(): void {
      //console.warn("Simulating CSRF Vulnerability"); //Commented - No need for comment.
   }
}