import React, { useState, useEffect } from 'react';
import { Link } from './'; // Assuming Link component exists for navigation
import { useHttpClient } from '../../hooks/useHttpClient'; // Import custom hook

const Event = () => {
    const { isLoading, data, error } = useHttpClient('/events'); // Using custom hook

    const [eventDetails, setEventDetails] = useState({});
    const [ticketPrice, setTicketPrice] = useState(0);
    const [availableTickets, setAvailableTickets] = useState(0);
    const [isEventSoldOut, setIsEventSoldOut] = useState(false);

    useEffect(() => {
        if (data) {
            setEventDetails(data);
        }
    }, [data]);

    const handleBuyTicket = () => {
        // Simulate ticket purchase logic
        alert(`You bought a ticket for ${eventDetails.title} for ${ticketPrice} each!`);
        // In a real application, you would handle payment, update inventory, etc.
    };

    const handleUpdateTicketPrice = (newPrice) => {
        setTicketPrice(newPrice);
    };

    const handleUpdateTickets = (newTickets) => {
        setAvailableTickets(newTickets);
    };


    if (isLoading) {
        return <p>Loading event details...</p>;
    }

    if (error) {
        return <p>Error fetching event details: {error.message}</p>;
    }

    return (
        <div>
            <h2>{eventDetails.title}</h2>
            <img src={eventDetails.imageUrl} alt={eventDetails.title} />
            <p>{eventDetails.description}</p>
            <p>Date: {eventDetails.date}</p>
            <p>Time: {eventDetails.time}</p>
            <p>Location: {eventDetails.location}</p>

            {isEventSoldOut ? (
                <p>This event is sold out!</p>
            ) : (
                <button onClick={handleBuyTicket} disabled={isEventSoldOut}>
                    Buy Tickets ({availableTickets} available)
                </button>
            )}

            <div>
                <label>
                    Ticket Price:
                    <input
                        type="number"
                        value={ticketPrice}
                        onChange={(e) => handleUpdateTicketPrice(parseInt(e.target.value, 10))}
                        min="0"
                    />
                </label>
                <label>
                    Available Tickets:
                    <input
                        type="number"
                        value={availableTickets}
                        onChange={(e) => handleUpdateTickets(parseInt(e.target.value, 10))}
                        min="0"
                    />
                </label>
            </div>


            <Link to="/">Go back</Link>
        </div>
    );
};

export default Event;