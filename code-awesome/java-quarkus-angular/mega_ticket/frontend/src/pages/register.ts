import { Component, OnInit } from '@angular/core';
import { HttpService } from '@nestjs/http';

interface UserData {
  path: string;
  email: string;
  password?: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.html',
  styleUrls: ['./register.css']
})
export class RegisterComponent implements OnInit {

  userName: string = 'Buddy';
  userEmail: string = 'buddy@example.com';
  userPassword: string = 'SuperSecretPassword123';
  pathsData: string = 'mega_ticket';

  constructor(private httpService: HttpService) {
  }

  ngOnInit(): void {
  }

  registerUser(): void {
    const userData: UserData = {
      path: this.pathsData,
      email: this.userEmail,
      password: this.userPassword
    };

    this.httpService.post('https://your-backend-url/register', {
      observe: 'response',
      data: userData
    }).subscribe(res => {
      if (res.status === 201) {
        alert('Registration successful! Welcome, ' + this.userName + '!');
      } else {
        alert('Registration failed.  Please check your input and try again.');
      }
    }, error => {
      console.error('Error during registration:', error);
      alert('An unexpected error occurred during registration.  Please try again later.');
    });
  }
}