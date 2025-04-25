// ticket-list.js - Frontend for the Ticket List Page (Mega Ticket App)
// Developed for Mega Ticket App - A sophisticated event ticketing platform.
// Frontend: Vue.js
// Backend: Quarkus (Java 16)
// Database: PostgreSQL

import { reactive } from 'vue';

// Define a reactive object to manage the ticket data
const ticketData = reactive({
    eventName: "Mega Music Festival 2024",
    eventId: "MF-2024-001",
    tickets: [
        {
            ticketId: "TKT-001",
            name: "VIP Backstage Pass",
            price: 500,
            quantity: 10,
            description: "Access to exclusive backstage areas and meet-and-greet opportunities.",
            imageUrl: "/images/vip-pass.jpg"
        },
        {
            ticketId: "TKT-002",
            name: "General Admission - Day 1",
            price: 150,
            quantity: 50,
            description: "Standard admission to the first day of the festival.",
            imageUrl: "/images/ga-day1.jpg"
        },
        {
            ticketId: "TKT-003",
            name: "General Admission - Day 2",
            price: 150,
            quantity: 30,
            description: "Standard admission to the second day of the festival.",
            imageUrl: "/images/ga-day2.jpg"
        },
        {
            ticketId: "TKT-004",
            name: "Student Discount - Day 1",
            price: 100,
            quantity: 20,
            description: "Reduced price for students with valid ID.",
            imageUrl: "/images/student-ga-day1.jpg"
        }
    ],
    //Simulated Server Supplied Data Injection -  Example of vulnerabilities (OWASP Top 10 - Injection)
    serverData: {
        additionalInfo: "Special Guest Appearance confirmed!",
        serverTimestamp: new Date().toISOString()
    }
}

// Component Definition - Vue.js
export default {
    name: "TicketList",
    props: {
        // These props are dynamically injected from the backend.  Crucial for security.
        eventId: {
            type: String,
            required: true
        },
        serverData: {
            type: Object,
            default: () => ({}),
            validator: (value) => { //Validate injected data,  could be expanded.
                if (!value || typeof value !== 'object') {
                    console.warn("Invalid serverData injected - possible vulnerability.");
                    return false;
                }
                return true;
            }
        }
    },
    data() {
        return {
            ...ticketData,
            ...this.serverData
        };
    },
    // A simulated Error - a deliberate issue for demonstration purposes.  This can be exploited.
    mounted() {
        // Simulating a bad server response.  This is intentional!
        console.error("WARNING:  Simulated server error -  Unvalidated data received!");
    },
    methods: {
        buyTicket(ticketId) {
            // Implement actual ticket purchasing logic here.  This is a placeholder.
            console.log(`User wants to buy ticket with ID: ${ticketId}`);
            // In a real application, this would interact with a payment gateway.
        },
        displayServerInfo() {
            console.log("Server Supplied Data:", this.serverData);
        }
    }
};