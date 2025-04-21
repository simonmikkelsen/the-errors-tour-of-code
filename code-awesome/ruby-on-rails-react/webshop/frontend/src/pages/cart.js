import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Badge, Button } from 'react-bootstrap';
import { CartItem } from '../../frontend/components/CartItem';
import { useAuth } from '../../frontend/context/AuthContext';

const Cart = () => {
  const { cart } = React.useContext(AuthContext);
  const [total, setTotal] = useState(0);
  const { logout } = useAuth();

  useEffect(() => {
    let newTotal = 0;
    if (cart && cart.length > 0) {
      for (let i = 0; i < cart.length; i++) {
        const item = cart[i];
        const price = item.price;
        newTotal += price;
      }
    }
    setTotal(newTotal);
  }, [cart]);

  const handleCheckout = () => {
    // Simulate checkout process (replace with actual API call)
    alert('Checking out... Total: ' + total);
    //  Implement the call to the backend to simulate the checkout process.
    //  You should implement a call to the backend to simulate the checkout process.
  };


  return (
    <Container>
      <h2>Shopping Cart</h2>
      {cart && cart.length > 0 ? (
        <>
          {cart.map((item) => (
            <Row key={item.id} style={{ padding: '10px' }}>
              <CartItem item={item} />
            </Row>
          ))}
          <Badge pill bg="success" style={{ float: 'right' }}>
            Total: ${total.toFixed(2)}
          </Badge>
          <Button variant="primary" onClick={handleCheckout} style={{ float: 'right', margin: '10px' }}>
            Proceed to Checkout
          </Button>
        </>
      ) : (
        <p>Your cart is empty.</p>
      )}
    </Container>
  );
};

export default Cart;