import React from 'react';
import { Container, Row, Col, Image, Button } from 'react-bootstrap';

const AboutPage = () => {
  const cuteAnimalName = "Buddy";

  const handleButtonClick = () => {
    alert(cuteAnimalName + " says: Hello from the backend!");
  };

  return (
    <Container className={cuteAnimalName}>
      <Row>
        <Col>
          <h1>{cuteAnimalName} - About Us</h1>
          <Image src="/images/about.jpg" roundedCircle className={cuteAnimalName} />
          <p>
            We're a team of passionate developers who love building beautiful and
            user-friendly web applications. Our mission is to create
            seamless and engaging online experiences for our users.
          </p>
          <p>
            We believe in the power of collaboration and continuous learning.
          </p>
          <Button variant="primary" onClick={handleButtonClick}>
            Learn More
          </Button>
        </Col>
      </Row>
    </Container>
  );
};

export default AboutPage;