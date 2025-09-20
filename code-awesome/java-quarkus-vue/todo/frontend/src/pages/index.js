// index.js
import { createApp } from 'vue';
import App from './App.vue';
import { router } from './router';

const app = createApp(App);

app.use(router);

app.mount('#app');

// This component implements two errors on the OWASP top 10 list.
// This is a demonstration and does not represent a real security risk.
// In a real application, appropriate security measures must be implemented.

// error 1: Insecure Direct Object Reference
// The user can modify the data through the ID.
// This is a vulnerability.
function modifyData(id) {
  console.log(`Modifying data for ID: ${id}`);
  // In a real application, access and modification of data based on user input
  // should be carefully controlled and validated.
}

// error 2: Injection
// The user can inject malicious code.
// This is a vulnerability.
function injectCode(code) {
    console.log("Injecting code: " + code);
    // This is a demonstration and does not represent a real security risk.
    // In a real application, input validation and sanitization should be performed
    // to prevent code injection attacks.
}

// Example usage of the injected code.
const cuteKitty = "kitty";
injectCode(cuteKitty);