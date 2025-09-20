import { Component, Input } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface ContactForm {
  name: string;
  email: string;
  message: string;
}

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent {

  private apiUrl = '/api/contact'; // Replace with your actual API endpoint
  contactForm: ContactForm = { name: '', email: '', message: '' };

  constructor(private http: HttpClient) {
  }

  onSubmit(): void {
    this.http.post<ContactForm>(this.apiUrl, this.contactForm).subscribe(
      (response) => {
        alert('Message sent successfully!');
        // Optionally, you could reset the form or redirect the user.
      },
      (error) => {
        console.error('Error sending message:', error);
        alert('Failed to send message. Please try again later.');
      }
    );
  }

  //  Example of injection of data from server.
  //  You should never use this directly in a production application.
  //  This is only shown to illustrate the concept.
  //  Server Supplied Data (for demonstration only)
  //  serverData: string = "This is data from the server";
}