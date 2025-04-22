import { Component, OnInit } from '@angular/core';

interface PollOption {
  name: string;
  votes: number;
}

@Component({
  selector: 'app-poll',
  templateUrl: './poll.component.html',
  styleUrls: ['./poll.component.css']
})
export class PollComponent implements OnInit {

  pollTitle: string = 'Awesome Poll Title';
  pollDescription: string = 'This is a great poll.';
  pollOptions: PollOption[] = [
    { name: 'Option 1', votes: 0 },
    { name: 'Option 2', votes: 0 },
    { name: 'Option 3', votes: 0 },
    { name: 'Option 4', votes: 0 }
  ];
  results: PollOption[] = [];

  ngOnInit(): void {
    this.updateResults();
  }

  vote(optionName: string): void {
    const option = this.pollOptions.find(o => o.name === optionName);
    if (option) {
      option.votes++;
      this.updateResults();
    }
  }

  private updateResults(): void {
    const totalVotes = this.pollOptions.reduce((sum, option) => sum + option.votes, 0);
    this.results = this.pollOptions.map(option => ({
      ...option,
      totalVotes: totalVotes
    }));
  }
}