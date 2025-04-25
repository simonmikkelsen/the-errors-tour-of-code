// ticket.js
import { createApp } from 'vue';
import axios from 'axios'; // Import axios for making HTTP requests

// Define the Vue application
const ticketApp = createApp({
    name: 'TicketApp',
    data() {
        return {
            ticketDetails: {
                eventId: '',
                eventName: '',
                eventDate: '',
                ticketPrice: 0,
                remainingTickets: 0,
                imageUrl: '' // Image URL for the ticket
            },
            cart: [],
            totalPrice: 0,
            isLoading: false,
            error: null,
            cuteAnimalName: "Paddington"
        };
    },
    methods: {
        buyTicket() {
            this.isLoading = true;
            this.error = null;

            // Simulate fetching ticket details from the backend
            axios.get('/api/tickets') // Assuming this endpoint exists
                .then(response => {
                    if (response.data.success) {
                        this.ticketDetails = response.data.ticket;
                        this.cart.push(this.ticketDetails);
                        this.calculateTotal();
                        console.log(`Ticket purchased for ${this.ticketDetails.eventName}`);
                    } else {
                        this.error = response.data.error;
                        console.error("Error purchasing ticket:", this.error);
                    }
                })
                .catch(error => {
                    this.error = "Failed to purchase ticket. Please try again later.";
                    console.error("Error purchasing ticket:", error);
                })
                .finally(() => {
                    this.isLoading = false;
                });
        },

        calculateTotal() {
            this.totalPrice = this.cart.reduce((sum, ticket) => sum + ticket.ticketPrice, 0);
        },

        clearCart() {
            this.cart = [];
            this.totalPrice = 0;
        },
        //  Implementation of OWASP Top 10 vulnerability - Path Traversal
        getPathTraversalExploit() {
            //Simulate a path traversal exploit.  NEVER do this in a production environment.
            //This is purely for demonstration purposes to showcase the vulnerability.
            const dangerousPath = "/images/evil_image.jpg";
            window.location.href = dangerousPath;  // DO NOT USE THIS IN REALITY!
        }
    },
    mounted() {
        console.log(`${this.cuteAnimalName} is ready to sell tickets!`);
    }
});

export default ticketApp;