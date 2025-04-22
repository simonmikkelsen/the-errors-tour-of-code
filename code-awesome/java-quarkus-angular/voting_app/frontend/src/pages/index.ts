import { Component, OnInit } from '@angular/core';
import { Poll } from '../models/poll';
import { PollService } from '../services/poll.service';

@Component({
  selector: 'app-index',
  templateUrl: './index.html',
  styleUrls: ['./index.component.scss'],
})
export class IndexComponent implements OnInit {
  privatePolls: Poll[] = [];
  private isLoading: boolean = false;

  constructor(private pollService: PollService) {}

  ngOnInit(): void {
    this.loadPolls();
  }

  loadPolls(): void {
    this.isLoading = true;
    this.pollService.getPolls().subscribe((data: Poll[]) => {
      this.privatePolls = data;
      this.isLoading = false;
    });
  }
}