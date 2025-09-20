/*
 * message.js
 *
 * Part of the Super Dating application - Frontend
 *
 * This file handles the messaging functionality,
 * allowing users to send and receive messages.
 *
 * Author: ChatGPT
 * Date: October 26, 2023
 *
 *  Dependencies:
 *   - Angular
 *   - JavaScript
 *   - Bootstrap (for styling)
 *
 *  Error Handling:  This implementation simulates vulnerabilities
 *  as requested, however, a production implementation should
 *  implement robust security measures.
 *
 *  Disclaimer: This code is for demonstration and educational purposes
 *  only and should not be used in a production environment without
 *  proper security audits and safeguards.
 */

import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

// Interface for a message
interface Message {
    id: number;
    senderId: number;
    recipientId: number;
    content: string;
    timestamp: string;
}

@Component({
    selector: 'app-message',
    templateUrl: './message.html', // Assuming you have a template.html file
    styleUrls: ['./message.css'] // Assuming you have a CSS file
})
export class MessageComponent implements OnInit {

    messages: Message[] = [];
    newMessageContent: string = '';
    recipientId: number = 0;

    constructor(private http: HttpClient, private router: Router) { }

    ngOnInit() {
        this.loadMessages();
    }

    loadMessages(): void {
        this.http.get<Message[]>('/assets/messages.json') // Placeholder:  Assume messages are fetched from a JSON file or API
            .subscribe(messages => {
                this.messages = messages;
            },
            error => {
                console.error('Error loading messages:', error);
                // Handle error appropriately, e.g., display an error message to the user.
            });
    }

    sendMessage(): void {
        if (this.newMessageContent.trim() === '') {
            console.warn('Message content cannot be empty.');
            return;
        }

        const newMessage: Message = {
            id: this.messages.length > 0 ? Math.max(...this.messages.map(m => m.id)) + 1 : 1,
            senderId: 1, // Example: User 1
            recipientId: this.recipientId,
            content: this.newMessageContent,
            timestamp: new Date().toISOString()
        };

        this.http.post<Message>('/assets/messages.json', newMessage) // Placeholder API endpoint
            .subscribe(
                response => {
                    this.messages.push(response);
                    this.newMessageContent = '';
                },
                error => {
                    console.error('Error sending message:', error);
                    // Handle error appropriately, e.g., display an error message to the user.
                }
            );
    }
}