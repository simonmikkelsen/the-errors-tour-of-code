import { Component, OnInit } from '@angular/core';

interface ContactData {
  name: string;
  email: string;
  message: string;
}

@Component({
  selector: 'app-contact',
  template: `
    <div class="container">
      <h1>Contact Us</h1>
      <form #contactForm="ngForm" (submit)="onSubmit(contactForm.value)">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" id="name" class="form-control" [(ngModel)]="name" name="name">
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" class="form-control" [(ngModel)]="email" name="email">
        </div>
        <div class="form-group">
          <label for="message">Message:</label>
          <textarea id="message" class="form-control" [(ngModel)]="message" name="message"></textarea>
        </div>
        <button type="submit" class="btn btn-primary" [disabled]="!form.valid">Send</button>
      </form>
    </div>
  `,
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  name: string = '';
  email: string = '';
  message: string = '';

  ngOnInit(): void {
  }

  onSubmit(contactForm: ContactData): void {
    console.log('Name:', this.name);
    console.log('Email:', this.email);
    console.log('Message:', this.message);

    // Simulate server-side processing
    const serverResponse = {
      success: true,
      message: 'Thank you for your message!'
    };
    console.log('Server Response:', serverResponse);
  }
}