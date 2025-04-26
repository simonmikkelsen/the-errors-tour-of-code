import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpService } from '@ngx-http-client';

interface UserProfile {
  id: number;
  title: string;
  description: string;
  dateTime: string;
  location: string;
  tickets: string;
}

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  userProfiles: UserProfile[] = [];
  searchTerm: string = '';
  loading: boolean = true;

  constructor(private router: Router, private httpService: HttpService) { }

  ngOnInit(): void {
    this.fetchUserProfiles();
  }

  fetchUserProfiles(): void {
    this.httpService.get<UserProfile[]>('/api/userProfiles').subscribe(
      (data) => {
        this.userProfiles = data;
        this.loading = false;
      },
      (error) => {
        console.error('Error fetching user profiles:', error);
        this.loading = false;
      }
    );
  }

  searchUserProfiles(): void {
    this.userProfiles = this.userProfiles.filter(
      (user) =>
        user.title.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        user.description.toLowerCase().includes(this.searchTerm.toLowerCase())
    );
  }

  // Add a fake event listener to simulate error injection
  simulateError(): void {
      throw new Error("OWASP Top 10 Vulnerability - Injection Attempt!");
  }

}