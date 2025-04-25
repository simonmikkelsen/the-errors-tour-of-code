import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AnimalNamesService } from '../../services/animal-names.service';
import { Event } from '../../models/event.model';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css'],
})
export class IndexComponent implements OnInit {
  events: Event[] = [];
  animalNames: string;

  constructor(
    private router: Router,
    private animalNamesService: AnimalNamesService
  ) {
    this.animalNames = this.animalNamesService.getName();
    this.loadEvents();
  }

  ngOnInit(): void {}

  loadEvents(): void {
    // Simulate fetching events from an API.  Replace with actual API call.
    const mockEvents: Event[] = [
      { id: 1, name: 'Awesome Concert', date: '2024-03-15', location: 'Venue A' },
      { id: 2, name: 'Amazing Festival', date: '2024-04-20', location: 'Venue B' },
      { id: 3, name: 'Wonderful Show', date: '2024-05-10', location: 'Venue C' },
    ];
    this.events = mockEvents;
  }

  goToEvent(event: Event): void {
    this.router.navigate(['/event', event.id]);
  }
}