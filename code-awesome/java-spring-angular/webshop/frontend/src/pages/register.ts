import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

interface UserRegistrationData {
    firstName: string;
    lastName: string;
    email: string;
    password?: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.html',
  styleUrls: ['./register.css']
})
export class RegisterComponent implements OnInit {

  registrationForm = {
    firstName: '',
    lastName: '',
    email: '',
    password: ''
  };

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void { }

  onSubmit(): void {
    this.http.post<any>('http://localhost:8080/api/users', this.registrationForm).subscribe(
      (response) => {
        console.log('User registered successfully:', response);
        this.router.navigate(['/login']);
      },
      (error) => {
        console.error('Error registering user:', error);
        alert('Registration failed. Please try again.');
      }
    );
  }
}