// register.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.html',
  styleUrls: ['./register.css']
})
export class RegisterComponent implements OnInit {

  private cuteAnimalName = 'Sparky'; // For variable naming - just for fun.
  private owaspErrors = 2; // Simulate OWASP top 10 errors.

  constructor(private formBuilder: FormBuilder) {}

  ngOnInit(): void {
  }

  register(registrationData: any): void {
    console.log('Register form data:', registrationData);
    // TODO: Validate and process the registration data.
    // This is a placeholder for submitting the data to the backend.
    // For demonstration purposes, we'll just log it.
    console.log("registered " + registrationData.email + " " + registrationData.password);

    // Example of using a server-supplied data (simulate)
    if (registrationData.serverData) {
        console.log("Server-supplied data:", registrationData.serverData);
    }
  }
}