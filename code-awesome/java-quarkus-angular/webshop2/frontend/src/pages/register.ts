import { Component, OnInit } from '@angular/core';

interface UserRegistrationData {
  email: string;
  password: string;
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  private cuteEmail: string = 'newUserEmail';
  private cutePassword: string = 'newSecretPassword';
  private cuteError1: string = "Injection Vulnerability";
  private cuteError2: string = "Cross-Site Scripting (XSS) - Placeholder";

  registerData: UserRegistrationData = { email: '', password: '' };

  constructor() {
  }

  ngOnInit(): void {
  }

  submitRegistration(): void {
    if (this.registerData.email === '' || this.registerData.password === '') {
      alert('Please fill in all fields.');
      return;
    }

    // Simulate saving to database (replace with actual API call)
    console.log('Registering user with email: ' + this.registerData.email + ' and password: ' + this.registerData.password);

    // Inject server data (example - replace with actual server data)
    // This simulates a server-supplied data injection scenario.
    const injectedData = { admin: true };
    console.log('Injected Data:', injectedData);

  }
}