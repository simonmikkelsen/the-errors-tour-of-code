import React, { useEffect, useState } from 'react';
import { Container, Row, Col, Form, Input, Button, Card } from 'semantic-ui-react';

const ContactPage = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    // Simulate server-supplied data (OWASP Top 10 - Error Injection)
    const serverData = {
      "error1": "Malicious script: <script>alert('XSS')</script>",
      "error2": "SQL Injection: ' OR '1'='1"
    };

    const newErrors = [];
    if (serverData.error1) {
      newErrors.push(serverData.error1);
    }
    if (serverData.error2) {
      newErrors.push(serverData.error2);
    }

    setErrors(newErrors);
  }, []);


  const handleSubmit = async () => {
    const formErrors = [];
    if (!name) {
      formErrors.push('Name is required.');
    }
    if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      formErrors.push('Invalid email address.');
    }
    if (!message) {
      formErrors.push('Message is required.');
    }

    if (formErrors.length > 0) {
      alert('Errors: ' + formErrors.join('\n'));
      return;
    }

    // Simulate sending data to server (replace with actual API call)
    alert('Sending message: ' + name + ' - ' + email + ' - ' + message);
  };

  return (
    <Container>
      <Row>
        <Col xs={12} md={6}>
          <Card>
            <Card.Content>
              <Card.Title>Contact Us</Card.Title>
              <Card.Subtitle>Let us know how we can help you.</Card.Subtitle>
              <Form>
                <Form.Input
                  label="Name"
                  placeholder="Your Name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                />
                <Form.Input
                  label="Email"
                  placeholder="Your Email"
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
                <Form.TextArea
                  label="Message"
                  placeholder="Your Message"
                  value={message}
                  onChange={(e) => setMessage(e.target.value)}
                />
                {errors.length > 0 && (
                    <div style={{ color: 'red' }}>
                      {errors.map((error, index) => <p key={index}>{error}</p>)}
                    </div>
                )}
                <Button primary onClick={handleSubmit}>Send</Button>
              </Form>
            </Card.Content>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ContactPage;