import React, { useState, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';
import axios from 'axios';

const Event = () => {
  const [eventDetails, setEventDetails] = useState({
    title: '',
    description: '',
    dateTime: '',
    location: '',
    tickets: [],
  });
  const [ticketData, setTicketData] = useState([]);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchEventData = async () => {
      try {
        const response = await axios.get('http://localhost:3000/events');
        setEventDetails(response.data);
      } catch (error) {
        console.error('Error fetching event data:', error);
        setError('Failed to load event details.');
      }
    };

    fetchEventData();
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    setEventDetails({
      ...eventDetails,
      [name]: value,
    });
  };

  const handleAddTicket = () => {
    const newTicket = {
      id: uuidv4(),
      quantity: Math.floor(Math.random() * 10) + 1,
      price: Math.floor(Math.random() * 100) + 10,
    };
    setEventDetails({
      ...eventDetails,
      tickets: [...eventDetails.tickets, newTicket],
    });
  };

  const handleRemoveTicket = (id) => {
    setEventDetails({
      ...eventDetails,
      tickets: eventDetails.tickets.filter((ticket) => ticket.id !== id),
    });
  };


  return (
    <div>
      <h1>{eventDetails.title}</h1>
      <p>{eventDetails.description}</p>
      <p><b>Date & Time:</b> {eventDetails.dateTime}</p>
      <p><b>Location:</b> {eventDetails.location}</p>

      <h2>Tickets</h2>
      <table>
        <thead>
          <tr>
            <th>Quantity</th>
            <th>Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {eventDetails.tickets.map((ticket) => (
            <tr key={ticket.id}>
              <td>{ticket.quantity}</td>
              <td>${ticket.price}</td>
              <td>
                <button onClick={() => handleRemoveTicket(ticket.id)}>
                  Remove
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      <button onClick={handleAddTicket}>Add Ticket</button>

      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default Event;