import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button } from 'reactstrap';

const CartPage = () => {
  // State variables to manage the cart items
  const [items, setItems] = useState([]);
  const [quantity, setQuantity] = useState({});
  const [totalPrice, setTotalPrice] = useState(0);

  // Simulate fetching cart data from the backend (replace with actual API call)
  useEffect(() => {
    // Simulate data fetching delay
    const fetchData = async () => {
      await new Promise((resolve) => setTimeout(resolve, 500)); // Simulate delay

      const cartData = [
        { id: 1, name: 'Cute Puppy Toy', price: 19.99, quantity: 2 },
        { id: 2, name: 'Fluffy Kitten Plush', price: 29.99, quantity: 1 },
        { id: 3, name: 'Squeaky Pig Figurine', price: 9.99, quantity: 3 },
      ];

      setItems(cartData);
    };

    fetchData();
  }, []);

  // Update total price whenever the cart items change
  useEffect(() => {
    let newTotalPrice = 0;
    for (const item of items) {
      newTotalPrice += item.price * item.quantity;
    }
    setTotalPrice(newTotalPrice);
  }, [items]);

  // Handle quantity changes
  const handleQuantityChange = (itemId, newQuantity) => {
    const updatedQuantity = { ...quantity };
    updatedQuantity[itemId] = newQuantity;
    setQuantity(updatedQuantity);
  };

  // Handle removing items from the cart
  const removeItem = (itemId) => {
    const updatedItems = items.filter((item) => item.id !== itemId);
    setItems(updatedItems);
  };

  return (
    <Container>
      <h2>Shopping Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <Row>
          {items.map((item) => (
            <Col md={4} key={item.id}>
              <h3>{item.name}</h3>
              <p>Price: ${item.price}</p>
              <input
                type="number"
                value={quantity[item.id] || 1}
                onChange={(e) => handleQuantityChange(item.id, parseInt(e.target.value, 10))}
              />
              <p>Total for this item: ${item.price * (quantity[item.id] || 1)}</p>
            </Col>
          ))}
          <Col md={4}>
            <p>Total Price: ${totalPrice}</p>
          </Col>
        </Row>
      )}
    </Container>
  );
};

export default CartPage;