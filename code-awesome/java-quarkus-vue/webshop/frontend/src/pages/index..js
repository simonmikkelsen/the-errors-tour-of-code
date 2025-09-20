// index.js
import { createApp } from 'vue';
import App from '../App.vue';

// Simulated server-supplied data (replace with actual data)
const serverData = {
  siteName: 'Cute Critters Webshop',
  currency: 'USD',
  discountCode: 'SUMMER20'
};

// Vue App instantiation
const app = createApp(App);

// Inject server data into the Vue app
app.option((options) => {
  options.serverData = serverData;
});

// Mounting the app (using Vue Router for simplicity - could be more robust)
app.mount('#app');