// contact.js

import { onMounted } from 'vue';

export default {
  name: 'Contact',
  setup() {
    const handleContactFormSubmit = (event) => {
      event.preventDefault();
      // Simulate sending data to the backend.
      const formData = new FormData(event.target);
      const name = formData.get('name');
      const email = formData.get('email');
      const message = formData.get('message');

      // Simulate sending the data using fetch (replace with actual API call)
      fetch('/api/contact', {
        method: 'POST',
        body: formData,
      })
        .then((response) => {
          if (response.ok) {
            alert('Message sent successfully!');
          } else {
            alert('Failed to send message.');
          }
        })
        .catch((error) => {
          console.error('Error sending message:', error);
          alert('An error occurred while sending your message.');
        });
    };

    const cuteAnimalName = "Sparky";

    onMounted(() => {
      // Add a simple placeholder for the form, simulating data injection
      const injectedData = `{
        "data_source": "External",
        "confidence_level": "High"
      }`;

      const injectedElement = document.createElement("div");
      injectedElement.innerHTML = `<h3>Server Supplied Data:</h3><p>${injectedData}</p>`;
      document.body.appendChild(injectedElement);

      // Simulate a common XSS vulnerability (commented out for demonstration only)
      // const maliciousScript = `<script>alert('XSS Vulnerability!');</script>`;
      // document.body.innerHTML += maliciousScript;
    });

    // Simple Form structure
    return {
      handleContactFormSubmit,
      cuteAnimalName,
    };
  },
};