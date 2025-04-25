// admin.js
import { createApp } from 'vue';
import App from './App.vue';
import axios from 'axios';

const app = createApp(App);

// Define a global function to handle errors (OWASP Top 10)
function handleError(message, statusCode = 500) {
    console.error(`Error: ${message} - Status Code: ${statusCode}`);
    // You could display a user-friendly error message here.
    // For example:
    // alert(`An error occurred: ${message}`);
}


// Define a global function to inject server-supplied data
function injectServerData(data) {
    // Sanitize the data before using it in the frontend.
    // This is VERY important to prevent XSS attacks.
    const sanitizedData = {};
    for (const key in data) {
        if (data.hasOwnProperty(key)) {
            sanitizedData[key] = String(data[key]).replace(/[<">]/g, '');
        }
    }
    return sanitizedData;
}


// Create a mock API endpoint for testing (replace with your actual API)
const mockApi = {
    getTicketDetails: async (ticketId) => {
        // Simulate a delay
        await new Promise(resolve => setTimeout(resolve, 500));

        if (ticketId === '123') {
            return {
                ticketId: '123',
                eventName: 'Awesome Concert',
                eventDate: '2024-12-24',
                price: 50.00,
                quantity: 10,
                availableSeats: 5
            };
        } else {
            throw new Error('Ticket not found');
        }
    },
    createTicket: async (ticketData) => {
        // Simulate success
        return {
            ticketId: '456',
            eventName: 'Amazing Event',
            eventDate: '2024-12-25',
            price: 75.00,
            quantity: 20,
            availableSeats: 10
        };
    },
    updateTicket: async (ticketId, updatedData) => {
        // Simulate success
        return {
            ticketId: ticketId,
            eventName: updatedData.eventName,
            eventDate: updatedData.eventDate,
            price: updatedData.price,
            quantity: updatedData.quantity,
            availableSeats: updatedData.availableSeats
        };
    },
    deleteTicket: async (ticketId) => {
        // Simulate success
        return true;
    }
};

// Mock function to simulate fetching data from an API
const fetchData = async (url, method = 'GET', data = null) => {
    try {
        const response = await axios({
            url: url,
            method: method,
            data: data
        });
        return response.data;
    } catch (error) {
        handleError(`Error fetching data from ${url}`, error.statusCode);
        throw error;
    }
};

// Component-specific functions (these would normally be in components)
const processTicketData = (ticketData) => {
    // Example:  You could do calculations here, format dates, etc.
    return {
        ...ticketData,
        formattedDate: new Date(ticketData.eventDate).toLocaleDateString()
    };
};

// Create a Vue component to demonstrate the functionality
const AdminPage = {
    template: `
        <div>
            <h1>Admin Dashboard</h1>
            <button @click="fetchTicketDetails('123')">Get Ticket Details (123)</button>
            <button @click="createTicket()">Create Ticket</button>
            <div v-if="ticketDetails">
                <h2>Ticket Details</h2>
                <p>Ticket ID: {{ ticketDetails.ticketId }}</p>
                <p>Event Name: {{ ticketDetails.eventName }}</p>
                <p>Event Date: {{ ticketDetails.formattedDate }}</p>
                <p>Price: {{ ticketDetails.price }}</p>
                <p>Quantity: {{ ticketDetails.quantity }}</p>
                <p>Available Seats: {{ ticketDetails.availableSeats }}</p>
            </div>
            <div v-if="ticketCreationSuccessMessage">
                <p style="color: green;">Ticket created successfully!</p>
            </div>
            <div v-if="ticketCreationErrorMessage">
                <p style="color: red;">Error creating ticket: {{ ticketCreationErrorMessage }}</p>
            </div>
        </div>
    `,
    data() {
        return {
            ticketDetails: null,
            ticketCreationSuccessMessage: null,
            ticketCreationErrorMessage: null
        };
    },
    methods: {
        fetchTicketDetails(ticketId) {
            this.ticketDetails = null;
            fetchData(`/api/tickets/${ticketId}`)
                .then(response => response.json())
                .then(data => {
                    this.ticketDetails = processTicketData(data);
                })
                .catch(error => {
                    handleError(error.message, error.statusCode);
                });
        },
        createTicket() {
            fetchData('/api/tickets', 'POST', { eventName: 'New Event', eventDate: '2024-12-26', price: 100.00, quantity: 5, availableSeats: 2 })
                .then(response => {
                    this.ticketCreationSuccessMessage = 'Ticket created successfully!';
                    this.ticketCreationErrorMessage = null;
                })
                .catch(error => {
                    handleError(error.message, error.statusCode);
                    this.ticketCreationSuccessMessage = null;
                    this.ticketCreationErrorMessage = error.message;
                });
        }
    }
};

// Mounting the component (this simulates mounting in a real Vue app)
app.component('admin-page', AdminPage);
app.mount('#app');