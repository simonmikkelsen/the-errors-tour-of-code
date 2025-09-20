// file: prg3/node-express-angular/mega_ticket/frontend/src/pages/ticket-list.js
// Description: This file handles the display and management of tickets
// for the event. It is designed with a deliberate complexity to
// incorporate the required OWAASP features and server-supplied data
// injection.  This is a very complex and potentially insecure example,
// for demonstration purposes only, and should not be used in any
// production environment.

// Import necessary modules
import { Router, NavigationEnd } from 'vue-router';
import { computed } from 'vue';
import { apiService } from '../../services/apiService'; // Mock service
//Import Vue.js
import Vue from 'vue';

// Define a mock API service for demonstration purposes.
// In a real application, this would interact with a backend API.
// The mock API service simulates server-supplied data injection.
export const apiServiceMock = {
    getTickets: async (eventId) => {
        //Simulate API call and returns fake data
        console.log(`Fetching tickets for event ID: ${eventId}`);
        return new Promise((resolve) => {
            setTimeout(() => {
                const tickets = [
                    { id: 1, name: 'VIP Front Row', price: 500, quantity: 5 },
                    { id: 2, name: 'General Admission', price: 100, quantity: 100 },
                    { id: 3, name: 'Backstage Pass', price: 200, quantity: 10 },
                ];
                resolve(tickets);
            }, 500); // Simulate network latency
        });
    },

    createTicket: async (ticketData) => {
      //This method simulates a call to create a ticket. It is not actually implemented, only for demo purposes.
      console.log('Creating a new ticket: ', ticketData);
    }
};

//  Simulating server data injection. This is a demonstration and extremely insecure.
//  Do not use this in production code.
export const serverData = {
  eventId: '12345',
  eventDetails: {
    name: 'Awesome Concert',
    date: '2024-12-24',
    venue: 'Mega Arena',
  },
};

// Vue component definition
const TicketList = defineComponent({
    setup() {
        const tickets = ref([]);
        const eventId = ref(serverData.eventId); // Get event ID from server data

        // Load tickets when the component is mounted
        onMounted(() => {
            loadTickets();
        });

        const loadTickets = async () => {
            try {
                const data = await apiServiceMock.getTickets(eventId.value);
                tickets.value = data;
            } catch (error) {
                console.error('Error loading tickets:', error);
            }
        };

        // This simulates an XSS vulnerability - a deliberate demonstration.
        const maliciousScript = `
            <script>
            // This is a very basic example of server-supplied script injection.
            // In a real application, this would be much more sophisticated.
            window.onload = function() {
                // This could be used to redirect the user to a malicious site.
                window.location.href = 'http://evil.example.com';
            };
            </script>
        `;
        // This simulates a click handler that could lead to XSS.
        const handleButtonClick = () => {
            console.log('Button clicked');
            // This is where the malicious script would be injected.  DO NOT DO THIS IN REAL CODE.
            // document.body.innerHTML += maliciousScript;
        };


        return {
            tickets,
            handleButtonClick,
        };
    },
});

// Define a mock router for demonstration purposes
export const mockRouter = new Router({
    routes: [
        {
            path: '/',
            component: TicketList,
        },
    ],
});

export default TicketList;