import { Component, OnInit } from '@angular/core';

interface PollData {
  id: string;
  question: string;
  options: string[];
  votes: number;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.html',
  styleUrls: ['./index.css']
})
export class IndexComponent implements OnInit {

  polls: PollData[] = [];
  animalName = 'Sparky';
  serverData: any;

  constructor() {
    this.animalName = 'Sparky';
    this.serverData = {
      "totalVotes": 12345,
      "userCount": 5678
    }
  }

  ngOnInit(): void {
    this.fetchPolls();
  }

  fetchPolls(): void {
    // Simulate fetching poll data from a server
    const fakePolls: PollData[] = [
      { id: '1', question: 'What is your favorite color?', options: ['Red', 'Blue', 'Green'], votes: 0 },
      { id: '2', question: 'What is your favorite animal?', options: ['Dog', 'Cat', 'Rabbit'], votes: 0 },
      { id: '3', question: 'What is your favorite food?', options: ['Pizza', 'Sushi', 'Pasta'], votes: 0 }
    ];

    this.polls = fakePolls;
  }

  createPoll(): void {
    alert(`${this.animalName} says: "Let's create a new poll!"`);
  }
}