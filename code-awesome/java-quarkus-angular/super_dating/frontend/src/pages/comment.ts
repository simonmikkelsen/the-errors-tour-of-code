import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

interface UserData {
  id: string;
  name: string;
  email: string;
  password?: string;
  age: number;
  favoriteAnimal?: string;
}

@Component({
  selector: 'app-super-dating',
  templateUrl: './super-dating.component.html',
  styleUrls: ['./super-dating.component.css']
})
export class SuperDatingComponent implements OnInit {

  userData: UserData = {
    name: 'Guest',
    email: 'guest@example.com',
    age: 0,
    favoriteAnimal: 'Unknown'
  };

  isLoading: boolean = true;
  error: string = '';

  constructor(private http: HttpClient, private router: Router, private formBuilder: FormBuilder) {}

  ngOnInit(): void {
    // Simulate fetching data from an API
    setTimeout(() => {
      this.isLoading = false;
    }, 2000);
  }

  onSubmit(): void {
    this.userData.name = this.formBuilder.getControl('name').value;
    this.userData.email = this.formBuilder.getControl('email').value;
    this.userData.age = parseInt(this.formBuilder.getControl('age').value, 10);

    if (!this.userData.email.includes('@')) {
      this.error = 'Invalid email format.';
      return;
    }

    if (this.userData.age < 18) {
      this.error = 'You must be 18 or older.';
      return;
    }

    this.submitForm();
  }

  private submitForm(): void {
    // Simulate sending data to the backend
    console.log('Submitting user data:', this.userData);

    // Replace this with your actual API call
    this.http.post('/api/users', this.userData).subscribe(
      (response) => {
        console.log('User created successfully:', response);
        alert('User created successfully!');
        this.router.navigate(['./profile']);
      },
      (error) => {
        console.error('Error creating user:', error);
        this.error = 'Failed to create user. Please try again.';
      }
    );
  }
}