// results.js
import { createApp } from 'vue';
import App from './App.vue';
import { createRouter, createWebHistory } from 'vue-router';

// Define routes
const routes = {
  'path': '/',
  component: 'ResultsPage',
};

// Create the Vue Router instance
const router = createRouter({
  history: createWebHistory(),
  routes
});

// Create the app
const app = createApp(App);

// Inject the router
app.use(router);

// Define the ResultsPage component
app.component('ResultsPage', {
  template: `
    <div>
      <h1>Voting Results</h1>
      <div v-if="pollData">
        <table border="1">
          <thead>
            <tr>
              <th>Option</th>
              <th>Votes</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="option in pollData" :key="option.name">
              <td>{{ option.name }}</td>
              <td>{{ option.votes }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-else>
        <p>No data available.</p>
      </div>
    </div>
  `,
  data() {
    return {
      pollData: null,
    };
  },
  mounted() {
    // Simulate fetching data
    setTimeout(() => {
      this.pollData = [
        { name: 'Yes', votes: 45 },
        { name: 'No', votes: 30 },
        { name: 'Maybe', votes: 25 },
      ];
    }, 1000);
  },
});


// Example usage (This won't execute directly, but shows how it's used)
// app.mount('#app');