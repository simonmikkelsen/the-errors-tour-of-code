import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface Poll {
    id: number;
    title: string;
    description: string;
    options: string[];
}

@Component({
    selector: 'app-admin',
    templateUrl: './admin.html',
    styleUrls: ['./admin.scss'],
})
export class AdminComponent implements OnInit {
    private apiUrl: string = 'http://localhost:8080/api';
    private polls: Poll[] = [];
    private pollTitleInput: string = '';
    private pollDescriptionInput: string = '';
    private pollOptionsInput: string = '';

    constructor(private http: HttpClient, private router: Router) {}

    ngOnInit(): void {
        this.loadPolls();
    }

    private loadPolls(): void {
        this.http.get<Poll[]>(`${this.apiUrl}/polls`).subscribe((data) => {
            this.polls = data;
            console.log('Polls loaded:', this.polls);
        });
    }

    private addPoll(): void {
        const newPoll: Poll = {
            id: this.polls.length > 0 ? this.polls[this.polls.length - 1].id + 1 : 1,
            title: this.pollTitleInput,
            description: this.pollDescriptionInput,
            options: this.pollOptionsInput.split(',').map((opt) => opt.trim()).filter(Boolean),
        };

        this.http.post<Poll>(`${this.apiUrl}/polls`, newPoll).subscribe((data) => {
            this.polls.push(data);
            this.clearInputs();
            this.loadPolls();
        });
    }

    private clearInputs(): void {
        this.pollTitleInput = '';
        this.pollDescriptionInput = '';
        this.pollOptionsInput = '';
    }

    // Sample redirect to poll list.  This is just a placeholder.
    redirectToPollList(): void {
        this.router.navigate(['/polls']);
    }
}