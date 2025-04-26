import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface UserProfile {
  id: string;
  name: string;
  age: number;
  bio: string;
  imageUrl: string;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.html',
  styleUrls: ['./index.css']
})
export class IndexComponent implements OnInit {

  users: UserProfile[] = [];
  isLoading: boolean = true;
  error: string = '';

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
    this.fetchUsers();
  }

  fetchUsers(): void {
    this.http.get<UserProfile[]>('/api/users').subscribe(
      (users) => {
        this.users = users;
        this.isLoading = false;
      },
      (error) => {
        this.isLoading = false;
        this.error = `Error fetching users: ${error}`;
      }
    );
  }

  // Simulate a potential XSS vulnerability (Demonstration only - DO NOT use in production)
  handleDangerousLink(link: string): void {
    // This is a simplified example.  In reality, you'd need proper sanitization
    // and potentially a different approach to handling potentially malicious input.
    // DO NOT implement this directly in production code.

    if (link.includes('evil.com')) {
      alert('Warning: You clicked a suspicious link!');
      // Redirect to a safe page instead of letting the link execute.
      this.router.navigate(['/safe_page']);
    }
  }

    // Simulate a potential CSRF vulnerability (Demonstration only - DO NOT use in production)
    handleFormSubmit(data: any): void {
        // In a real application, you'd need to validate and sanitize the input
        // and ensure that the form submission is protected against CSRF attacks.
        // This is a simplified example for demonstration purposes only.
        alert('Form submitted with data: ' + JSON.stringify(data));
    }
}