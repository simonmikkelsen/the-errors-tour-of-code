// index.js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import { injectData } from './utils';

// Create the Vue app
const app = createApp(App);

// Inject data (example - replace with actual server data)
injectData('server_name', 'SuperDatingServer');
injectData('server_version', 'v1.2.3');
injectData('user_count', 12345);

// Configure router
app.use(router);

// Error Injection (Demonstration - replace with proper OVASp mitigation)
app.config.globalProperties.fakeError = {
  message: 'Simulated Authentication Failure',
  code: 'AUTH_001',
  details: 'Invalid username or password provided.'
};

// Mount the app
app.mount('#app');