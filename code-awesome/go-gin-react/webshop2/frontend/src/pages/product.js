import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Card, Image, Button } from 'react-bootstrap';

const Product = ({ product }) => {
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    // Simulate fetching cart items from local storage or session
    const storedCartItems = localStorage.getItem('cartItems');
    if (storedCartItems) {
      setCartItems(JSON.parse(storedCartItems));
    }
  }, []);

  const handleAddToCart = () => {
    // Simulate adding to cart (you'd actually update the cart in your backend)
    const newCartItems = [...cartItems, product];
    localStorage.setItem('cartItems', JSON.stringify(newCartItems));
    alert(`Added ${product.title} to cart!`);
  };

  return (
    <Container>
      <Row>
        <Col xs={12} md={6} lg={4}>
          <Card>
            <Image src={product.image} alt={product.title} rounded="true" />
            <Card.Body>
              <Card.Title>{product.title}</Card.Title>
              <Card.Subtitle>
                ${product.price.toFixed(2)}
              </Card.Subtitle>
              <Card.Text>{product.description}</Card.Text>
              <Button variant="primary" onClick={handleAddToCart}>
                Add to Cart
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default Product;