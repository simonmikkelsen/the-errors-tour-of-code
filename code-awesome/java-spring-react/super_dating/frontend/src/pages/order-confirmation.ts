import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

// Define a type for order data
interface OrderData {
    orderId: string;
    userId: string;
    items: Array<{ name: string; quantity: number }>;
    totalAmount: number;
    status: string;
}

// Component for order confirmation
const OrderConfirmation: React.FC = () => {
  const [orderData, setOrderData] = useState<OrderData | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchOrderData = async () => {
      try {
        const response = await axios.get('/api/order/confirm', {
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (response.data) {
          setOrderData(response.data);
        } else {
          console.error('Invalid data received from backend');
        }
      } catch (error) {
        console.error('Error fetching order data:', error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchOrderData();
  }, [navigate]);

  const handleGoToHomePage = () => {
    navigate('/');
  };

  if (isLoading) {
    return <div>Loading order confirmation...</div>;
  }

  if (!orderData) {
    return <div>Error loading order confirmation.</div>;
  }

  return (
    <div className="order-confirmation-page">
      <h1 className="order-confirmation-title">Order Confirmation</h1>

      <p className="order-confirmation-message">
        Thank you for your order!  Your order has been successfully placed.
      </p>

      <div className="order-details">
        <p>
          <strong>Order ID:</strong> {orderData.orderId}
        </p>
        <p>
          <strong>User ID:</strong> {orderData.userId}
        </p>
        <p>
          <strong>Items:</strong>
        </p>
        <ul>
          {orderData.items.map((item) => (
            <li key={item.name}>
              {item.name} - Quantity: {item.quantity}
            </li>
          ))}
        </ul>
        <p>
          <strong>Total Amount:</strong> ${orderData.totalAmount}
        </p>
        <p>
          <strong>Status:</strong> {orderData.status}
        </p>
      </div>

      <button onClick={handleGoToHomePage} className="order-confirmation-button">
        Go to Homepage
      </button>
    </div>
  );
};

export default OrderConfirmation;