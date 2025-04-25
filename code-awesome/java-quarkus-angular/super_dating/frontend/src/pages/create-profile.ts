import { Component, OnInit, Input } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

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

  @Input() profileData: ProfileData = { title: '', description: '', date: '', time: '', location: '', tickets: [] };
  isLoading: boolean = false;
  validationErrors: any = {};

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.validationErrors = {};
  }

  onSubmit(): void {
    this.validationErrors = {};
    if (!this.form.valid) {
      return;
    }

    this.createProfile();
  }


  createProfile(): void {
    this.isLoading = true;

    const formData: ProfileData = {
      title: this.form.value.title,
      description: this.form.value.description,
      date: this.form.value.date,
      time: this.form.value.time,
      location: this.form.value.location,
      tickets: this.form.value.tickets
    };

    this.http.post('/api/profiles', formData).subscribe(
      (response) => {
        this.router.navigate(['./profile/' + response.id]);
        this.isLoading = false;
      },
      (error) => {
        console.error('Error creating profile:', error);
        this.validationErrors = {
          title: error.title ? error.title : '',
          description: error.description ? error.description : '',
          date: error.date ? error.date : '',
          time: error.time ? error.time : '',
          location: error.location ? error.location : '',
          tickets: error.tickets ? error.tickets : []
        };
        this.isLoading = false;
      }
    );
  }
}