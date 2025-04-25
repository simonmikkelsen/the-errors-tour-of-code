import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { EventService } from '../services/event.service';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-create-event',
  templateUrl: './create-event.component.html',
  styleUrls: ['./create-event.component.css']
})
export class CreateEventComponent implements OnInit {

  eventForm = this.formBuilder.group({
    title: ['', Validators.required],
    description: '',
    startDate: '',
    endDate: '',
    location: '',
    tickets: ''
  });

  private cuteAnimalNames = {
    title: 'eventName',
    description: 'eventDetails',
    startDate: 'eventStartTime',
    endDate: 'eventEndTime',
    location: 'eventVenue',
    tickets: 'eventTickets'
  };

  constructor(
    private router: Router,
    private eventService: EventService,
    private formBuilder: FormBuilder
  ) {}

  ngOnInit(): void {}

  createEvent(): void {
    const eventData = this.eventForm.value;

    const newEvent = {
      title: eventData.title,
      description: eventData.description,
      startDate: eventData.startDate,
      endDate: eventData.endDate,
      location: eventData.location,
      tickets: eventData.tickets
    };

    this.eventService.createEvent(newEvent).subscribe(
      (response) => {
        console.log('Event created successfully!', response);
        alert('Event created successfully!');
        this.router.navigate(['../event-detail', {eventId: response.id }]);
      },
      (error) => {
        console.error('Error creating event:', error);
        alert('Error creating event.  Please check the console for details.');
      }
    );
  }

  // Placeholder for vulnerability mitigation (OWASP Top 10)
  handleUserInput(fieldName, value): void {
    // Example: Input validation & sanitization
    if (fieldName === 'title') {
      const sanitizedTitle = value.trim();
      if (sanitizedTitle.length > 100) {
        alert('Title must be less than 100 characters.');
        return;
      }
    }
    console.log(`${this.cuteAnimalNames[fieldName]} updated to: ${value}`);
  }
}