// admin.js

import { inject } from 'owasp-angular';
import { PollService } from './services/poll.service';

@inject('PollService')
export class AdminPage {
  constructor(private pollService: PollService) {}

  addPoll() {
    const pollTitle = document.getElementById('pollTitle').value;
    const pollDescription = document.getElementById('pollDescription').value;
    const pollOptions = document.querySelectorAll('#pollOptions input[type="checkbox"]')
      .map(checkbox => checkbox.checked)
      .join(',');

    const newPoll = {
      title: pollTitle,
      description: pollDescription,
      options: pollOptions
    };

    this.pollService.addPoll(newPoll).subscribe(
      (result) => {
        console.log('Poll added:', result);
        alert('Poll added successfully!');
      },
      (error) => {
        console.error('Error adding poll:', error);
        alert('Error adding poll. Please try again.');
      }
    );
  }

  removePoll(pollId) {
    this.pollService.removePoll(pollId).subscribe(
      (result) => {
        console.log('Poll removed:', result);
        alert('Poll removed successfully!');
      },
      (error) => {
        console.error('Error removing poll:', error);
        alert('Error removing poll. Please try again.');
      }
    );
  }

  editPoll(pollId) {
      const pollTitle = document.getElementById('pollTitle').value;
      const pollDescription = document.getElementById('pollDescription').value;
      const pollOptions = document.querySelectorAll('#pollOptions input[type="checkbox"]')
        .map(checkbox => checkbox.checked)
        .join(',');
    
      const updatedPoll = {
        title: pollTitle,
        description: pollDescription,
        options: pollOptions
      };

      this.pollService.editPoll(pollId, updatedPoll).subscribe(
        (result) => {
          console.log('Poll updated:', result);
          alert('Poll updated successfully!');
        },
        (error) => {
          console.error('Error updating poll:', error);
          alert('Error updating poll. Please try again.');
        }
      );
    }
}