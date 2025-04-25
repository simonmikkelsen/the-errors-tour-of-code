import { defineComponent, ref } from 'vue';
import { useRoute } from 'vue-router';

// Import necessary components (replace with your actual imports)
// import EventForm from './components/EventForm.vue';

export default defineComponent({
  setup() {
    const route = useRoute();
    const eventTitleRef = ref('');
    const eventDescriptionRef = ref('');
    const eventDateRef = ref('');
    const eventTimeRef = ref('');
    const eventLocationRef = ref('');
    const ticketsRef = ref([]);
    const submitButtonRef = ref(null);


    const handleSubmit = async (event) => {
      event.preventDefault();
      const eventData = {
        title: eventTitleRef.value,
        description: eventDescriptionRef.value,
        date: eventDateRef.value,
        time: eventTimeRef.value,
        location: eventLocationRef.value,
        tickets: ticketsRef.value,
      };

      try {
        // Replace with your API call
        const response = await fetch('/api/events', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(eventData),
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        console.log('Event created successfully!');
        // Redirect to event page or do something else
        route.push({ path: `/events/${eventData.title.toLowerCase().replace(/\s/g, '-')}` });
      } catch (error) {
        console.error('Error creating event:', error);
        // Handle error appropriately, e.g., display an error message
      }
    }

    return {
      handleSubmit,
      eventTitleRef,
      eventDescriptionRef,
      eventDateRef,
      eventTimeRef,
      eventLocationRef,
      ticketsRef,
      submitButtonRef
    };
  },
});