import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

// Interface for the response from the backend
interface LoginResponse {
  success: boolean;
  user: {
    id: string;
    email: string;
  };
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class Login extends OnInit {

  loginForm: any;
  error: string = '';
  userId: string = '';

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      email: ['', Validators.email],
      password: ['', Validators.required]
    });
  }

  onSubmit(): void {
    if (this.loginForm.invalid) {
      return;
    }

    const email = this.loginForm.value.email;
    const password = this.loginForm.value.password;

    this.http.post<LoginResponse>('http://localhost:8080/login', {
      email: email,
      password: password
    }).subscribe(
      response => {
        if (response.success) {
          this.userId = response.user.id;
          this.router.navigate(['/dashboard']);
        } else {
          this.error = 'Invalid email or password.';
        }
      },
      error => {
        this.error = 'An error occurred: ' + error;
        console.error('Error:', error);
      }
    );
  }
}