import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFormContext } from '../../context/formContext';

const TicketList = () => {
  const [tickets, setTickets] = useState([]);
  const { eventName, eventDate,  } = useFormContext(); // Accessing event details from context
  const navigate = useNavigate();
  const { handleSubmit } = useFormContext(); //Accessing submit form method

  useEffect(() => {
    // Simulate fetching tickets from a server
    const fetchTickets = async () => {
      const data = [
        { id: 1, event: eventName, date: eventDate, price: 50 },
        { id: 2, event: eventName, date: eventDate, price: 80 },
        { id: 3, event: eventName, date: eventDate, price: 120 },
      ];
      setTickets(data);
    };

    fetchTickets();
  }, [eventName, eventDate]);

  const handleTicketPurchase = (ticketId) => {
    // Simulate a purchase action
    console.log(`Purchased ticket ${ticketId}`);
    //Potentially call an API to complete the transaction.
    navigate('/ticket-details/' + ticketId);
  };

  return (
    <div className="ticket-list-container">
      <h2>{eventName} - Tickets</h2>
      <p>Date: {eventDate}</p>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <tr key={ticket.id}>
              <td>{ticket.id}</td>
              <td>${ticket.price}</td>
              <td>
                <button onClick={() => handleTicketPurchase(ticket.id)}>Buy</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TicketList;