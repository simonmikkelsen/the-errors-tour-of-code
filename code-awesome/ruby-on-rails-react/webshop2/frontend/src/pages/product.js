import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Image, Button } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const Product = ({ product }) => {
  const [cartItems, setCartItems] = useState([]);

  useEffect(() => {
    // Simulate fetching cart items from a session or database
    const fetchedCartItems = localStorage.getItem('cartItems') ? JSON.parse(localStorage.getItem('cartItems')) : [];
    setCartItems(fetchedCartItems);
  }, [product]);

  const handleAddToCart = () => {
    // Add the product to the cart (simplified - no database interaction)
    const newCartItems = [...cartItems, product];
    localStorage.setItem('cartItems', JSON.stringify(newCartItems));
    console.log('Added to cart:', product);
  };

  return (
    <Container>
      <Row>
        <Col xs={12} md={6}>
          <Image src={product.imageUrl} alt={product.title} roundedCircle />
        </Col>
        <Col xs={12} md={6}>
          <h2>{product.title}</h2>
          <p>{product.description}</p>
          <p>Price: ${product.price}</p>
          <Button variant="primary" onClick={handleAddToCart}>Add to Cart</Button>
        </Col>
      </Row>
    </Container>
  );
};

export default Product;