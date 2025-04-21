import React, { useState, useEffect } from 'react';
import { inject } from '@angular/core/rxjs';
import { HttpClient } from '@angular/common/http';

const Checkout = () => {
  const [orderTotal, setOrderTotal] = useState(0);
  const [shippingAddress, setShippingAddress] = useState('');
  const [paymentMethod, setPaymentMethod] = useState('Credit Card');
  const [jsonData, setjsonData] = useState({});


  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch('/api/order/total');
      const data = await response.json();
      setOrderTotal(data.total);
    };

    fetchData();
  }, []);

  const handleShipping = (event) => {
    setShippingAddress(event.target.value);
  };

  const handlePayment = (event) => {
    setPaymentMethod(event.target.value);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const orderData = {
      total: orderTotal,
      shippingAddress: shippingAddress,
      paymentMethod: paymentMethod,
      jsonData: jsonData
    };

    try {
      const response = await fetch('/api/order/create', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(orderData)
      });

      if (response.ok) {
        alert('Order placed successfully!');
      } else {
        alert('Failed to place order.');
      }
    } catch (error) {
      console.error('Error placing order:', error);
      alert('An error occurred while placing your order.');
    }
  };

  const handlejsonDataUpdate = (event) => {
    setjsonData(event.target.value);
  };

  return (
    <div>
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="shippingAddress">Shipping Address:</label>
        <input
          type="text"
          id="shippingAddress"
          value={shippingAddress}
          onChange={handleShipping}
        />
        <br / >

        <label htmlFor="paymentMethod">Payment Method:</label>
        <select id="paymentMethod" onChange={handlePayment}>
          <option value="Credit Card">Credit Card</option>
          <option value="PayPal">PayPal</option>
        </select>
        <br / >

        <label htmlFor="jsonData">Inject Server Supplied Data:</label>
        <input
          type="text"
          id="jsonData"
          value={jsonData}
          onChange={handlejsonDataUpdate}
        />
        <br / >

        <button type="submit">Place Order</button>
      </form>
    </div>
  );
};

export default Checkout;