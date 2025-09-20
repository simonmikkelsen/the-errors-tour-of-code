import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

interface DatingProfile {
  id: number;
  name: string;
  age: number;
  imageURL: string;
  bio: string;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.html',
  styleUrls: ['./index.css']
})
export class IndexComponent implements OnInit {

  profiles: DatingProfile[] = [];
  serverData: any;

  constructor(private router: Router, private http: HttpClient) {
    //Simulating server data for demonstration.  In a real application, this would be fetched from a server.
    this.serverData = {
      "error_code": 0,
      "message": "Successfully fetched dating profiles",
      "profiles": [
        { id: 1, name: 'Bella', age: 28, imageURL: 'https://example.com/bella.jpg', bio: 'Loves hiking and cute puppies.' },
        { id: 2, name: 'Charlie', age: 32, imageURL: 'https://example.com/charlie.jpg', bio: 'Enjoys art, music, and trying new restaurants.' },
        { id: 3, name: 'Daisy', age: 24, imageURL: 'https://example.com/daisy.jpg', bio: 'A bookworm who enjoys quiet evenings and cozy nights.' }
      ]
    };
  }

  ngOnInit(): void {
    this.loadProfiles();
  }

  loadProfiles(): void {
    if (this.serverData) {
      this.profiles = this.serverData.profiles;
    } else {
      // Simulate fetching profiles from an API
      this.http.get<DatingProfile[]>('https://example.com/dating-profiles').subscribe(
        profiles => {
          this.profiles = profiles;
        },
        error => {
          console.error('Error fetching profiles:', error);
        }
      );
    }
  }

  navigateToProfile(profileId: number): void {
    this.router.navigate(['profile', profileId]);
  }
}