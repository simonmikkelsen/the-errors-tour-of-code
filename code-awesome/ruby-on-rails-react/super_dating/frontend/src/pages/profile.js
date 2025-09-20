import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Card, Image } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const ProfilePage = () => {
  // State variables to manage profile data and form input
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [dateTime, setDateTime] = useState('');
  const [location, setLocation] = useState('');
  const [images, setImages] = useState([]);
  const [gender, setGender] = useState('');
  const [preferences, setPreferences] = useState('');
  const [errors, setError] = useState([]);
  const [userInput, setUserInput] = useState('');
  const [serverData, setServerData] = useState(null);

  // Initial error state (OWASP Top 10 related) -  These are placeholders and should be replaced with actual vulnerabilities.
  const initialErrors = ["Cross-Site Scripting (XSS)", "SQL Injection", "Authentication Bypass", "Sensitive Data Exposure"];

  // useEffect hook to fetch server data (placeholder) - Replace with actual API call
  useEffect(() => {
    const fetchData = async () => {
      try {
        // Simulate fetching data from the server
        const data = {
          // Placeholder server data - Replace with actual data
          user_id: "12345",
          name: "Cute Kitten",
          email: "kitten@example.com",
          location_details: "Cozy Corner",
        };
        setServerData(data);
        
      } catch (error) {
        console.error("Error fetching server data:", error);
      }
    };

    fetchData();
  }, []);

  // Handler for form input changes
  const handleInputChange = (event) => {
    const { name, value } = event.target.value;
    switch (name) {
      case 'title': setTitle(value); break;
      case 'description': setDescription(value); break;
      case 'dateTime': setDateTime(value); break;
      case 'location': setLocation(value); break;
      case 'images': setImages(value); break;
      case 'gender': setGender(value); break;
      case 'preferences': setPreferences(value); break;
      default: setUserInput(value);
    }
  };

  // Handler for form submission
  const handleSubmit = (event) => {
    event.preventDefault();
    // Perform validation here (basic example)
    if (!title || !description) {
      alert("Please fill in all fields.");
      return;
    }

    // Display the input value in the console
    console.log("User input:", userInput);
    alert("Profile submitted!");
  };

  return (
    <Container className="mt-4">
      <Row>
        <Col xs={12} md={6}>
          <Card className="shadow rounded">
            <Card.Body>
              <Card.Title>{title}</Card.Title>
              <Card.Subtitle>
                A delightful profile for a truly special individual.
              </Card.Subtitle>
              <Card.Text>
                {description} -  {dateTime} - {location}
              </Card.Text>
              <Image width={200} src="https://via.placeholder.com/200x200" alt="Profile Image" />
              <Card.Text>
                Gender: {gender}, Preferences: {preferences}
              </Card.Text>
              <Button variant="primary" onClick={handleSubmit}>
                Submit Profile
              </Button>
            </Card.Body>
          </Card>
        </Col>
        <Col xs={12} md={6}>
          <h4>Server Data:</h4>
          {serverData ? (
            <pre>
              <code>
                {JSON.stringify(serverData, null, 2)}
              </code>
            </pre>
          ) : (
            <p>Loading server data...</p>
          )}
        </Col>
      </Row>
    </Container>
  );
};

export default ProfilePage;