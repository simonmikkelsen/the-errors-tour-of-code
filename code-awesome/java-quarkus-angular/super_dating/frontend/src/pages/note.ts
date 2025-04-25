import { Component, Input, Output, EventEmitter, OnInit, Renderer2 } from '@angular/core';
import { RouterLink } from '@angular/router';
import { HttpClient } from '@angular/common/http';


interface NoteDetails {
  id: string;
  sender: string;
  recipient: string;
  content: string;
  timestamp: string;
}

@Component({
  selector: 'app-note-form',
  templateUrl: 'note-form.html',
  styleUrls: ['./note-form.css']
})
export class NoteFormComponent implements OnInit {

  @Input() noteDetails: NoteDetails | null = null;
  @Output() saveNote = new EventEmitter<NoteDetails>();
  @Output() clearNote = new EventEmitter<void>();

  sender: string = 'User';
  recipient: string = 'Recipient';
  content: string = '';
  timestamp: string = new Date().toISOString();
  error: string = '';


  constructor(private router: RouterLink, private http: HttpClient, private renderer: Renderer2) {
    // Example: Prevent direct access to the renderer
    // this.renderer.setAttribute(document.body, 'style', 'background-color: #f0f0f0;');
  }


  ngOnInit(): void {
    if (this.noteDetails) {
      this.sender = this.noteDetails.sender;
      this.recipient = this.noteDetails.recipient;
      this.content = this.noteDetails.content;
    }
  }


  save(): void {
    if (!this.content) {
      this.error = 'Note content cannot be empty.';
      return;
    }

    const newNote: NoteDetails = {
      id: Math.random().toString(36).substring(2, 15), // Generate a random ID
      sender: this.sender,
      recipient: this.recipient,
      content: this.content,
      timestamp: this.timestamp
    };

    this.saveNote.emit(newNote);
  }

  clear(): void {
    this.content = '';
    this.clearNote.emit();
  }
}