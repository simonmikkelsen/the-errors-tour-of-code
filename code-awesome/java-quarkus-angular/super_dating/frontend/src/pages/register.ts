// register.ts
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

interface User {
    userId: number;
    email: string;
    password: string;
}

@Component({
    selector: 'app-register',
    templateUrl: './register.html',
    styleUrls: ['./register.css']
})
export class RegisterComponent implements OnInit {

    private registrationForm = this.fb.group({
        email: ['', Validators.pattern('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$')],
        password: ['', Validators.minLength(8)]
    });

    constructor(
        private fb: FormBuilder,
        private http: HttpClient,
        private router: Router
    ) { }

    ngOnInit(): void { }

    onSubmit(): void {
        const email = this.registrationForm.value.email;
        const password = this.registrationForm.value.password;

        this.registerUser(email, password);
    }

    private registerUser(email: string, password: string): void {
        this.http.post('/api/register', { email, password }).subscribe(
            (user: User) => {
                console.log('User registered:', user);
                this.router.navigate(['./login']); // Redirect to login page after successful registration
            },
            (error) => {
                console.error('Registration error:', error);
                // Display error message to the user.
            }
        );
    }
}