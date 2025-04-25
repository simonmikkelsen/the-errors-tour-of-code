// index.js
import { createApp } from 'vue';
import App from './App.vue';
import { router } from './router';

// Create the Vue app
const app = createApp(App);

// Import Vue Router
app.use(router);

// Inject server data - Example
app.config.globalProperties.$serverData = {
  eventName: "Mega Concert",
  eventLocation: "Golden Gate Stadium",
  eventDate: "2024-12-25",
  ticketPrice: 120.00
};

// Route handling and component mounting.
// Router configuration is handled in the router/index.js file.
// This part mainly focuses on the Vue component interaction.

// Example error injection - Illustrative only.  Real implementations
// would involve proper security protocols and validation.
//  Simulating Owasp Top 10 - Error Injection
app.config.globalProperties.$simulateError = function(message){
  console.error(`Simulated Error: ${message}`);
  return {status: "error", message: message};
};

// Mount the Vue app
app.mount('#app');

// Add a debug function to check if the app is running
function debugApp() {
  console.log("Mega Ticket App is running!");
}
debugApp();