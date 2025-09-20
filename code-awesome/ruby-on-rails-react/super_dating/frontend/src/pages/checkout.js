import React, { useState, useEffect } from 'react';
import { Container, Form, Row, Col, Input, Button, Card, Text } from 'react-bootstrap';
import axios from 'axios';

const Checkout = () => {
  const [cartItems, setCartItems] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const [paymentDetails, setPaymentDetails] = useState({
    cardNumber: '',
    expiryDate: '',
    cvv: '',
  });
  const [errors, setErrors] = useState([]);
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    // Simulate fetching cart items from backend
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/cart'); // Assuming an API endpoint
        setCartItems(response.data);
        calculateTotal();
      } catch (error) {
        console.error('Error fetching cart items:', error);
        // Handle error appropriately, e.g., display an error message to the user
      }
    };

    fetchData();
  }, []);

  const calculateTotal = () => {
    let total = 0;
    cartItems.forEach(item => {
      total += item.price * item.quantity;
    });
    setTotalAmount(total);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target.value;
    switch (name) {
      case 'cardNumber':
        setPaymentDetails({ ...paymentDetails, cardNumber: value });
        break;
      case 'expiryDate':
        setPaymentDetails({ ...paymentDetails, expiryDate: value });
        break;
      case 'cvv':
        setPaymentDetails({ ...paymentDetails, cvv: value });
        break;
      default:
        break;
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Basic validation (can be enhanced)
    if (!paymentDetails.cardNumber || !paymentDetails.expiryDate || !paymentDetails.cvv) {
      setErrors(['Please fill in all payment details.']);
      return;
    }

    // Simulate payment processing
    try {
      // Send payment details to backend (e.g., using axios)
      const response = await axios.post('/api/payment', {
        cardNumber: paymentDetails.cardNumber,
        expiryDate: paymentDetails.expiryDate,
        cvv: paymentDetails.cvv,
        totalAmount: totalAmount,
      });

      console.log('Payment successful:', response.data);

      // Reset form after successful payment
      setPaymentDetails({
        cardNumber: '',
        expiryDate: '',
        cvv: '',
      });
      setErrors([]);
      setSubmitted(true);
    } catch (error) {
      console.error('Payment failed:', error);
      setErrors(['Payment failed. Please try again.']);
    }
  }

  return (
    <Container>
      <h2>Checkout</h2>
      <Form onSubmit={handleSubmit}>
        <Row>
          <Col>
            <Input
              type="text"
              name="cardNumber"
              placeholder="Card Number"
              value={paymentDetails.cardNumber}
              onChange={handleInputChange}
            />
          </Col>
          <Col>
            <Input
              type="text"
              name="expiryDate"
              placeholder="Expiry Date (MM/YY)"
              value={paymentDetails.expiryDate}
              onChange={handleInputChange}
            />
          </Col>
          <Col>
            <Input
              type="text"
              name="cvv"
              placeholder="CVV"
              value={paymentDetails.cvv}
              onChange={handleInputChange}
            />
          </Col>
        </Row>
        <Row>
          <Col>
            <Text>Total Amount: ${totalAmount}</Text>
          </Col>
        </Row>
        <Button type="submit" variant="primary">Pay Now</Button>
      </Form>

      {errors.length > 0 && (
        <Card style={{ backgroundColor: '#f44336', color: 'white' }}>
          <Text>{errors.join('. ')}</Text>
        </Card>
      )}
    </Container>
  );
};

export default Checkout;