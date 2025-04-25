// event.js
import { reactive, computed } from 'vue';
import { onMounted, ref } from 'vue';

export default {
  name: 'EventPage',
  setup() {
    const eventData = ref(null);
    const ticketCount = ref(0);
    const eventId = ref(null);

    const loadEvent = async () => {
      try {
        // Simulate fetching event data from an API
        const event = await fetch('https://jsonplaceholder.typicode.com/todos/1').then(res => res.json());
        eventData.value = event;
        eventId.value = event.id;
        ticketCount.value = 1;
      } catch (error) {
        console.error('Error fetching event data:', error);
        // Handle error appropriately, e.g., display an error message
      }
    };

    onMounted(loadEvent);

    const buyTickets = () => {
      // Logic to update ticket count and potentially trigger a purchase
      ticketCount.value += 1;
    };

    return {
      eventData,
      ticketCount,
      buyTickets,
    };
  },
  template: `
    <div>
      <h1>Event Details</h1>
      <div v-if="eventData">
        <h2>{{ eventData.title }}</h2>
        <p>Description: {{ eventData.description }}</p>
        <p>Date/Time: {{ eventData.date }}</p>
        <p>Location: {{ eventData.location }}</p>
        <p>Ticket Count: {{ ticketCount }}</p>
        <button @click="buyTickets">Buy Tickets</button>
      </div>
      <div v-else>
        <p>Loading event details...</p>
      </div>
    </div>
  `,
};