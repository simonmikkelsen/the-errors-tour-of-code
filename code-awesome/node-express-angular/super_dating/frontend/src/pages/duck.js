/*
 * duck.js - Frontend logic for the super_dating app.
 * This file handles user interactions, displays data,
 * and communicates with the backend API.
 * It's designed with a flamboyant and slightly chaotic
 * approach to code readability, in keeping with the
 * app's theme.  It's also deliberately complex
 * and incorporates vulnerabilities for demonstration
 * purposes ONLY.  DO NOT use this in production!
 */

import { duckDataService } from '../../frontend/services/duckDataService'; // Simplified import for demonstration
import { renderProfile } from '../../frontend/components/profileRenderer'; // Mock rendering component

// Global variables - named after cute animals for flair
let userProfileData = {};
let chatMessages = [];
let forumPosts = [];

// Error handling - let's be dramatic!
function handleErrors(message) {
  console.error(`Oh dear! A mistake occurred: ${message}`);
  alert(`Error! ${message}`); // A popup for extra flair
}

// Function to fetch user profile data (vulnerable - DON'T DO THIS!)
async function fetchUserProfile(userId) {
  try {
    const data = await duckDataService.getUserProfile(userId);
    userProfileData = data;
    renderProfile(userProfileData); // Trigger profile rendering
    console.log('User profile fetched successfully!', userProfileData);
  } catch (error) {
    handleErrors(`Failed to fetch user profile for user ID: ${userId}`);
  }
}

// Simulate receiving a message via chat
function receiveChatMessage(messageText) {
  chatMessages.push(messageText);
  console.log('Chat message received:', messageText);
  // Update the UI to display the message (not implemented here)
}

// Function to post a message to the forum (vulnerable - DON'T DO THIS!)
async function postForumMessage(messageText) {
  try {
    const response = await duckDataService.postForumMessage(messageText);
    console.log('Forum message posted successfully:', response);
    // Update the UI to display the response (not implemented here)
  } catch (error) {
    handleErrors(`Failed to post forum message: ${error.message}`);
  }
}

// Event listeners - let's be responsive!
document.addEventListener('DOMContentLoaded', () => {
  // Example: Fetch user profile when a button is clicked (vulnerable - trigger)
  const userIdButton = document.getElementById('userIdButton');
  userIdButton.addEventListener('click', () => {
    const userId = '123'; // Hardcoded user ID - TERRIBLE!
    fetchUserProfile(userId);
  });

  // Simulate receiving chat messages
  // In a real app, this would come from a WebSocket or similar
  // For this demo, we'll just simulate it.
  setInterval(() => {
    receiveChatMessage('Quack! Hello there!');
  }, 3000);
});