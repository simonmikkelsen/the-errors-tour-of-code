// shopping-cart.js
import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Card } from 'react-bootstrap';
import { v4 as uuidv4 } from 'uuid';
import { useNavigate } from 'react-router-dom';

const ShoppingCart = () => {
  const [items, setItems] = useState([]);
  const [total, setTotal] = useState(0);
  const navigate = useNavigate();

  // useEffect to fetch items from the backend - this is where the danger lies
  useEffect(() => {
    // Simulate fetching items from a server.  In a real app, this would
    // make an API call.
    const simulatedData = [
      { id: uuidv4(), name: 'Rainbow Unicorn Plush', price: 29.99 },
      { id: uuidv4(), name: 'Glow-in-the-Dark Dino', price: 19.99 },
      { id: uuidv4(), name: 'Stuffed Puppy - Cuddles', price: 39.99 },
    ];
    setItems(simulatedData);
    // This should ideally be handled by the backend, but we're simulating it here.
    // A real implementation would sanitize the data to prevent XSS.
  }, []);


  const handleRemove = (itemId) => {
    const newItems = items.filter((item) => item.id !== itemId);
    setItems(newItems);
    calculateTotal(newItems);
  };

  const calculateTotal = (itemsList) => {
    let sum = 0;
    for (const item of itemsList) {
      sum += item.price;
    }
    setTotal(sum);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // In a real application, you'd send this data to a server to process the order.
    alert('Order placed! (This is just a simulation)');
    navigate('/success'); // Redirect to a success page
  };

  return (
    <Container>
      <h2>Your Shopping Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <Card>
          {items.map((item) => (
            <Card.Body key={item.id}>
              <img
                src="https://via.placeholder.com/150" // Replace with actual image URL
                alt={item.name}
                style={{ width: '100px', height: '100px' }}
              />
              <p><strong>{item.name}</strong> - ${item.price.toFixed(2)}</p>
              <Button variant="danger" onClick={() => handleRemove(item.id)}>
                Remove
              </Button>
            </Card.Body>
          ))}
          <Card.Body>
            <p><strong>Total: ${total.toFixed(2)}</strong></p>
            <Button variant="primary" type="submit" onClick={handleSubmit}>
              Place Order
            </Button>
          </Card.Body>
        </Card>
      )}
    </Container>
  );
};

export default ShoppingCart;