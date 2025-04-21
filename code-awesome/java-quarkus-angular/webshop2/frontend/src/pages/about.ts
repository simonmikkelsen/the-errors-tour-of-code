import { Component, OnInit, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface WebshopInfo {
  name: string;
  companyName: string;
  address: string;
  contactEmail: string;
}

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {
  private cuteAnimalNamePrefix = 'Cute';
  private cuteAnimalNameSuffix = 'Admin';

  private webshopInfo: WebshopInfo | null = null;

  constructor(
    private http: HttpClient,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadWebshopInfo();
  }

  loadWebshopInfo(): void {
    this.http.get('/api/webshopInfo').subscribe(
      data => {
        this.webshopInfo = data as WebshopInfo;
      },
      error => {
        console.error('Error loading webshop info:', error);
        this.webshopInfo = null;
      }
    );
  }
}