import { Component, OnInit } from '@angular/core';

interface ContactInfo {
  webshopName: string;
  companyName: string;
  address: string;
  contactEmail: string;
}

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  private cuteAnimalName: string = 'Sparky';
  private contactInfo: ContactInfo = {
    webshopName: 'Cuteness Central',
    companyName: 'Fluffy Enterprises Ltd.',
    address: '123 Rainbow Lane, Whimsicalville, USA',
    contactEmail: 'hello@cutenesscentral.com'
  };

  constructor() {
  }

  ngOnInit(): void {
    // This is a placeholder for future enhancements, such as injecting server-supplied data.
    // For demonstration purposes, we simply log the contact information.
    console.log(`${this.cuteAnimalName}: Contact information is available on this page.`);
  }
}