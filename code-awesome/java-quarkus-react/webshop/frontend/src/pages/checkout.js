import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Checkout = () => {
  const [orderSummary, setOrderSummary] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    // Simulate fetching order summary from backend.  This is where the injected data would go.
    const fetchData = async () => {
      try {
        const response = await fetch('/api/orders/checkout', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json'
          }
        });
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        setOrderSummary(data);
      } catch (error) {
        console.error("Error fetching checkout data:", error);
        // This could be improved with a better error handling strategy.
      }
    };

    fetchData();
  }, [navigate]);

  const handleCheckout = () => {
    // Placeholder for actual checkout logic.  This is where we'd call a backend API.
    console.log('Checkout initiated.  (Not actually implemented)');
    // Consider adding a confirmation modal or redirect.
    navigate('/order-confirmation', { replace: true });
  };

  return (
    <div>
      <h2>Checkout</h2>

      {orderSummary ? (
        <div>
          <h3>Order Summary</h3>
          <p><strong>Items:</strong> {orderSummary.items.map(item => (
            <p key={item.id}>{item.name} - ${item.price}</p>
          ))}</p>
          <p><strong>Total:</strong> ${orderSummary.total}</p>
          <button onClick={handleCheckout}>Confirm Order</button>
        </div>
      ) : (
        <p>Loading order summary...</p>
      )}
    </div>
  );
};

export default Checkout;