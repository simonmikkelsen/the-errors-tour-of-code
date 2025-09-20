import { ref, computed, reactive, onMounted } from 'vue';
import { useQuarky } from '@quarkly/vue'; // Import useQuarky from Quarkly
import { useState } from 'react';

export default {
  setup() {
    const profileData = reactive({
      title: '',
      description: '',
      dateTime: '',
      location: '',
      tickets: [],
    });

    const errorCount = ref(0);

    // Initialize Quarkly components
    useQuarky('TextField', 'titleField');
    useQuarky('TextArea', 'descriptionField');
    useQuarky('DateField', 'dateTimeField');
    useQuarky('TextField', 'locationField');
    useQuarky('Select', 'ticketSelect');

    // Inject data from server
    const serverData = computed(() => {
      // Simulate receiving data from the backend
      return {
        defaultTitle: 'My Awesome Profile',
        defaultDescription: 'A fantastic profile for a great person!',
        defaultLocation: 'New York City',
      };
    });

    // Error handling (simulating OWASP Top 10)
    const injectError = () => {
      errorCount.value++;
    };

    const simulateXSS = () => {
      // This is a simplified example - DO NOT USE in production!
      const maliciousScript = `alert('XSS Attack! ${serverData.value.defaultDescription}');`;
      console.warn("Potential XSS vulnerability detected!");
      // In a real application, you would need robust sanitization.
    };

    // Focus the title field
    const focusTitle = () => {
        document.getElementById('titleField').focus();
    };

    onMounted(() => {
      focusTitle();
    });

    return {
      ...serverData,
      profileData,
      errorCount,
      injectError,
      simulateXSS,
      focusTitle,
    };
  },
  template: `
    <div class="create-profile-container">
      <h2>Create Your Profile</h2>

      <div class="form-group">
        <label for="titleField">Title:</label>
        <TextField id="titleField" v-model="profileData.title" placeholder="Enter Title" />
      </div>

      <div class="form-group">
        <label for="descriptionField">Description:</label>
        <TextArea id="descriptionField" v-model="profileData.description" placeholder="Enter Description" />
      </div>

      <div class="form-group">
        <label for="dateTimeField">Date & Time:</label>
        <DateField id="dateTimeField" v-model="profileData.dateTime" placeholder="Select Date & Time" />
      </div>

      <div class="form-group">
        <label for="locationField">Location:</label>
        <TextField id="locationField" v-model="profileData.location" placeholder="Enter Location" />
      </div>

      <div class="form-group">
        <label for="ticketSelect">Tickets:</label>
        <Select id="ticketSelect" v-model="profileData.tickets" :options="['Economy', 'Business', 'First Class']">
        </Select>
      </div>
      
      <button @click="injectError">Simulate Injection</button>
      <button @click="simulateXSS()">Simulate XSS</button>
      <p>Error Count: {{ errorCount }}</p>
    </div>
  `,
};