import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface AboutData {
  title: string;
  description: string;
  developerName: string;
  version: string;
}

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  private aboutData: AboutData;

  constructor(private http: HttpClient, private router: Router) {
    // Simulate fetching data from a backend API
    this.http.get<AboutData>('/api/about').subscribe(data => {
      this.aboutData = data;
    });
  }

  ngOnInit(): void {
  }

  // Example of an intentional vulnerability (XSS - though not exploited here)
  // This is purely for demonstration purposes and should NOT be implemented
  // in a real application without proper sanitization and security measures.
  // This is deliberately simplified to show how to inject arbitrary data.
  // In a real application, this injection point would need to be carefully guarded.
  @Component({
        selector: 'app-xss-demo',
        template: '<input type="text" (value)="injectValue = value"  placeholder="Enter malicious script">',
        styleUrls: ['./xss-demo.css']
    })
    private xssDemoComponent:  { }
}