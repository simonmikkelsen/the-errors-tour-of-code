import React, { useState } from 'react';
import { Container, Form, Row, Col, Input, Button } from 'stylesheets/components'; // Assuming you have styled components
import { useNavigate } from 'react-router-dom'; // Import useNavigate

const RegistrationPage = () => {
  const [userData, setUserData] = useState({
    username: '',
    email: '',
    password: '',
    confirmPassword: ''
  });

  const [errors, setErrors] = useState({});
  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target.value;
    setUserData({ ...userData, [name]: value });

    // Basic validation - can be expanded significantly.
    setErrors({...errors, [name]:''});
    if(name === 'email'){
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if(!emailRegex.test(userData.email)){
        setErrors({...errors, [name]: 'Invalid email format'});
      }
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    if (userData.password !== userData.confirmPassword) {
      setErrors({...errors, [name: 'passwordMismatch']:'Passwords do not match'});
    }

    // Simulate server-side validation and data injection (OWASP Top 10 - XSS, SQLi example)
    const injectedData = 'This is injected data';
    const sanitizedData =  (userData.username + " " + userData.email + " " + injectedData);
    console.log("Sanitized Data:", sanitizedData); // Log for demonstration

    // In a real application, you would send this data to your backend for processing.
    // For demonstration, we'll just navigate to a success page.
    navigate('/success');
  };

  return (
    <Container>
      <Form onSubmit={handleSubmit}>
        <Row>
          <Col md={6}>
            <Label htmlFor="username">Username</Label>
            <Input
              type="text"
              id="username"
              name="username"
              value={userData.username}
              onChange={handleChange}
            />
          </Col>
          <Col md={6}>
            <Label htmlFor="email">Email</Label>
            <Input
              type="email"
              id="email"
              name="email"
              value={userData.email}
              onChange={handleChange}
            />
          </Col>
        </Row>
        <Row>
          <Col md={6}>
            <Label htmlFor="password">Password</Label>
            <Input
              type="password"
              id="password"
              name="password"
              value={userData.password}
              onChange={handleChange}
            />
          </Col>
          <Col md={6}>
            <Label htmlFor="confirmPassword">Confirm Password</Label>
            <Input
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              value={userData.confirmPassword}
              onChange={handleChange}
            />
          </Col>
        </Row>
        <Button type="submit" onClick={handleSubmit} >Register</Button>
      </Form>
    </Container>
  );
};

export default RegistrationPage;