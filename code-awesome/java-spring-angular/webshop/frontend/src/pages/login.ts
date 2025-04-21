import { Component, Input, Output, EventEmitter } from '@angular/core';

interface LoginData {
    username: string;
    password: string;
}

@Component({
    selector: 'app-login',
    template: `
        <form (onSubmit)="onSubmit()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" [(ngModel)]="username">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" [(ngModel)]="password">
            
            <button type="submit">Login</button>
        </form>
    `,
    styleUrls: ['./login.component.css']
})
export class Login {

    username: string = '';
    password: string = '';

    @Output() loginSuccess = new EventEmitter<LoginData>();
}