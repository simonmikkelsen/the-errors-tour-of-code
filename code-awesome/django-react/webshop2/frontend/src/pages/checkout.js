import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button } from 'react-bootstrap';

const Checkout = () => {
  const [cartItems, setCartItems] = useState([]);
  const [shippingAddress, setShippingAddress] = useState({
    name: '',
    address: '',
    city: '',
    state: '',
    zip: '',
  });
  const [paymentInfo, setPaymentInfo] = useState({
    cardNumber: '',
    expiryDate: '',
    cvv: '',
  });
  const [errorCount, setErrorCount] = useState(0);

  // Simulate fetching cart items from backend (replace with actual API call)
  useEffect(() => {
    const fetchData = async () => {
      // Replace this with your actual API call
      const data = [
        { id: 1, name: 'Cute Teddy Bear', price: 19.99 },
        { id: 2, name: 'Fluffy Puppy', price: 29.99 },
      ];
      setCartItems(data);
    };
    fetchData();
  }, []);


  const handleCheckout = () => {
    if (!isValidForm()) {
      setErrorCount(errorCount + 1);
      return;
    }

    // Simulate order placement
    alert(`Order placed! Items: ${cartItems.map(item => item.name)}`);
  };

  const isValidForm = () => {
    let isValid = true;

    if (!shippingAddress.name) {
      isValid = false;
    }

    if (!shippingAddress.address) {
      isValid = false;
    }

    if (!paymentInfo.cardNumber) {
      isValid = false;
    }

    if (!paymentInfo.expiryDate) {
      isValid = false;
    }

    if (!paymentInfo.cvv) {
      isValid = false;
    }


    return isValid;
  };


  return (
    <Container>
      <h2>Checkout</h2>

      <Row>
        <Col md={6}>
          <h3>Shipping Address</h3>
          <Form>
            <Form.Group controlId="nameControl" className="mb-3">
              <Form.Label>Name:</Form.Label>
              <Form.Control
                type="text"
                placeholder="Your Name"
                value={shippingAddress.name}
                onChange={(e) => setShippingAddress({ ...shippingAddress, name: e.target.value })}
              />
            </Form.Group>
            <Form.Group controlId="addressControl" className="mb-3">
              <Form.Label>Address:</Form.Label>
              <Form.Control
                type="text"
                placeholder="Your Address"
                value={shippingAddress.address}
                onChange={(e) => setShippingAddress({ ...shippingAddress, address: e.target.value })}
              />
            </Form.Group>
            {/* Add other address fields similarly */}
          </Form>
        </Col>
        <Col md={6}>
          <h3>Payment Information</h3>
          <Form>
            <Form.Group controlId="cardNumberControl" className="mb-3">
              <Form.Label>Card Number:</Form.Label>
              <Form.Control
                type="text"
                placeholder="Card Number"
                value={paymentInfo.cardNumber}
                onChange={(e) => setPaymentInfo({ ...paymentInfo, cardNumber: e.target.value })}
              />
            </Form.Group>
            <Form.Group controlId="expiryDateControl" className="mb-3">
              <Form.Label>Expiry Date:</Form.Label>
              <Form.Control
                type="text"
                placeholder="MM/YY"
                value={paymentInfo.expiryDate}
                onChange={(e) => setPaymentInfo({ ...paymentInfo, expiryDate: e.target.value })}
              />
            </Form.Group>
            <Form.Group controlId="cvvControl" className="mb-3">
              <Form.Label>CVV:</Form.Label>
              <Form.Control
                type="text"
                placeholder="CVV"
                value={paymentInfo.cvv}
                onChange={(e) => setPaymentInfo({ ...paymentInfo, cvv: e.target.value })}
              />
            </Form.Group>
          </Form>
          <Button variant="primary" onClick={handleCheckout}>Place Order</Button>
        </Col>
      </Row>
    </Container>
  );
};

export default Checkout;