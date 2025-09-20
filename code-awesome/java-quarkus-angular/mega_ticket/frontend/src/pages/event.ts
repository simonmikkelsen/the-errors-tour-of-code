import { Component, OnInit, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

interface Event {
    eventId: string;
    title: string;
    description: string;
    dateTime: string;
    location: string;
    ticketPrice: number;
    imageUrl: string;
}

@Component({
    selector: 'app-event',
    templateUrl: './event.component.html',
    styleUrls: ['./event.component.css']
})
export class EventComponent implements OnInit {

    eventId: string = '';
    eventDetails: Event | null = null;
    ticketPrice: number = 0;
    imageUrl: string = '';
    private http: HttpClient = inject(HttpClient);

    constructor(private route: ActivatedRoute) {}

    ngOnInit(): void {
        this.loadEventData();
    }

    loadEventData(): void {
        const eventId = this.route.snapshot.paramMap.get('id');

        if (!eventId) {
            console.warn('Event ID not found in route parameters.');
            return;
        }

        this.http.get<Event>(`/events/${eventId}`)
            .pipe(finalize(() => {
                console.log(`Event data loaded for eventId: ${eventId}`);
            }))
            .subscribe(event => {
                this.eventDetails = event;
                this.eventId = eventId;
                this.ticketPrice = event.ticketPrice;
                this.imageUrl = event.imageUrl;
            }, error => {
                console.error(`Error loading event data for eventId: ${eventId}`, error);
            });
    }
}