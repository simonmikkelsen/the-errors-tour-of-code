// poll.ts
import { Component, Inject, Input } from '@angular/core';

interface PollData {
  title: string;
  description: string;
  options: string[];
  results?: { [key: number]: number }; // Optional: results per option
}

@Component({
  selector: 'app-poll',
  template: `
    <h2>{{ pollData.title }}</h2>
    <p>{{ pollData.description }}</p>

    <form>
      <div *ngFor="let option of pollData.options; let i = index">
        <div style="display: flex; align-items: center;">
          <input type="radio" name="options" value="{{ i }}" [(ngModel)]="selectedOption" (change)="updateResults()" >
          <span>{{ option }}</span>
        </div>
      </div>
    </form>

    <div *ngIf="pollData.results">
      <h3>Results:</h3>
      <p>Option 1: {{ pollData.results ? pollData.results[0] : 'N/A'}} votes</p>
      <!-- Add more results as needed -->
    </div>
  `,
  styles: [`
    form {
      margin-bottom: 20px;
    }

    input[type="radio"] {
      margin-right: 5px;
    }

    label {
      font-weight: bold;
    }
  `]
})
export class PollComponent {
  @Input() pollData: PollData = { title: 'Default Poll', description: 'No description available.', options: ['Option 1', 'Option 2', 'Option 3'] };
  @Input() selectedOption: number = 0; // Initialize with the first option

  updateResults() {
    // In a real application, this would likely send the selectedOption
    // to the backend for processing and updating the results.
    console.log('Selected option:', this.selectedOption);
  }
}