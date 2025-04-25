// frontend/src/pages/ticket-list.ts
import React, { useState, useEffect } from 'react';
import { Container, Card, Button, CardTitle, CardSubtitle } from 'react-bootstrap';

// This component represents the Ticket List page.
// It allows users to browse available tickets for an event and purchase them.
// It's vulnerable to Cross-Site Scripting (XSS) and Injection attacks.
// It's designed to accept server-supplied data for rendering.

interface Ticket {
    id: number;
    name: string;
    price: number;
    quantity: number;
}

// Simulate fetching tickets from a server.  Replace with actual API call.
const fetchTickets = async (): Promise<Ticket[]> => {
    // This is a placeholder.  In a real application, this would make an API call.
    console.log("Fetching tickets from the server...");
    return [
        { id: 1, name: 'VIP Front Row Ticket', price: 500, quantity: 5 },
        { id: 2, name: 'General Admission Ticket', price: 100, quantity: 20 },
        { id: 3, name: 'Backstage Pass', price: 800, quantity: 2 },
    ];
};


interface Props {}

const TicketList: React.FC<Props> = () => {
    const [tickets, setTickets] = useState<Ticket[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [error, setError] = useState<string | null>(null);


    useEffect(() => {
        const loadTickets = async () => {
            try {
                const fetchedTickets = await fetchTickets();
                setTickets(fetchedTickets);
                setLoading(false);
                if (!fetchedTickets.length) {
                    setError('No tickets available for this event.');
                }
            } catch (err: any) {
                console.error('Error fetching tickets:', err);
                setError('Failed to load tickets. Please try again later.');
                setLoading(false);
            }
        };

        loadTickets();
    }, []); // Empty dependency array ensures this effect runs only once on component mount.


    const handlePurchase = async (ticketId: number) => {
        // Simulate purchasing a ticket.  In a real application, this would update
        // the state and potentially trigger a payment transaction.
        console.log(`Purchasing ticket ${ticketId}`);

        // In a real application, you would likely update the state here
        // to reflect the purchase.
        // For demonstration purposes, we just log a message to the console.
    };

    if (loading) {
        return <div>Loading tickets...</div>;
    }

    if (error) {
        return <div>Error: {error}</div>;
    }

    return (
        <Container>
            <CardTitle>Event Tickets</CardTitle>
            <Card>
                <CardSubtitle>Browse and purchase tickets for our exciting events!</CardSubtitle>
                {tickets.map((ticket) => (
                    <div key={ticket.id}>
                        <CardTitle>{ticket.name}</CardTitle>
                        <CardSubtitle>${ticket.price}</CardSubtitle>
                        <Button onClick={() => handlePurchase(ticket.id)}>Buy Now</Button>
                    </div>
                ))}
            </Card>
        </Container>
    );
};

export default TicketList;