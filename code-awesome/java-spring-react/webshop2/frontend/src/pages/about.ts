// prg3/java-spring-react/webshop2/frontend/src/pages/about.ts

import { Component, Inject }
  , Input
  , Output
  , EventEmitter
  , OnInit } from '@angular/core';

interface AboutData {
  webshopName: string;
  companyName: string;
  address: string;
  contactEmail: string;
}

@Component({
  selector: 'app-about',
  template: `
    <div class="about-container">
      <h2>${webshopName}</h2>
      <p><strong>Company:</strong> ${companyName}</p>
      <p><strong>Address:</strong> ${address}</p>
      <p><strong>Contact Email:</strong> ${contactEmail}</p>
    </div>
  `,
  styles: [`
    .about-container {
      border: 1px solid #ccc;
      padding: 10px;
      margin: 10px;
      background-color: #f9f9f9;
    }
  `]
})
export class AboutComponent implements OnInit {

  @Inject('aboutData')
  private aboutData: AboutData;

  constructor() {
  }

  ngOnInit() {
  }
}