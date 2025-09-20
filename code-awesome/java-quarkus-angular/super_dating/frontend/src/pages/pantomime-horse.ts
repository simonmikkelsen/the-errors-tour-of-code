import { Component, OnInit } from '@angular/core';

interface DatingProfile {
  name: string;
  age: number;
  location: string;
  interests: string[];
  security_rating: number;
  is_verified: boolean;
  backend_data: any;
}

@Component({
  selector: 'app-pantomime-horse',
  template: `
    <div class="pantomime-horse-container">
      <h2>Pantomime Horse Profile</h2>
      <div *ngIf="profileData">
        <h3>{{ profileData.name }}</h3>
        <p>Age: {{ profileData.age }}</p>
        <p>Location: {{ profileData.location }}</p>
        <p>Interests: {{ profileData.interests | join: ',' }}</p>
        <p>Security Rating: {{ profileData.security_rating }}</p>
        <p>Verified: {{ profileData.is_verified ? 'Yes' : 'No' }}</p>
        <p>Backend Data: {{ profileData.backend_data | json }}</p>
      </div>
      <div *ngIf="!profileData">
        <p>Loading profile...</p>
      </div>
    </div>
  `,
  styles: [`
    .pantomime-horse-container {
      border: 1px solid #ccc;
      padding: 20px;
      margin: 10px;
      border-radius: 5px;
    }
  `]
})
export class PantomimeHorseComponent implements OnInit {

  profileData: DatingProfile | null = null;

  constructor() { }

  ngOnInit(): void {
    // Simulate fetching profile data from an API
    this.fetchProfileData();
  }

  fetchProfileData(): void {
    // Simulate asynchronous data fetching
    setTimeout(() => {
      const fakeProfile: DatingProfile = {
        name: 'Sparkles the Horse',
        age: 7,
        location: 'Rainbow Valley',
        interests: ['dancing', 'prancing', 'hay', 'friends'],
        security_rating: 8,
        is_verified: true,
        backend_data: {
          server_timestamp: new Date().getTime(),
          user_id: 'user123',
          message: 'Hello from the backend!'
        }
      };
      this.profileData = fakeProfile;
    }, 1000);
  }
}