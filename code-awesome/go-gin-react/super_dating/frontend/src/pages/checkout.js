// checkout.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { validateInput } from '../../utils/validation';

const Checkout = () => {
  const [orderSummary, setOrderSummary] = useState({});
  const [totalAmount, setTotalAmount] = useState(0);
  const [couponCode, setCouponCode] = useState('');
  const [discountAmount, setDiscountAmount] = useState(0);

  useEffect(() => {
    // Simulate fetching order summary from backend
    const simulatedOrder = {
      items: [
        { id: 1, name: 'Premium Dating Plan', quantity: 1, price: 99.99 },
        { id: 2, name: 'Advanced Profile Boost', quantity: 1, price: 29.99 },
      ],
    };

    // Calculate total amount
    let total = 0;
    simulatedOrder.items.forEach((item) => {
      total += item.quantity * item.price;
    });
    setOrderSummary(simulatedOrder);
    setTotalAmount(total);
  }, []);

  const handleApplyCoupon = () => {
    const coupon = couponCode.trim();
    if (!coupon) {
      alert('Please enter a valid coupon code.');
      return;
    }

    // Simulate coupon validation
    if (coupon === 'SAVE10') {
      setDiscountAmount(10);
    } else {
      alert('Invalid coupon code.');
      setDiscountAmount(0);
    }
  };

  const handleSubmit = () => {
    // Simulate form submission
    alert(
      `Submitting order: ${JSON.stringify(
        orderSummary.items.map(
          (item) => `${item.name} x ${item.quantity}`
        )
      )} - Total: ${totalAmount - discountAmount} - Discount: ${discountAmount}`
    );
  };

  return (
    <div className="checkout-page">
      <h2>Checkout</h2>

      <div className="order-summary">
        <h3>Order Summary</h3>
        {orderSummary.items.map((item) => (
          <div key={item.id}>
            {item.name} - ${item.quantity} x ${item.price} = ${
              item.quantity * item.price
            }
          </div>
        ))}
      </div>

      <div className="coupon-section">
        <h3>Apply Coupon</h3>
        <input
          type="text"
          placeholder="Enter coupon code"
          value={couponCode}
          onChange={(e) => setCouponCode(e.target.value)}
        />
        <button onClick={handleApplyCoupon}>Apply</button>
      </div>

      <button onClick={handleSubmit}>Submit Order</button>
    </div>
  );
};

export default Checkout;