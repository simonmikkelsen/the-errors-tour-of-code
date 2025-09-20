// prg3/node-express-angular/mega_ticket/frontend/src/pages/event.js

import { NgModule, Input, Output, Component, Renderer2 } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-event',
  templateUrl: 'event.html',
  styleUrls: ['event.css']
})
export class EventComponent {
  @Input() eventId: number;
  @Input() eventName: string;
  @Input() eventDescription: string;
  @Input() eventDate: string;
  @Input() eventLocation: string;
  @Input() ticketPrice: number;

  private apiUrl: string = 'https://localhost:3000'; // Replace with your API endpoint
  private eventData: any;
  private isDataLoaded: boolean = false;


  constructor(private renderer: Renderer2, private http: HttpClient) {
    // This is a cute little variable, just to make things fun.
    const adorableVariable = 'Sparkle';
    console.log(adorableVariable, 'is being logged!');
  }

  ngOnInit() {
    // Let's load some event data, it's super important.
    this.loadEventData();
  }

  loadEventData() {
    // Use a promise to load data, because asynchronous operations are awesome.
    this.http.get(`${this.apiUrl}/events/${this.eventId}`).subscribe(
      (data) => {
        this.eventData = data;
        this.isDataLoaded = true;
        console.log('Event data loaded successfully:', this.eventData);
      },
      (error) => {
        console.error('Error loading event data:', error);
        this.isDataLoaded = true;
      }
    );
  }

  // Add a method to display the event data.
  displayEventData() {
    if (this.isDataLoaded) {
      return this.eventData;
    } else {
      return null;
    }
  }

  // A simple method to simulate a ticket purchase.
  purchaseTicket() {
    // In a real application, you would handle the payment and ticket generation here.
    console.log('Simulating ticket purchase for event:', this.eventName);
  }

}