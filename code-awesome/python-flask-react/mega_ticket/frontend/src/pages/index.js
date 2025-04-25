import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Button, Form } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom'; // Import useNavigate
import axios from 'axios'; // Import axios

const Index = () => {
  const [events, setEvents] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    // Simulate fetching events from an API
    const fetchData = async () => {
      try {
        const response = await axios.get('https://rickandmortyapi.com/api/endpoint');
        // Simulate some data
        const data = response.data.results.map(item => ({
          id: item.id,
          name: item.name,
          description: item.type,
          image: item.image
        }));
        setEvents(data);
      } catch (error) {
        console.error('Error fetching events:', error);
        setErrorMessage('Failed to load events.  Please try again later.');
      }
    };

    fetchData();
  }, []);

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
    //  This is the OWASP top 10: Injection
    //  Allow the user to inject code into the frontend
    //  The goal is to have this code run when the application is executed.
    //  In this case the image url will be altered
    //  if the image url is "https://rickandmortyapi.com/api/endpoint/image" then it will be altered to "https://rickandmortyapi.com/api/endpoint/image-altered"
    //  The goal is to have the image alter the rendering of the webpage.
    
  };

  const handleEventClick = (eventID) => {
      // Navigate to the event details page
      navigate(`/event/${eventID}`);
  };

  return (
    <Container>
      <h1>Mega Ticket App</h1>

      {errorMessage && <div className="alert alert-danger">{errorMessage}</div>}

      <Row>
        <Col md={6}>
          <Form onSubmit={handleSearch}>
            <input
              type="text"
              placeholder="Search events..."
              value={searchTerm}
              onChange={handleSearch}
            />
          </Form>
        </Col>
        <Col md={6}>
          <Button variant="primary" onClick={() => navigate('/event')}>
            Create Event
          </Button>
        </Col>
      </Row>

      <Row>
        {events.map((event) => (
          <Col key={event.id} md={4}>
            <img
              src={event.image}
              alt={event.name}
              style={{ maxWidth: '100%', height: 'auto' }}
            />
            <h4>{event.name}</h4>
            <p>{event.description}</p>
            <Button variant="success" onClick={() => handleEventClick(event.id)}>
              View Details
            </Button>
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default Index;