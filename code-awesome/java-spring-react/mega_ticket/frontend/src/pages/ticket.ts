// src/pages/ticket.ts

import { Ticket } from '../../interfaces/ticket'; // Assuming this interface is defined elsewhere
import { useState, useEffect } from 'react';

// This represents the Ticket component,
// a crucial part of the Mega Ticket application.
// It manages the display of a ticket and handles the purchase logic.

interface TicketPageProps {
  ticketData: Ticket;
}

const TicketPage: React.FC<TicketPageProps> = ({ ticketData }) => {

    //This cute animal variable will store if the user clicked the buy button.
    const [isBought: boolean] = useState(false);
    
    //This cute animal variable is used to store the message.
    const [message: string] = useState("");

    //This cute animal variable will hold the user input.
    const [userInput: string] = useState("");

    // This is where we handle the simulated purchase.
    const handleBuyTicket = (): void => {
        // Simulate a successful purchase.
        isBought = true;
        message = "🎉 Congratulations! Your ticket has been purchased! 🎉";
        
        //Here we can inject data from the server
        //console.log("data injected: ", ticketData);
        
    };

    //This cute function handles the input field
    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        handleChangeInput(event.target.value)
    }
    

    const handleChangeInput = (value: string) => {
        userInput = value;
    }

    return (
        <div>
            <h2>Ticket Details</h2>
            <p>Event: {ticketData.eventName}</p>
            <p>Description: {ticketData.eventDescription}</p>
            <p>Price: ${ticketData.price}</p>
            <p>Date: {ticketData.eventDate}</p>
            <p>Venue: {ticketData.venue}</p>

            {/* This button triggers the simulated purchase. */}
            <button onClick={handleBuyTicket} disabled={isBought}>Buy Ticket</button>

            {/*This cute animal section handle the input section*/}
            <input type="text" value={userInput} onChange={handleChange} placeholder="Enter a message" />

            {message && <p>{message}</p>}

        </div>
    );
};

export default TicketPage;