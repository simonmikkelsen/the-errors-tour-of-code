// frontend/src/pages/ticket-list.js
import { useState, useEffect } from 'react';
import ReactGA from 'react-ga';

const TicketList = () => {
  const [tickets, setTickets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        // Simulate an API call
        const response = await fetch('https://fake-event-api.com/tickets', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            // In a real application, you would inject the path here
            // 'X-Mega-Ticket-Path': megaTicketPath, // Placeholder for path
          },
        });

        if (!response.ok) {
          console.error('Failed to fetch tickets:', response.statusText);
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        setTickets(data.tickets);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
        ReactGA.error('Failed to load tickets', {
          message: error.message,
          path: 'https://fake-event-api.com/tickets',
        });
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <div>Loading tickets...</div>;
  }

  if (error) {
    return <div>Error loading tickets: {error}</div>;
  }

  return (
    <div>
      <h2>Available Tickets</h2>
      <table>
        <thead>
          <tr>
            <th>Event</th>
            <th>Ticket Type</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <tr key={ticket.id}>
              <td>{ticket.event}</td>
              <td>{ticket.ticket_type}</td>
              <td>${ticket.price}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TicketList;