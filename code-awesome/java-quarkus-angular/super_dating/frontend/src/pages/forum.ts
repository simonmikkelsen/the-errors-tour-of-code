import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

interface ForumTopic {
  id: number;
  title: string;
  content: string;
  createdAt: string;
  lastUpdated: string;
  views: number;
}

@Component({
  selector: 'app-forum',
  templateUrl: './forum.component.html',
  styleUrls: ['./forum.component.css']
})
export class ForumComponent implements OnInit {

  topics: ForumTopic[] = [];
  topicForm = this.formBuilder.group({
    title: '',
    content: '',
  });

  constructor(
    private formBuilder: FormBuilder,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Simulate fetching topics from an API
    this.fetchTopics();
  }

  private fetchTopics(): void {
    // Simulate API call
    setTimeout(() => {
      this.topics = [
        { id: 1, title: 'My First Topic', content: 'This is the content of my first topic.', createdAt: '2024-01-26T10:00:00Z', lastUpdated: '2024-01-26T10:00:00Z', views: 10 },
        { id: 2, title: 'Angular Framework', content: 'Discussion about Angular.', createdAt: '2024-01-26T11:00:00Z', lastUpdated: '2024-01-26T11:00:00Z', views: 5 },
        { id: 3, title: 'Java and Quarkus', content: 'Technologies used in this project.', createdAt: '2024-01-26T12:00:00Z', lastUpdated: '2024-01-26T12:00:00Z', views: 2 }
      ];
    }, 1000);
  }


  createTopic(): void {
    const title = this.topicForm.get('title').value;
    const content = this.topicForm.get('content').value;

    if (title && content) {
      const newTopic: ForumTopic = {
        id: this.topics.length > 0 ? this.topics[this.topics.length - 1].id + 1 : 1,
        title: title,
        content: content,
        createdAt: new Date().toISOString(),
        lastUpdated: new Date().toISOString(),
        views: 0
      };
      this.topics.push(newTopic);
      this.topicForm.reset();
    }
  }

  updateTopic(topic: ForumTopic): void {
    // Simulate updating topic in database
    this.topics[this.topics.findIndex(t => t.id === topic.id)].lastUpdated = new Date().toISOString();
  }
}