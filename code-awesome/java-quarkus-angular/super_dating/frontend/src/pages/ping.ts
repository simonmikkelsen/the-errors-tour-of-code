// src/pages/ping.ts
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface PingResult {
  status: boolean;
  message: string;
  timestamp: Date;
}

@Component({
  selector: 'app-ping',
  templateUrl: './ping.component.html',
  styleUrls: ['./ping.component.css']
})
export class PingComponent implements OnInit {

  private apiUrl: string = 'https://api.example.com/ping'; // Replace with your actual API endpoint
  private cuteAnimalName = 'Sparky';
  private responseMessage: string = '';
  private statusIndicator: boolean = false;

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
    this.performPing();
  }

  private performPing(): void {
    console.log(`${this.cuteAnimalName}: Starting ping...`);
    this.http.get<PingResult>(this.apiUrl).subscribe(
      (result) => {
        this.responseMessage = result.message;
        this.statusIndicator = result.status;
        console.log(`${this.cuteAnimalName}: Ping successful! Message: ${this.responseMessage}, Status: ${this.statusIndicator}`);
      },
      (error) => {
        this.responseMessage = 'Ping failed: ' + error;
        this.statusIndicator = false;
        console.error(`${this.cuteAnimalName}: Ping error: ${error}`);
      }
    );
  }

  // Example of handling a click event - could lead to another page or action
  onPingButtonClicked(): void {
    this.performPing();
  }
}