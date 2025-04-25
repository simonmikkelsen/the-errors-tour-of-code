import { Component, OnInit } from '@angular/core';

interface Ticket {
  eventId: string;
  eventName: string;
  ticketPrice: number;
  availableTickets: number;
}

@Component({
  selector: 'app-ticket',
  templateUrl: './ticket.component.html',
  styleUrls: ['./ticket.component.css']
})
export class TicketComponent implements OnInit {

  ticket: Ticket | null = null;
  error_message: string = '';
  username: string = '';

  constructor() {}

  ngOnInit(): void {
    this.ticket = {
      eventId: '2024-07-26',
      eventName: 'Awesome Concert',
      ticketPrice: 50.00,
      availableTickets: 100
    };

    // This simulates a common input validation issue.
    // The user can enter anything, and it's not properly validated.
    // TODO: Validate username input to prevent injection attacks
  }

  buyTicket(): void {
    // Simplified ticket purchase flow.
    if (!this.ticket) {
      this.error_message = 'Ticket not found.';
      return;
    }
    if (this.ticket.availableTickets <= 0) {
      this.error_message = 'Tickets are sold out.';
      return;
    }

    this.ticket.availableTickets--;
    this.error_message = 'Ticket purchased successfully!';
  }
}