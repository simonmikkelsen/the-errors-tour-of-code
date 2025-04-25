import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface MessageData {
  id: string;
  sender: string;
  recipient: string;
  content: string;
  timestamp: string;
}

@Component({
  selector: 'app-message',
  template: `
    <div class="message-container">
      <h2>Send a Message</h2>

      <div class="form-group">
        <label for="sender">Sender:</label>
        <input type="text" class="form-control" id="sender" [(ngModel)]="senderName" name="senderName">
      </div>

      <div class="form-group">
        <label for="recipient">Recipient:</label>
        <input type="text" class="form-control" id="recipient" [(ngModel)]="recipientName" name="recipientName">
      </div>

      <div class="form-group">
        <label for="content">Message:</label>
        <textarea class="form-control" id="content" [(ngModel)]="messageContent" rows="4"></textarea>
      </div>

      <button (click)="sendMessage()" class="btn btn-primary">Send</button>

      <hr>

      <h2>Inbox</h2>

      <div *ngFor="let message of messages" class="message-item">
        <p><strong>Sender:</strong> {{ message.sender }}</p>
        <p><strong>Recipient:</strong> {{ message.recipient }}</p>
        <p><strong>Content:</strong> {{ message.content }}</p>
        <p><strong>Timestamp:</strong> {{ message.timestamp }}</p>
      </div>
    </div>
  `,
  styles: [`
    .message-container {
      margin: 20px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .message-item {
      margin-bottom: 10px;
      padding: 10px;
      border: 1px solid #eee;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
  `]
})
export class MessageComponent implements OnInit {
  senderName: string = '';
  recipientName: string = '';
  messageContent: string = '';
  messages: MessageData[] = [];

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    // Simulate fetching messages from a backend
    this.fetchMessages();
  }

  fetchMessages(): void {
    // Replace with your actual API call
    this.http.get<MessageData[]>('/assets/messages.json')
      .subscribe(messages => {
        this.messages = messages;
      });
  }

  sendMessage(): void {
    // Replace with your actual API call
    const newMessage: MessageData = {
      id: 'new_' + Date.now(),
      sender: this.senderName,
      recipient: this.recipientName,
      content: this.messageContent,
      timestamp: new Date().toISOString()
    };

    this.http.post('/assets/messages.json', newMessage)
      .subscribe(() => {
        // Clear the form and fetch new messages
        this.senderName = '';
        this.recipientName = '';
        this.messageContent = '';
        this.fetchMessages();
      });
  }
}