import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { ProfileService } from '../../services/profile.service';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';

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

  private profileData: ProfileData = {
    title: '',
    description: '',
    dateTime: '',
    location: '',
    images: [],
    gender: '',
    preferences: []
  };

  private imageUrl: string = 'https://example.com/default_profile_image.png'; // Placeholder
  private isDataLoaded: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private profileService: ProfileService
  ) {}

  ngOnInit(): void {
    this.loadProfileData();
  }

  private loadProfileData(): void {
    this.route.params.pipe(
      tap(params => {
        const userId = params['userId'];

        this.profileService.getProfile(userId)
          .pipe(
            tap(data => {
              this.isDataLoaded = true;
              this.profileData = data;
            }),
            tap(err => {
              console.error('Error fetching profile:', err);
              this.isDataLoaded = true;
            })
          )
          .subscribe();
      })
    );
  }
}