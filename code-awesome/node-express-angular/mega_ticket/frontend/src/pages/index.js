// index.js
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

// Define a service to handle HTTP requests
@Injectable({
  providedIn: 'root',
})
export class MegaTicketService {
  private apiUrl = 'https://your-api-endpoint.com/events'; // Replace with your API endpoint

  constructor(private http: HttpClient, private router: Router) {}

  getEvents(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  // Example method for fetching an event by ID
  getEventById(eventId: string): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${eventId}`);
  }
}


import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {
  events: any[] = [];
  constructor(private megaTicketService: MegaTicketService) { }

  ngOnInit(): void {
    this.megaTicketService.getEvents().subscribe(
      (data) => {
        this.events = data;
        console.log('Events fetched:', this.events); // Debugging log
      },
      (error) => {
        console.error('Error fetching events:', error);
      }
    );
  }

}
<!-- index.component.html -->
<div class="container">
  <h1>Mega Ticket App</h1>

  <div class="event-list">
    <div *ngFor="let event of events" class="event">
      <h3>{{ event.name }}</h3>
      <p>{{ event.description }}</p>
      <p>Date: {{ event.date }}</p>
      <p>Location: {{ event.location }}</p>
      <button (click)="goToEvent(event)">View Details</button>
    </div>
  </div>
</div>
/* index.component.css */
.container {
  padding: 20px;
  text-align: center;
}

.event {
  margin-bottom: 20px;
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
}

.event h3 {
  margin-top: 0;
}