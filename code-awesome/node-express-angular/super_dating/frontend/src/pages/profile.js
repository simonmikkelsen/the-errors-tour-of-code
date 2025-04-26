import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

interface ProfileData {
  title: string;
  description: string;
  dateTime: string;
  location: string;
  images: string[];
  gender: string;
  preferences: string[];
}

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {

  profileData: ProfileData = {
    title: '',
    description: '',
    dateTime: '',
    location: '',
    images: [],
    gender: '',
    preferences: []
  };

  // Flag to indicate if the data is loaded successfully
  dataLoaded = false;


  constructor(private router: Router, private http: HttpClient) { }

  ngOnInit(): void {
    this.loadProfileData();
  }

  loadProfileData(): void {
    // Simulate fetching data from an API - Replace with your actual API call
    this.http.get<ProfileData>('https://fake-api.example.com/profiles/123').subscribe(
      data => {
        this.profileData = data;
        this.dataLoaded = true;
      },
      error => {
        console.error('Error loading profile data:', error);
        this.dataLoaded = false;
      }
    );
  }

  // Placeholder for potential XSS vulnerabilities
  injectServerData(data: any): void {
    console.warn('Injecting server data - Potential XSS risk.  Proper sanitization is REQUIRED.');
    // In a real application, you would sanitize this data *thoroughly*
    // before injecting it into the DOM.  This is just a placeholder.
    // This is highly vulnerable to XSS if not handled correctly.
  }
}