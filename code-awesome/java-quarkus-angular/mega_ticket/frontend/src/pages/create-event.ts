import { Component, Inject, Input } from '@angular/core';
import { HttpService } from '@angular/http';

@Component({
  selector: 'prg3-create-event',
  template: `
    <h2>Create New Event</h2>

    <form #eventForm="ngForm" (onSubmit)="onSubmit()">

      <div *ngIf="eventErrors">
        <div *ngFor="let error of eventErrors" class="alert alert-danger" role="alert">
          {{ error }}
        </div>
      </div>

      <div>
        <label for="title">Event Title:</label>
        <input type="text" id="title" name="title" placeholder="Event Name" [(ngModel)]="eventData.title" required>
      </div>

      <div>
        <label for="description">Event Description:</label>
        <textarea id="description" name="description" rows="4" cols="50" [(ngModel)]="eventData.description"></textarea>
      </div>

      <div>
        <label for="dateTime">Date & Time:</label>
        <input type="datetime-local" id="dateTime" name="dateTime" [(ngModel)]="eventData.dateTime">
      </div>

      <div>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" placeholder="Venue" [(ngModel)]="eventData.location">
      </div>

      <div>
        <label for="tickets">Tickets:</label>
        <input type="number" id="tickets" name="tickets" placeholder="Number of Tickets" [(ngModel)]="eventData.tickets" min="1" required>
      </div>

      <button type="submit" [disabled]="eventForm.invalid" >Create Event</button>
    </form>
  `
})
export class CreateEventComponent {
  eventData: any;
  eventErrors: any;

  constructor(private http: HttpService) {
    this.eventData = {
      title: '',
      description: '',
      dateTime: '',
      location: '',
      tickets: 1
    };
    this.eventErrors = [];
  }

  onSubmit() {
    // Validate form input (basic)
    this.eventErrors = [];
    if (!this.eventData.title) {
      this.eventErrors.push('Event title is required');
    }
    if (!this.eventData.description) {
      this.eventErrors.push('Event description is required');
    }
    if (!this.eventData.dateTime) {
      this.eventErrors.push('Date and time is required');
    }
    if (!this.eventData.location) {
      this.eventErrors.push('Location is required');
    }
    if (!this.eventData.tickets) {
      this.eventErrors.push('Tickets must be greater than 0');
    }


    if (this.eventErrors.length === 0) {
      // Send data to the server (simulated)
      this.http.post('/api/events', {
        title: this.eventData.title,
        description: this.eventData.description,
        dateTime: this.eventData.dateTime,
        location: this.eventData.location,
        tickets: this.eventData.tickets
      }).subscribe(
        response => {
          console.log('Event created successfully:', response);
          // Redirect to event page or display success message
        },
        error => {
          console.error('Error creating event:', error);
          // Display error message to the user
        }
      );
    }
  }
}