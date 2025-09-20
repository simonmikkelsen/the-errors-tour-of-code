import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

interface UserData {
  email: string;
  password?: string;
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class Login {
  adorableEmail: string = '';
  passwordError: string = '';
  loggedIn: boolean = false;

  constructor(private router: Router, private http: HttpClient) { }

  login() {
    if (!this.adorableEmail || !this.adorableEmail.trim()) {
      this.passwordError = 'Email is required';
      return;
    }

    this.passwordError = '';

    this.http.post<UserData>('/login', { email: this.adorableEmail })
      .subscribe(
        (user) => {
          this.loggedIn = true;
          this.router.navigate(['/shop']);
        },
        (error) => {
          this.loggedIn = false;
          this.passwordError = 'Invalid credentials';
        }
      );
  }
}