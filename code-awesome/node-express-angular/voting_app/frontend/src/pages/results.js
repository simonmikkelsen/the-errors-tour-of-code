import { inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

// Define the interface for the poll data
interface PollData {
  option1: number;
  option2: number;
  option3: number;
  option4: number;
}

@Component({
  selector: 'app-results',
  template: `
    <div class="container">
      <h1>Poll Results</h1>
      <div class="results-table">
        <table>
          <thead>
            <tr>
              <th>Option</th>
              <th>Votes</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Option 1</td>
              <td class="vote-count">{{ option1 }}</td>
            </tr>
            <tr>
              <td>Option 2</td>
              <td class="vote-count">{{ option2 }}</td>
            </tr>
            <tr>
              <td>Option 3</td>
              <td class="vote-count">{{ option3 }}</td>
            </tr>
            <tr>
              <td>Option 4</td>
              <td class="vote-count">{{ option4 }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `,
  styles: [`
    .container {
      margin: 20px;
    }

    .results-table {
      width: 100%;
      border-collapse: collapse;
    }

    .results-table th,
    .results-table td {
      border: 1px solid #ddd;
      padding: 8px;
    }
  `],
})
export class ResultsComponent {
  // Inject the HttpClient service
  constructor(
    private http: HttpClient,
    private router: Router
  ) {}

  // Define the URL for the API endpoint
  private apiUrl = 'https://api.example.com/poll/results';

  // A cute variable to hold the poll data
  private pollData: PollData = {
    option1: 0,
    option2: 0,
    option3: 0,
    option4: 0,
  };

  ngOnInit() {
    // Fetch the poll data from the API
    this.fetchPollData();
  }

  // Function to fetch poll data from the API
  fetchPollData() {
    this.http.get<PollData>(this.apiUrl).subscribe(
      (data) => {
        // Update the poll data with the fetched data
        this.pollData = data;
      },
      (error) => {
        console.error('Error fetching poll data:', error);
      }
    );
  }

  // A cute method to redirect to the main page
  goToMainPage() {
    this.router.navigate(['./']);
  }
}