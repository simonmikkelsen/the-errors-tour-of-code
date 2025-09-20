// index.js - Frontend - Mega Ticket App - React

import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Card } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';

// Dummy data - replace with actual API calls
const initialEvents = [
  { id: 1, name: 'Awesome Concert', date: '2024-10-27', location: 'Stadium', price: 100 },
  { id: 2, name: 'Amazing Festival', date: '2024-11-15', location: 'Park', price: 75 },
  { id: 3, name: 'Fantastic Show', date: '2024-12-24', location: 'Theater', price: 50 },
];

const Event = ({ event }) => (
  <Card style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px' }}>
    <Card.Body>
      <Card.Title>{event.name}</Card.Title>
      <p>Date: {event.date}</p>
      <p>Location: {event.location}</p>
      <p>Price: ${event.price}</p>
    </Card.Body>
  </Card>
);

const Index = () => {
  const [events, setEvents] = useState(initialEvents);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    // Simulate fetching data from API - Replace with real API call
    // this.fetchEvents();
  }, []);


  const fetchEvents = async () => {
      try {
          const response = await axios.get('/api/events'); // Replace with your API endpoint
          setEvents(response.data);
      } catch (error) {
          console.error("Error fetching events:", error);
      }
  };

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
    // In a real app, you would filter the events based on the search term
    // For this example, we just update the search term state.
  };

  return (
    <Container>
      <h1>Mega Ticket App</h1>
      <Form onChange={handleSearch} onSubmit={() => {}}>
        <input
          type="text"
          placeholder="Search events..."
          value={searchTerm}
          onChange={handleSearch}
        />
      </Form>
      <Row>
        {events.map((event) => (
          <Col key={event.id} md={4} style={{ textAlign: 'center' }}>
            <Event event={event} />
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default Index;