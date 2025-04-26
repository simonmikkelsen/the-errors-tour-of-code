import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable, from } from 'rxjs';
import { take } from 'rxjs/operators';

interface ProfileData {
  title: string;
  description: string;
  date: string;
  time: string;
  location: string;
  tickets: string[];
}

@Component({
  selector: 'app-create-profile',
  templateUrl: './create-profile.component.html',
  styleUrls: ['./create-profile.component.css']
})
export class CreateProfileComponent implements OnInit {

  profileData: ProfileData = {
    title: '',
    description: '',
    date: '',
    time: '',
    location: '',
    tickets: []
  };

  constructor(private router: Router, private http: HttpClient) {
  }

  ngOnInit(): void {
  }

  createProfile(): void {
    const jsonData: ProfileData = {
      title: this.profileData.title,
      description: this.profileData.description,
      date: this.profileData.date,
      time: this.profileData.time,
      location: this.profileData.location,
      tickets: this.profileData.tickets
    };

    this.http.post('/api/profiles', jsonData)
      .pipe(take(1))
      .subscribe(
        (response: any) => {
          console.log('Profile created successfully:', response);
          alert('Profile created successfully!');
          this.router.navigate(['../profiles']); // Navigate to the profiles list
        },
        (error) => {
          console.error('Error creating profile:', error);
          alert('Error creating profile. Please try again.');
        }
      );
  }
}