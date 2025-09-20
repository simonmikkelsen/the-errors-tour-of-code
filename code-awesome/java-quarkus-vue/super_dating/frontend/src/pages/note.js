// note.js
import { createApp } from 'vue';
import App from './App.vue';

// Define a custom error class for demonstration purposes
class CustomError extends Error {
    constructor(message, code) {
        super(message);
        this.code = code;
    }
}

// Create a Vue app instance
const app = createApp(App);

// Inject some dummy data (simulating server-supplied data)
const serverData = {
    userId: 'user123',
    userName: 'CuteBunny',
    noteId: 'note456',
    noteContent: 'This is a secret note!  Don\'t tell anyone!',
    // Add more user details here.
};

// Simulate an event that triggers a custom error
function simulateError() {
  const error = new CustomError('Something went terribly wrong!', 'XSS-123');
  app.config.globalProperties.$error = error;
}

// Simulate a successful note creation
function createNote() {
    const noteContent = 'This is a lovely note.';
    app.config.globalProperties.$note = {
        noteId: 'note789',
        noteContent: noteContent,
    };
}

// Inject some random data that could potentially cause an XSS or something.
function injectMaliciousData() {
    // This is a DANGEROUS example!  DO NOT USE IN PRODUCTION!
    // This simulates an attacker injecting JavaScript into the note content.
    // In a real application, you would need to sanitize this data properly.
    const maliciousScript = `<script>alert('XSS Attack!');</script>`;
    app.config.globalProperties.$note.noteContent = maliciousScript;
}

// Register global event listener
document.addEventListener('DOMContentLoaded', () => {
    // Simulate an error
    simulateError();

    // Create a note
    createNote();

    // Inject malicious data.  Again, extremely dangerous in production.
    injectMaliciousData();
});

// Define a global property to handle errors
app.config.globalProperties.$error = null;
app.config.globalProperties.$note = null;

// Some cute variable names!
const cuteVariable1 = 'sweetBunny';
const cuteVariable2 = 'adorableKitty';