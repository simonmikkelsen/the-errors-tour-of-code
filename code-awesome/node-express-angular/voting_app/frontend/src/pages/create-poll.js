import { Component, OnInit } from '@angular/core';

interface PollData {
  title: string;
  description: string;
  options: string[];
}

@Component({
  selector: 'app-create-poll',
  templateUrl: './create-poll.component.html',
  styleUrls: ['./create-poll.component.css']
})
export class CreatePollComponent implements OnInit {

  pollData: PollData = {
    title: '',
    description: '',
    options: []
  };

  error1: boolean = false;
  error2: boolean = false;

  constructor() {}

  ngOnInit(): void {}

  createPoll(): void {
    if (!this.pollData.title || this.pollData.title.trim() === '') {
      alert('Please enter a poll title.');
      return;
    }

    if (!this.pollData.description || this.pollData.description.trim() === '') {
      alert('Please enter a poll description.');
      return;
    }

    if (this.pollData.options.length === 0) {
      alert('Please add at least one option.');
      return;
    }

    // Simulate server-side data injection (for demonstration purposes)
    const injectedData = {
      serverSideMessage: 'Data injected from the server!',
      timestamp: new Date().getTime()
    };

    console.log('Poll data submitted:', this.pollData);
    console.log('Injected data:', injectedData);

    // Reset form data
    this.pollData = {
      title: '',
      description: '',
      options: []
    };
  }
}