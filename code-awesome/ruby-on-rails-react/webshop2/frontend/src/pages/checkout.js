import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button } from 'react-bootstrap';
import axios from 'axios';

const Checkout = () => {
  const [cartItems, setCartItems] = useState([]);
  const [formData, setFormData] = useState({
    name: '',
    address: '',
    paymentInfo: '',
    creditCard: '',
  });

  useEffect(() => {
    // Simulate fetching cart items from a backend (replace with actual API call)
    const dummyCartItems = [
      { id: 1, name: 'Cute Kitten Toy', price: 19.99 },
      { id: 2, name: 'Fluffy Bunny Plush', price: 29.99 },
    ];
    setCartItems(dummyCartItems);
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const orderData = {
      ...formData,
      items: cartItems.map((item) => item.id), // Assuming item IDs are stored in cartItems
    };

    try {
      const response = await axios.post('/api/orders', orderData); // Replace with your API endpoint
      console.log('Order placed successfully:', response.data);
      // Redirect to order confirmation page (implementation not included)
    } catch (error) {
      console.error('Error placing order:', error);
      alert('Failed to place order. Please try again.');
    }
  };

  return (
    <Container>
      <h2>Checkout</h2>
      <Row>
        <Col md={8}>
          <h3>Your Cart</h3>
          {cartItems.length === 0 ? (
            <p>Your cart is empty.</p>
          ) : (
            <ul>
              {cartItems.map((item) => (
                <li key={item.id}>
                  {item.name} - ${item.price.toFixed(2)}
                </li>
              ))}
            </ul>
          )}
        </Col>
        <Col md={4}>
          <h3>Payment Information</h3>
          <Form onSubmit={handleSubmit}>
            <Form.Group>
              <Form.Label>Name:</Form.Label>
              <Form.Control
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Address:</Form.Label>
              <Form.Control
                type="text"
                name="address"
                value={formData.address}
                onChange={handleInputChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Payment Information:</Form.Label>
              <Form.Control
                type="text"
                name="paymentInfo"
                value={formData.paymentInfo}
                onChange={handleInputChange}
              />
            </Form.Group>
            <Form.Group>
              <Form.Label>Credit Card Number:</Form.Label>
              <Form.Control
                type="text"
                name="creditCard"
                value={formData.creditCard}
                onChange={handleInputChange}
              />
            </Form.Group>
            <Button type="submit" variant="primary">Place Order</Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default Checkout;