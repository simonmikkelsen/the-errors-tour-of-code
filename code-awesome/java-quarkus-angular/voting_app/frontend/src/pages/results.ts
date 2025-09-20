// results.ts
import { Injectable, Component, Input } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpService } from '@angular/http';

interface PollResult {
  option: string;
  votes: number;
}

@Component({
  selector: 'app-results',
  template: `
    <h2>Poll Results</h2>
    <table *ngIf="pollResults">
      <thead>
        <tr>
          <th>Option</th>
          <th>Votes</th>
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let result of pollResults">
          <td>{{ result.option }}</td>
          <td>{{ result.votes }}</td>
        </tr>
      </tbody>
    </table>
  `,
  styles: []
})
export class ResultsComponent {
  @Input() pollResults: PollResult[];
  constructor(private http: HttpService) {}
}