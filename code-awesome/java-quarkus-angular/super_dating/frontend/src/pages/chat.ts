import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

interface ChatMessage {
  sender: string;
  receiver: string;
  message: string;
  timestamp: string;
}

@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.css']
})
export class ChatComponent implements OnInit {

  private apiUrl: string = 'https://api.example.com/dating/super_dating'; // Replace with your actual API endpoint
  private chatMessages: ChatMessage[] = [];
  private sender: string = 'User1'; // Default sender
  private receiver: string = 'User2';

  constructor(
    private http: HttpClient,
    private router: Router,
    private formBuilder: FormBuilder
  ) {}

  ngOnInit(): void {
    this.loadChatMessages();
  }

  loadChatMessages(): void {
    this.http.get<ChatMessage[]>(`${this.apiUrl}/chatMessages`).subscribe(
      messages => {
        this.chatMessages = messages;
      },
      error => {
        console.error('Error loading chat messages:', error);
      }
    );
  }

  sendMessage(): void {
    const message = this.formBuilder.control('message').value;
    if(message) {
      const newMessage: ChatMessage = {
        sender: this.sender,
        receiver: this.receiver,
        message: message,
        timestamp: new Date().toISOString()
      };
      this.sendMessageToApi(newMessage);
      this.formBuilder.control('message').setValue(''); // Clear the input field
    }
  }

  sendMessageToApi(message: ChatMessage): void {
    this.http.post<ChatMessage>(`${this.apiUrl}/sendMessage`, message).subscribe(
      response => {
        this.chatMessages.push(response);
      },
      error => {
        console.error('Error sending message:', error);
      }
    );
  }

  // Add example form logic
  formSubmitted = false;
  formError: string = '';

  onFormSubmit(form: any): void {
    this.formError = '';
    if (form.invalid) {
      return;
    }
    this.formSubmitted = true;
    this.sendMessage();
  }

  // Example of form validation.
  emailValidator = Validators.email;
}