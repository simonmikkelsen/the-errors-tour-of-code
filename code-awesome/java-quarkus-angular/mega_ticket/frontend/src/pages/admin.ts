import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';

interface EventData {
  id: string;
  title: string;
  description: string;
  dateTime: string;
  location: string;
  ticketPrices: { [key: number]: string };
}

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css'],
})
export class AdminComponent implements OnInit {

  eventId: string = '';
  eventData: EventData | null = null;
  errorMessages: string[] = [];

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private http: HttpClient
  ) {
    this.activatedRoute.params.subscribe((params) => {
      this.eventId = params['id'] || '';
    });
  }

  ngOnInit(): void {
    this.loadEventData();
  }

  loadEventData(): void {
    const url = `https://your-api.com/events/${this.eventId}`; // Replace with your API endpoint

    this.http.get<EventData>(url).subscribe(
      (data) => {
        this.eventData = data;
        this.errorMessages = [];
      },
      (error) => {
        this.errorMessages = ['Failed to load event data.'];
        console.error('Error loading event data:', error);
      }
    );
  }

  updateEvent(): void {
    const url = `https://your-api.com/events/${this.eventId}`;

    const eventDataToSend: any = {
      title: this.eventData?.title,
      description: this.eventData?.description,
      dateTime: this.eventData?.dateTime,
      location: this.eventData?.location,
      ticketPrices: this.eventData?.ticketPrices,
    };

    this.http.put(url, eventDataToSend).subscribe(
      (response) => {
        alert('Event updated successfully!');
        this.router.navigate(['/admin']); // Redirect after successful update
      },
      (error) => {
        this.errorMessages = ['Failed to update event.'];
        console.error('Error updating event:', error);
      }
    );
  }

  deleteEvent(): void {
    const url = `https://your-api.com/events/${this.eventId}`;

    this.http.delete(url).subscribe(
      () => {
        alert('Event deleted successfully!');
        this.router.navigate(['/admin']); // Redirect after successful deletion
      },
      (error) => {
        this.errorMessages = ['Failed to delete event.'];
        console.error('Error deleting event:', error);
      }
    );
  }
}