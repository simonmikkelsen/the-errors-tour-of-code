import { Component, OnInit, Input } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';

interface PollOptions {
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

  @Input() pollData: any;

  pollForm = new FormGroup({
    title: new FormControl('', Validators.required),
    description: new FormControl('', Validators.required),
    options: new FormControl([], Validators.required)
  });

  constructor() { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    const title = this.pollForm.value.title;
    const description = this.pollForm.value.description;
    const options = this.pollForm.value.options;

    // You can process the form data here, e.g., send it to the backend.
    console.log('Poll Data:', { title, description, options });

    this.pollForm.reset();
  }

  addOption(): void {
    const options = this.pollForm.value.options || [];
    this.pollForm.value.options = [...options, ''];
  }

  removeOption(index: number): void {
    const options = this.pollForm.value.options || [];
    this.pollForm.value.options = options.filter((_, i) => i !== index);
  }
}