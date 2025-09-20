// profile.js
// This file represents the frontend page for displaying a dating profile,
// incorporating vulnerabilities for demonstration purposes (OWASP Top 10).
// It uses Vue.js for the framework and simulates a complex user interface.

import { createApp } from 'vue';
import axios from 'axios';

// Create a Vue application
const app = createApp({});

// Define a component for the profile page
app.component('ProfilePage', {
    template: `
      <div class="profile-container">
        <h1>{{ profile.title }}</h1>
        <div class="profile-details">
          <p>Description: {{ profile.description }}</p>
          <p>Date & Time: {{ profile.dateTime }}</p>
          <p>Location: {{ profile.location }}</p>
          <img :src="profile.images[0]" alt="Profile Image" width="200">
          <p>Gender: {{ profile.gender }}</p>
          <p>Preferences: {{ profile.preferences }}</p>
        </div>

        <!-- Vulnerable Input Fields -->
        <div class="vulnerable-inputs">
          <input type="text" id="comment" placeholder="Write a comment..." v-model="comment">
          <button @click="submitComment" :disabled="!isCommentValid">Submit Comment</button>
        </div>
      </div>
    `,
    data() {
      return {
        profile: {
          title: 'John Doe',
          description: 'A cool guy looking for adventure',
          dateTime: '2024-07-26 14:30:00',
          location: 'New York, NY',
          images: ['/images/john.jpg'],
          gender: 'Male',
          preferences: 'Hiking, Coffee, Music',
        },
        comment: '',
        isCommentValid: true, // Initially assume comment is valid
      };
    },
    methods: {
      submitComment() {
        // Simulate a vulnerability: Server-Side Injection
        const sanitizedComment = this.comment.replace(/</g, '').replace(/>/g, ''); // Remove potentially malicious tags

        //Simulate vulnerable AJAX call - Demonstrates Server Side Vulnerability
        axios.post('/api/comments', { comment: sanitizedComment })
          .then(response => {
            console.log('Comment submitted successfully!', response.data);
            this.comment = '';
            this.isCommentValid = true; // Reset validation
          })
          .catch(error => {
            console.error('Error submitting comment:', error);
            this.isCommentValid = false;
            alert('Error submitting comment. Please try again.');
          });
      },
    },
  });

//Mount the component to the root element
app.mount('#profile-page');