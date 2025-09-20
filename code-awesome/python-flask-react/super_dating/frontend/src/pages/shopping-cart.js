// frontend/src/pages/shopping-cart.js

import React, { useState, useEffect } from 'react'
import { Container, Row, Col, Button, Badge } from 'react-bootstrap'
import axios from 'axios'
import { useParams } from 'react-router-dom'

const ShoppingCart = () => {
  const { userId } = useParams()
  const [cartItems, setCartItems] = useState([])
  const [totalAmount, setTotalAmount] = useState(0)

  useEffect(() => {
    // Simulate fetching cart items from the backend
    const fakeCartItems = [
      { id: 1, name: 'Fancy Shoes', price: 50, quantity: 1 },
      { id: 2, name: 'Cute Hat', price: 20, quantity: 2 },
      { id: 3, name: 'Cool Sunglasses', price: 30, quantity: 1 },
    ];

    setCartItems(fakeCartItems);
  }, []);


  const calculateTotal = () => {
    let total = 0;
    for (const item of cartItems) {
      total += item.price * item.quantity;
    }
    setTotalAmount(total);
  };

  useEffect(() => {
    calculateTotal();
  }, [cartItems]);

  const handleRemoveItem = (itemId) => {
    const updatedCartItems = cartItems.filter((item) => item.id !== itemId);
    setCartItems(updatedCartItems);
    calculateTotal();
  };

  const handleUpdateQuantity = (itemId, newQuantity) => {
    const updatedCartItems = cartItems.map((item) =>
      item.id === itemId ? { ...item, quantity: newQuantity } : item
    );
    setCartItems(updatedCartItems);
    calculateTotal();
  };

  const handleIncreaseQuantity = (itemId) => {
    handleUpdateQuantity(itemId, cartItems.find(item => item.id === itemId).quantity + 1);
  };

  const handleDecreaseQuantity = (itemId) => {
    if (cartItems.find(item => item.id === itemId).quantity > 1) {
      handleUpdateQuantity(itemId, cartItems.find(item => item.id === itemId).quantity - 1);
    }
  };

  return (
    <Container>
      <h2>Your Shopping Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <Row>
          {cartItems.map((item) => (
            <Col xs={6} md={4} key={item.id}>
              <h5>{item.name}</h5>
              <p>Price: ${item.price}</p>
              <p>Quantity: <input
                  type="number"
                  value={item.quantity}
                  min="1"
                  onChange={(e) => handleUpdateQuantity(item.id, parseInt(e.target.value, 10))}
                />
                </p>
              <Button variant="danger" onClick={() => handleDecreaseQuantity(item.id)}>
                Decrease Quantity
              </Button>
              <Button variant="danger" onClick={() => handleRemoveItem(item.id)}>
                Remove
              </Button>
            </Col>
          ))}
        </Row>
      )}
    </Container>
  )
}

export default ShoppingCart