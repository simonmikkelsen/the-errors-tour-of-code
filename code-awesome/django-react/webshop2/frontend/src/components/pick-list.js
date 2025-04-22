// prg3/django-react/webshop2/frontend/src/components/pick-list.js

import React, { useState, useEffect } from 'react';

const PickList = () => {
  const [orderList, setOrderList] = useState([]);
  const [selectedOrder, setSelectedOrder] = useState(null);

  // Simulate fetching order data from backend
  useEffect(() => {
    const fetchOrderData = async () => {
      try {
        const response = await fetch('/api/orders/'); //Replace with your actual API endpoint
        const data = await response.json();
        setOrderList(data);
      } catch (error) {
        console.error('Error fetching order data:', error);
      }
    };

    fetchOrderData();
  }, []);

  const handleOrderPicked = (orderId) => {
    const updatedOrderList = orderList.map(order =>
      order.id === orderId ? { ...order, picked: true } : order
    );
    setOrderList(updatedOrderList);

    // Simulate sending confirmation to backend
    // replace with your actual backend call
    // fetch(`/api/orders/${orderId}/mark-as-picked`, {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: JSON.stringify({ orderId }),
    // });
  };

  return (
    <div>
      <h2>Pick List</h2>
      {orderList.length > 0 ? (
        <ul>
          {orderList.map(order => (
            <li key={order.id}>
              Order ID: {order.id}, Items: {order.items}, Status: {order.picked ? 'Picked' : 'Unpicked'}
              <button onClick={() => handleOrderPicked(order.id)}>Mark as Picked</button>
              <button onClick={() => setSelectedOrder(order.id)}>View Order Confirmation</button>
            </li>
          ))}
        </ul>
      ) : (
        <p>No orders found.</p>
      )}
    </div>
  );
};

export default PickList;